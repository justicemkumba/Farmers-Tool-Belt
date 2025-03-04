# Farmers Tool Belt Web Application

=================================

# Overview

---

The Farmers Tool Belt is a web application designed to provide district-specific recommendations for crops, crop varieties, and verified suppliers based on local data. The app serves as a guide for farmers to make informed decisions about farming inputs.

# Prerequisites

---

Before running the application, ensure the following are installed on your computer:

1. Node.js (Latest LTS version recommended)  
   Download: https://nodejs.org/
2. MySQL Server  
   Download: https://dev.mysql.com/downloads/
3. A Code Editor (e.g., Visual Studio Code)

# Setup Instructions

---

1. # Clone or Download the Project

   - Clone the repository:

     git clone https://github.com/justicemkumba/Farmers-Tool-Belt/tree/main

   - OR download the ZIP file and extract it to your desired location.

2. # Set Up the Database

   - Open your MySQL client (e.g., MySQL Workbench or the command line).
   - Run the provided `Malawi_Agriculture.sql` script to create and populate the database:

     SOURCE path_to_file/Malawi_Agriculture.sql;

   - Verify the database is created:

     SHOW DATABASES;
     USE Malawi_Agriculture;

3. # Install Dependencies

   - Navigate to the backend directory:

     cd backend

   - Install required dependencies:

     npm install

4. # Configure Database Connection

   - Open `app.js` in the `backend` folder.
   - Update the database credentials to match your MySQL setup:
     javascript
     const dbConfig = {
     host: "localhost",
     user: "your_mysql_username",
     password: "your_mysql_password",
     database: "Malawi_Agriculture",
     };

5. # Run the Backend Server

   - Start the backend:

     node app.js

   - You should see:

     Server running on http://localhost:3000

6. # Open web app in your browser.
   - http://localhost:3000

# Using the App

---

1. Select a district from the dropdown menu.
2. Click the "Get Recommendation" button.
3. View crop recommendations, varieties, and supplier details.

# Key Files

---

1. backend/app.js: Backend logic for handling API requests.
2. Malawi_Agriculture.sql: SQL script to create and populate the database.
3. frontend/index.html: Main user interface.
4. frontend/script.js: JavaScript logic for fetching and displaying data.
5. frontend/styles.css: Styles for the user interface.

# Troubleshooting

---

1. Backend Errors:

   - Ensure the database credentials in `app.js` are correct.
   - Verify the database exists and is populated using:

     USE Malawi_Agriculture;
     SHOW TABLES;

2. Frontend Not Loading:

   - Ensure the Server is running on http://localhost:3000,
   - 1. Verify MySQL Server is Running
        Before attempting to connect, ensure that the MySQL server is running.

     On Windows:
     Open the Services application (services.msc).

     Look for MySQL or MySQL80 in the list.

     If the service is not running, right-click and select Start.

3. API Errors (e.g., 500 or CORS issues):

   - Test the API directly via Postman or browser:

     http://localhost:3000/api/recommendations?district=Chitipa
