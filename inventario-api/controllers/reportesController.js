const express = require('express'); // Importa el módulo de Express
const router = express.Router(); // Crea un enrutador de Express
const db = require('../config/mysql'); // Importa la configuración de la base de datos MySQL

// Reporte de inventario general
// Obtiene todos los registros del reporte de inventario general
exports.reporteInventarioGeneral = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM ReporteInventario'); // Consulta a la base de datos
    res.json(rows); // Devuelve los resultados en formato JSON
  } catch (err) {
    res.status(500).json({ error: err.message }); // Manejo de errores
  }
};

// Reporte de productos por ubicación
// Obtiene los productos agrupados por ubicación
exports.reporteProductosPorUbicacion = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM ReportePorUbicacion'); // Consulta a la base de datos
    res.json(rows); // Devuelve los resultados en formato JSON
  } catch (err) {
    res.status(500).json({ error: err.message }); // Manejo de errores
  }
};

// Productos con stock bajo
// Obtiene los productos cuyo stock está por debajo del nivel mínimo
exports.reporteProductosStockBajo = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM ReporteStockBajo'); // Consulta a la base de datos
    res.json(rows); // Devuelve los resultados en formato JSON
  } catch (err) {
    res.status(500).json({ error: err.message }); // Manejo de errores
  }
};

// Productos en rango de precio
// Obtiene los productos que están dentro de un rango de precios
exports.reporteProductosPorPrecio = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM ReportePorPrecio'); // Consulta a la base de datos
    res.json(rows); // Devuelve los resultados en formato JSON
  } catch (err) {
    res.status(500).json({ error: err.message }); // Manejo de errores
  }
};

// Reporte de transacciones
// Obtiene todas las transacciones registradas
exports.reporteTransacciones = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM ReporteTransacciones'); // Consulta a la base de datos
    res.json(rows); // Devuelve los resultados en formato JSON
  } catch (err) {
    res.status(500).json({ error: err.message }); // Manejo de errores
  }
};

// Productos agrupados por ubicación
// Obtiene los productos agrupados por ubicación junto con su stock
exports.reporteProductosAgrupadosPorUbicacionConStock = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM ProductosPorUbicacion'); // Consulta a la base de datos
    res.json(rows); // Devuelve los resultados en formato JSON
  } catch (err) {
    res.status(500).json({ error: err.message }); // Manejo de errores
  }
};
