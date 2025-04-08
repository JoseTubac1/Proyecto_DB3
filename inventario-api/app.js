// Carga las variables de entorno desde un archivo .env
require('dotenv').config();

// Importa el framework Express
const express = require('express');

// Importa el middleware CORS para manejar solicitudes de origen cruzado
const cors = require('cors');

// Importa y ejecuta la función de conexión a MongoDB
const connectMongoDB = require('./config/mongo');
connectMongoDB(); // Establece la conexión con la base de datos MongoDB

// Importa los manejadores de rutas para productos y reportes
const productRoutes = require('./routes/productos');
const reportRoutes = require('./routes/reportes');

// Crea una instancia de la aplicación Express
const app = express();

// Habilita CORS para todas las solicitudes entrantes
app.use(cors());

// Habilita el análisis de cuerpos de solicitudes en formato JSON
app.use(express.json());

// Habilita el análisis de cuerpos de solicitudes codificados en URL
app.use(express.urlencoded({ extended: false }));

// Define la ruta para los endpoints relacionados con productos
app.use('/api/productos', productRoutes);

// Define la ruta para los endpoints relacionados con reportes
app.use('/api/reportes', reportRoutes);

// Exporta la instancia de la aplicación Express para usarla en otros archivos
module.exports = app;