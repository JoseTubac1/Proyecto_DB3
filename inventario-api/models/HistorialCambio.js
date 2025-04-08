const mongoose = require('mongoose'); // Importa el módulo mongoose para interactuar con MongoDB

// Define el esquema para el historial de cambios
const historialCambioSchema = new mongoose.Schema({
  productoId: { type: Number, required: true }, // ID del producto al que se le realizó el cambio
  cambios: { 
    type: Object, 
    required: true 
  }, // Detalles del cambio, por ejemplo: { campo: 'nombre', anterior: 'A', nuevo: 'B' }
  fecha: { 
    type: Date, 
    default: Date.now 
  }, // Fecha en la que se realizó el cambio, por defecto la fecha actual
});

// Exporta el modelo basado en el esquema para usarlo en otras partes de la aplicación
module.exports = mongoose.model('HistorialCambio', historialCambioSchema);