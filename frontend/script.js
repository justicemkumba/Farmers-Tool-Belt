// Global variable to track the selected district
let selectedDistrict = "";

// Event listener for the header title to reset the app to the home page
document.getElementById("headerTitle").addEventListener("click", () => {
    resetAppToHome();
});

// Function to reset the app to the home page
function resetAppToHome() {
    // Reset the selected district
    selectedDistrict = "";

    // Clear any selected values in the dropdown
    document.getElementById("districtSelect").value = "";

    // Clear dynamically generated content
    document.getElementById("cropButtons").innerHTML = "";
    document.getElementById("varietiesContent").innerHTML = "";
    document.getElementById("fertilizersContent").innerHTML = "";
    document.getElementById("suppliersContent").innerHTML = "";

    // Hide all sections except the district selection section
    showSection("districtSection");

    // Reset the title of the crop section
    document.getElementById("cropSectionTitle").textContent = "Available Crops";

    // Reset the title of the recommendations section
    document.getElementById("recommendationTitle").textContent = "Crop Recommendations";
}

// Utility function to show a section and hide others
function showSection(sectionId) {
    // Hide all sections
    document.querySelectorAll(".section").forEach((section) => {
        section.classList.add("hidden");
    });
    // Show the requested section
    const section = document.getElementById(sectionId);
    section.classList.remove("hidden");
    // Update navigation buttons based on the current section
    updateNavigationButtons(sectionId);
}

// Update navigation buttons visibility based on the current section
function updateNavigationButtons(currentSectionId) {
    const backButton = document.getElementById("backButton");
    const forwardButton = document.getElementById("forwardButton");

    if (currentSectionId === "districtSection") {
        // Hide both buttons on the district selection page
        backButton.classList.add("hidden");
        forwardButton.classList.add("hidden");
    } else if (currentSectionId === "cropSection") {
        // Show back button and hide forward button on the crop selection page
        backButton.classList.remove("hidden");
        forwardButton.classList.add("hidden");
    } else if (currentSectionId === "recommendationSection") {
        // Show back button and hide forward button on the recommendations page
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

    // Store the selected district globally
    selectedDistrict = district;

    showLoading();
    try {
        // Fetch crop recommendations for the selected district
        const response = await fetch(`/api/recommendations?district=${district}`);
        if (!response.ok) throw new Error("Failed to fetch crops. Please try again.");
        const data = await response.json();
        // Display the fetched crops
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
    // Update the title of the crop section with the selected district
    const cropSectionTitle = document.getElementById("cropSectionTitle");
    cropSectionTitle.textContent = `Available Crops in ${district}`;

    // Clear existing crop buttons
    const cropButtons = document.getElementById("cropButtons");
    cropButtons.innerHTML = "";

    if (crops.length === 0) {
        // Display a message if no crops are available
        cropButtons.innerHTML = "<p>No crops available for the selected district.</p>";
        return;
    }

    // Create buttons for each crop and add them to the crop section
    crops.forEach((crop) => {
        const button = createButton(crop, "crop-button", () => fetchVarieties(district, crop));
        cropButtons.appendChild(button);
    });

    // Show the crop selection section
    showSection("cropSection");
}

// Fetch varieties for the selected crop
async function fetchVarieties(district, crop) {
    showLoading();
    try {
        // Fetch varieties for the selected crop and district
        const response = await fetch(`/api/fertilizers?district=${district}&crop=${crop}`);
        if (!response.ok) throw new Error("Failed to fetch varieties. Please try again.");
        const data = await response.json();
        // Display the fetched varieties
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
    // Update the title of the recommendations section
    const recommendationTitle = document.getElementById("recommendationTitle");
    recommendationTitle.textContent = `Recommended Varieties for ${crop} in ${district}`;

    const varietiesContent = document.getElementById("varietiesContent");
    const varietiesSection = document.getElementById("varieties");
    const fertilizersSection = document.getElementById("fertilizers");
    const suppliersSection = document.getElementById("suppliers");

    // Clear existing variety buttons
    varietiesContent.innerHTML = "";
    // Create buttons for each variety and add them to the varieties section
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

    // Show the recommendations section
    showSection("recommendationSection");
}

// Fetch recommendations for the selected variety
async function fetchRecommendations(district, crop, variety) {
    showLoading();
    try {
        // Fetch recommendations for the selected variety
        const response = await fetch(
            `/api/fertilizers?district=${district}&crop=${crop}&variety=${variety}`
        );
        if (!response.ok) throw new Error("Failed to fetch recommendations. Please try again.");
        const data = await response.json();
        // Display the fetched recommendations
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
    // Update the title of the recommendations section
    const recommendationTitle = document.getElementById("recommendationTitle");
    recommendationTitle.textContent = `Recommendations for ${variety} in ${district}`;

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

    // Show the recommendations section
    showSection("recommendationSection");
}

// Utility function to create buttons dynamically
function createButton(text, className, onClick) {
    const button = document.createElement("button");
    button.textContent = text;
    button.className = className;
    button.setAttribute("aria-label", text); // Accessibility improvement
    button.onclick = onClick; // Attach click event handler
    return button;
}

// Event listener for back button
document.getElementById("backButton").addEventListener("click", () => {
    const currentSection = document.querySelector(".section:not(.hidden)").id;
    const cropSectionTitle = document.getElementById("cropSectionTitle");

    if (currentSection === "cropSection") {
        // Go back to the district selection page
        cropSectionTitle.textContent = `Available Crops in ${selectedDistrict}`;
        showSection("districtSection");
    } else if (currentSection === "recommendationSection") {
        // Go back to the crop selection page
        cropSectionTitle.textContent = `Available Crops in ${selectedDistrict}`;
        showSection("cropSection");
    }
});

// Event listener for forward button
document.getElementById("forwardButton").addEventListener("click", () => {
    const currentSection = document.querySelector(".section:not(.hidden)").id;
    if (currentSection === "districtSection") {
        // Simulate a click on the "View Crop Options" button
        document.getElementById("getCrops").click();
    } else if (currentSection === "cropSection") {
        // Simulate a click on the first crop button
        const cropButtons = document.querySelectorAll(".crop-button");
        if (cropButtons.length > 0) {
            cropButtons[0].click();
        } else {
            alert("No crops available for this district.");
        }
    }
});