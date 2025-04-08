// Import the mysql2 library with promise support
const mysql = require('mysql2/promise');

// Load environment variables from a .env file
require('dotenv').config();

// Create a connection pool using environment variables for database configuration
const pool = mysql.createPool({
    host: process.env.DB_HOST, // Database host (e.g., localhost)
    user: process.env.DB_USER, // Database user
    password: process.env.DB_PASSWORD, // Database user's password
    database: process.env.DB_NAME // Name of the database
});

// Export the connection pool for use in other parts of the application
module.exports = pool;