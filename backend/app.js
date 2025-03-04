const express = require("express");
const mysql = require("mysql2/promise");
const path = require("path");

const app = express();
const PORT = 3000; // Fixed port for simplicity

// Hardcoded database configuration
const dbConfig = {
    host: "localhost",
    user: "root",
    password: "Pass3012",
    database: "Malawi_Agriculture",
};

// Middleware
app.use(express.json());
app.use(express.static(path.join(__dirname, "../frontend")));

// Serve frontend
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "../frontend", "index.html"));
});

// Fetch crops available for a district
app.get("/api/recommendations", async (req, res) => {
    const { district } = req.query;

    if (!district) {
        return res.status(400).json({ error: "Invalid district parameter." });
    }

    try {
        const connection = await mysql.createConnection(dbConfig);

        // Fetch crops for the district
        const [crops] = await connection.execute(
            `SELECT c.CropName 
             FROM DistrictCrops dc
             JOIN Crops c ON dc.CropID = c.CropID
             JOIN Districts d ON dc.DistrictID = d.DistrictID
             WHERE d.DistrictName = ?`,
            [district]
        );

        await connection.end();
        res.json({ recommendations: crops.map((row) => row.CropName) });
    } catch (error) {
        console.error("Error fetching crops:", error);
        res.status(500).json({ error: "Failed to fetch crops." });
    }
});

// Fetch details for a selected crop and district
app.get("/api/fertilizers", async (req, res) => {
    const { district, crop } = req.query;

    if (!district || !crop) {
        return res.status(400).json({ error: "District and crop are required." });
    }

    try {
        const connection = await mysql.createConnection(dbConfig);

        // Fetch varieties, fertilizers, and suppliers
        const [varieties] = await connection.execute(
            `SELECT v.VarietyName 
             FROM DistrictCropVarieties dcv
             JOIN Varieties v ON dcv.VarietyID = v.VarietyID
             JOIN DistrictCrops dc ON dcv.DistrictCropID = dc.DistrictCropID
             WHERE dc.CropID = (SELECT CropID FROM Crops WHERE CropName = ?)
               AND dc.DistrictID = (SELECT DistrictID FROM Districts WHERE DistrictName = ?)`,
            [crop, district]
        );

        const [fertilizers] = await connection.execute(
            `SELECT f.FertilizerName, f.NutrientComposition 
             FROM DistrictFertilizerCrops dfc
             JOIN Fertilizers f ON dfc.FertilizerID = f.FertilizerID
             WHERE dfc.DistrictCropID = (
                 SELECT dc.DistrictCropID 
                 FROM DistrictCrops dc
                 WHERE dc.CropID = (SELECT CropID FROM Crops WHERE CropName = ?)
                   AND dc.DistrictID = (SELECT DistrictID FROM Districts WHERE DistrictName = ?)
             )`,
            [crop, district]
        );

        const [suppliers] = await connection.execute(
            `SELECT SupplierName, ContactInfo 
             FROM Suppliers WHERE DistrictID = (
                 SELECT DistrictID FROM Districts WHERE DistrictName = ?
             )`,
            [district]
        );

        await connection.end();
        res.json({
            varieties: varieties.map((row) => row.VarietyName),
            fertilizers: fertilizers.map((row) => ({
                name: row.FertilizerName,
                composition: row.NutrientComposition,
            })),
            suppliers: suppliers.map((row) => ({
                name: row.SupplierName,
                contact: row.ContactInfo,
            })),
        });
    } catch (error) {
        console.error("Error fetching fertilizers:", error);
        res.status(500).json({ error: "Failed to fetch recommendations." });
    }
});

// Handle unmatched routes
app.use((req, res) => {
    res.status(404).json({ error: "Route not found." });
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
