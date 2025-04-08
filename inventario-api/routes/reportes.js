const express = require('express'); // Importa el módulo express
const router = express.Router(); // Crea un enrutador para manejar rutas
const ctrl = require('../controllers/reportesController'); // Importa el controlador de reportes (no utilizado aquí)

const reportesController = require('../controllers/reportesController'); // Importa el controlador de reportes

// Define una ruta para obtener un reporte general del inventario
router.get('/inventario', reportesController.reporteInventarioGeneral);

// Define una ruta para obtener un reporte de productos por ubicación
router.get('/por-ubicacion', reportesController.reporteProductosPorUbicacion);

// Define una ruta para obtener un reporte de productos con stock bajo
router.get('/stock-bajo', reportesController.reporteProductosStockBajo);

// Define una ruta para obtener un reporte de productos ordenados por precio
router.get('/por-precio', reportesController.reporteProductosPorPrecio);

// Define una ruta para obtener un reporte de transacciones
router.get('/transacciones', reportesController.reporteTransacciones);

// Define una ruta para obtener un reporte de productos agrupados por ubicación con stock disponible
router.get('/productos-ubicacion-con-stock', reportesController.reporteProductosAgrupadosPorUbicacionConStock);

module.exports = router; // Exporta el enrutador para que pueda ser utilizado en otras partes de la aplicación
