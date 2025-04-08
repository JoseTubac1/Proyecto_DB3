const express = require('express'); // Importa el módulo de Express
const router = express.Router(); // Crea un enrutador para manejar rutas
const ctrl = require('../controllers/productosController'); // Importa el controlador de productos (parece no utilizado)

const productosController = require('../controllers/productosController'); // Importa el controlador de productos

// Define la ruta para crear un producto (POST /)
router.post('/', productosController.crearProducto);

// Define la ruta para actualizar un producto por ID (PUT /:id)
router.put('/:id', productosController.actualizarProducto);

// Define la ruta para eliminar un producto por ID (DELETE /:id)
router.delete('/:id', productosController.eliminarProducto);

// Define la ruta para obtener un producto por ID (GET /:id)
router.get('/:id', productosController.obtenerProductoPorId);

module.exports = router; // Exporta el enrutador para usarlo en otras partes de la aplicación

