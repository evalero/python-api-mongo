# MongoDB connection checker

Este repositorio alberga una aplicación que expone una API para insertar o consultar datos contra un backend de MongoDB. El repositorio contiene tanto la aplicación en sí como el Dockerfile para construirla

# Instalación
## En local
Se instalan los paquetes requeridos
```
pip install -r requirements.txt
```
Se establece la variable de entorno **CONNECTION_URL** con la cadena de conexión completa a la base de datos, por ejemplo:
```
CONNECTION_URL='mongodb+srv://<user>:<password>@test-atlas-mongodb-agcy2.mongodb.net/test?retryWrites=true'

```
Y se lanza la aplicación:
```
python mongoapi.py
```
## Dockerizado
docker build -t mongoapi .
docker run -e "CONNECTION_URL='mongodb+srv://<user>:<password>@test-atlas-mongodb-agcy2.mongodb.net/test?retryWrites=true'" -P 8080:5000 mongoapi:latest

La aplicación levanta le puerto **5000** para recibir las peticiones.

Solamente se encuentra disponible el siguiente servicio:

| Endpoint| Método | Acción  |
|---------|:------:|:--------|
| policy  | GET    | Obtiene todas las pólizas |
| policy  | POST   | Inserta una póliza con formato como el de abajo como mínimo |

{ "name": "Nombre, "surname" : "Apellido"}
