# Proyecto_DB3
## Guía para ejecutar el proyecto

### 1. Configuración del archivo `.env`
1. Cree un archivo `.env` en el directorio raíz del backend `inventario-api`.
2. Incluya las siguientes variables de entorno con los valores correspondientes a su configuración local:
    ```ini
    # Configuración de la base de datos MySQL
    DB_HOST=localhost
    DB_PORT=3306
    DB_USER=root
    DB_PASSWORD=admin123
    DB_NAME=proyecto_db3

    # Configuración de MongoDB
    MONGO_URI=mongodb://localhost:27017/proyecto_db3_mongo

    # Configuración del servidor
    PORT=3000
    ```
3. **Cambios necesarios en el archivo `.env**:
    
    - **DB_HOST**: Cambie este valor si su servidor MySQL no está en `localhost`.
    - **DB_PORT**: Ajuste este valor si su servidor MySQL utiliza un puerto diferente al `3306`.
    - **DB_USER** y **DB_PASSWORD**: Reemplace estos valores con las credenciales de su usuario de MySQL.
    - **DB_NAME**: Cambie este valor si el nombre de su base de datos es diferente a `proyecto_db3`.
    - **MONGO_URI**: Modifique este valor si su instancia de MongoDB no está en `localhost` o utiliza un puerto diferente al `27017`.
    - **PORT**: Cambie este valor si desea que el backend escuche en un puerto diferente al `3000`.

> ⚠️ **Advertencia**:
> - Asegúrese de no compartir este archivo `.env` públicamente, ya que contiene información sensible como contraseñas y configuraciones de conexión.
> - Si sube el proyecto a un repositorio público, agregue el archivo `.env` al archivo `.gitignore` para evitar su inclusión en el control de versiones.

---

### 2. Cargar el backup de la base de datos MySQL
1. Abra **MySQL Workbench**.
2. Vaya a la opción `Server > Data Import`.
3. Seleccione la opción **Import from Self-Contained File** y busque el archivo `Proyecto_DB3.sql`.
4. Seleccione la base de datos de destino o cree una nueva base de datos.
5. Haga clic en **Start Import** para cargar el backup.

---

### 3. Cargar el backup de MongoDB
1. Abra **MongoDB Compass**.
2. Haga clic en el botón **Import Data** en la colección deseada o cree una nueva colección.
3. Seleccione el archivo `backup-mongodb.json`.
4. Configure las opciones de importación según sea necesario y haga clic en **Import**.

---

### 4. Cargar las pruebas en Postman
1. Abra **Postman**.
2. Haga clic en el botón **Import** en la esquina superior izquierda.
3. Seleccione el archivo `Proyecto_DB3_.postman_collection.json`.
4. Las pruebas se cargarán automáticamente en su espacio de trabajo.

---

### 5. Ejecutar el backend (API)
1. Asegúrese de tener **Node.js** instalado en su sistema.
2. Navegue al directorio del backend `inventario-api` desde la terminal.
3. Ejecute los siguientes comandos:
    ```bash
    npm install
    npm start
    ```
4. El backend estará disponible en `http://localhost:3000`.

---

### Notas adicionales
- Asegúrese de que los servicios de MySQL y MongoDB estén en ejecución antes de iniciar el backend.
- Verifique las configuraciones de conexión en el archivo `.env` del backend para asegurarse de que coincidan con su entorno local.
- Si encuentra problemas, revise los logs en la terminal para identificar posibles errores.
