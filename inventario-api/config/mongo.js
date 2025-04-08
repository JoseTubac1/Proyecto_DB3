// Importa el módulo mongoose para interactuar con MongoDB
const mongoose = require('mongoose');

// Función asíncrona para conectar a la base de datos MongoDB
const connectMongoDB = async () => {
  try {
    // Intenta conectar a MongoDB usando la URI de conexión
    await mongoose.connect(process.env.MONGO_URI || 'mongodb://localhost:27017/inventario', {
      useNewUrlParser: true, // Usa el nuevo analizador de URL
      useUnifiedTopology: true, // Usa el nuevo motor de administración de conexiones
    });
    console.log('Conexión a MongoDB exitosa'); // Mensaje de éxito en la conexión
  } catch (error) {
    // Captura y muestra cualquier error que ocurra durante la conexión
    console.error('Error al conectar a MongoDB:', error);
    process.exit(1); // Finaliza el proceso con un código de error
  }
};

// Exporta la función para que pueda ser utilizada en otros archivos
module.exports = connectMongoDB;