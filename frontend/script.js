// Global variable to track the selected district
let selectedDistrict = "";

// Utility function to show a section
function showSection(sectionId) {
    document.querySelectorAll(".section").forEach((section) => {
        section.classList.add("hidden");
    });
    const section = document.getElementById(sectionId);
    section.classList.remove("hidden");
    updateNavigationButtons(sectionId);
}

// Update navigation buttons visibility
function updateNavigationButtons(currentSectionId) {
    const backButton = document.getElementById("backButton");
    const forwardButton = document.getElementById("forwardButton");

    if (currentSectionId === "districtSection") {
        backButton.classList.add("hidden");
        forwardButton.classList.add("hidden");
    } else if (currentSectionId === "cropSection") {
        backButton.classList.remove("hidden");
        forwardButton.classList.add("hidden");
    } else if (currentSectionId === "recommendationSection") {
        backButton.classList.remove("hidden");
        forwardButton.classList.add("hidden");
    }
}

// Show loading spinner
function showLoading() {
    document.getElementById("loadingSpinner").classList.remove("hidden");
}

// Hide loading spinner
function hideLoading() {
    document.getElementById("loadingSpinner").classList.add("hidden");
}

// Event listener for district selection
document.getElementById("getCrops").addEventListener("click", async () => {
    const district = document.getElementById("districtSelect").value;
    if (!district) {
        alert("Please select a district.");
        return;
    }

    // Store the selected district
    selectedDistrict = district;

    showLoading();
    try {
        const response = await fetch(`/api/recommendations?district=${district}`);
        if (!response.ok) throw new Error("Failed to fetch crops. Please try again.");
        const data = await response.json();
        displayCrops(district, data.recommendations);
    } catch (error) {
        console.error("Error fetching crops:", error);
        alert("An error occurred while fetching crops. Please check your internet connection and try again.");
    } finally {
        hideLoading();
    }
});

// Display crop options dynamically
function displayCrops(district, crops) {
    const cropSectionTitle = document.getElementById("cropSectionTitle");
    cropSectionTitle.textContent = `Available Crops in ${district}`; // Set title for crops section

    const cropButtons = document.getElementById("cropButtons");
    cropButtons.innerHTML = "";

    if (crops.length === 0) {
        cropButtons.innerHTML = "<p>No crops available for the selected district.</p>";
        return;
    }

    crops.forEach((crop) => {
        const button = createButton(crop, "crop-button", () => fetchVarieties(district, crop));
        cropButtons.appendChild(button);
    });

    showSection("cropSection");
}

// Fetch varieties for the selected crop
async function fetchVarieties(district, crop) {
    showLoading();
    try {
        const response = await fetch(`/api/fertilizers?district=${district}&crop=${crop}`);
        if (!response.ok) throw new Error("Failed to fetch varieties. Please try again.");
        const data = await response.json();
        displayVarieties(district, crop, data.varieties);
    } catch (error) {
        console.error("Error fetching varieties:", error);
        alert("An error occurred while fetching varieties. Please check your internet connection and try again.");
    } finally {
        hideLoading();
    }
}

// Display available varieties dynamically
function displayVarieties(district, crop, varieties) {
    const recommendationTitle = document.getElementById("recommendationTitle");
    recommendationTitle.textContent = `Recommended Varieties for ${crop} in ${district}`; // Correctly update the title

    const varietiesContent = document.getElementById("varietiesContent");
    const varietiesSection = document.getElementById("varieties");
    const fertilizersSection = document.getElementById("fertilizers");
    const suppliersSection = document.getElementById("suppliers");

    // Populate varieties content
    varietiesContent.innerHTML = "";
    varieties.forEach((variety) => {
        const button = createButton(variety, "variety-button", () =>
            fetchRecommendations(district, crop, variety)
        );
        varietiesContent.appendChild(button);
    });

    // Show the "Recommended Varieties" section and hide others
    varietiesSection.style.display = "block";
    fertilizersSection.style.display = "none";
    suppliersSection.style.display = "none";

    showSection("recommendationSection");
}

// Fetch recommendations for the selected variety
async function fetchRecommendations(district, crop, variety) {
    showLoading();
    try {
        const response = await fetch(
            `/api/fertilizers?district=${district}&crop=${crop}&variety=${variety}`
        );
        if (!response.ok) throw new Error("Failed to fetch recommendations. Please try again.");
        const data = await response.json();
        displayRecommendations(district, variety, data);
    } catch (error) {
        console.error("Error fetching recommendations:", error);
        alert("An error occurred while fetching recommendations. Please check your internet connection and try again.");
    } finally {
        hideLoading();
    }
}

// Display recommendations dynamically
function displayRecommendations(district, variety, data) {
    const recommendationTitle = document.getElementById("recommendationTitle");
    recommendationTitle.textContent = `Recommendations for ${variety} in ${district}`; // Correct title

    const varietiesSection = document.getElementById("varieties");
    const fertilizersContent = document.getElementById("fertilizersContent");
    const suppliersContent = document.getElementById("suppliersContent");
    const fertilizersSection = document.getElementById("fertilizers");
    const suppliersSection = document.getElementById("suppliers");

    // Hide the "Recommended Varieties" section
    varietiesSection.style.display = "none";

    // Populate fertilizers content
    fertilizersContent.innerHTML =
        data.fertilizers.length > 0
            ? data.fertilizers.map((f) => `<p>${f.name} - ${f.composition}</p>`).join("")
            : "<p>No fertilizers available for this variety.</p>";

    // Populate suppliers content
    suppliersContent.innerHTML =
        data.suppliers.length > 0
            ? data.suppliers.map((s) => `<p>${s.name} - Contact: ${s.contact}</p>`).join("")
            : "<p>No suppliers available in this district.</p>";

    // Show fertilizers and suppliers sections
    fertilizersSection.style.display = "block";
    suppliersSection.style.display = "block";

    showSection("recommendationSection");
}

// Utility function to create buttons dynamically
function createButton(text, className, onClick) {
    const button = document.createElement("button");
    button.textContent = text;
    button.className = className;
    button.setAttribute("aria-label", text);
    button.onclick = onClick;
    return button;
}

// Event listener for back button
document.getElementById("backButton").addEventListener("click", () => {
    const currentSection = document.querySelector(".section:not(.hidden)").id;
    const cropSectionTitle = document.getElementById("cropSectionTitle");

    if (currentSection === "cropSection") {
        cropSectionTitle.textContent = `Available Crops in ${selectedDistrict}`; // Restore the district title
        showSection("districtSection");
    } else if (currentSection === "recommendationSection") {
        cropSectionTitle.textContent = `Available Crops in ${selectedDistrict}`; // Restore title for crops
        showSection("cropSection");
    }
});

// Event listener for forward button
document.getElementById("forwardButton").addEventListener("click", () => {
    const currentSection = document.querySelector(".section:not(.hidden)").id;
    if (currentSection === "districtSection") {
        document.getElementById("getCrops").click();
    } else if (currentSection === "cropSection") {
        const cropButtons = document.querySelectorAll(".crop-button");
        if (cropButtons.length > 0) {
            cropButtons[0].click();
        } else {
            alert("No crops available for this district.");
        }
    }
});