
# Práctica 01 - Laboratorio CockroachDB

## 1. Información general

- **Base de datos:** movr
- **Sistema:** CockroachDB
- **Versión:** v22.1.10
- **Puerto SQL:** 26258
- **Puerto consola web:** 8080
- **Entorno:** Windows PowerShell

## 2. Objetivo

Realizar consultas SQL sobre la base de datos movr, analizar sus planes de ejecución, revisar la configuración de replicación y comprobar el estado del nodo de CockroachDB.

## 3. Actividades realizadas

- Verificación de la versión de CockroachDB.
- Exploración de la base de datos movr y sus tablas.
- Consulta de la estructura de la tabla users.
- Consultas de agrupación y unión entre tablas.
- Análisis de consultas mediante EXPLAIN.
- Conteo de registros de la tabla rides.
- Revisión de la configuración de replicación.
- Consulta de rangos de la tabla users.
- Comprobación del estado del nodo.
- Detención y reinicio del servidor para verificar la persistencia de los datos.

## 4. Resultados obtenidos

- Se identificaron 6 tablas en la base de datos movr.
- La tabla users utiliza una clave primaria compuesta por city e id.
- La tabla rides contiene 500 registros.
- La base de datos tiene configurada una réplica por rango.
- Se comprobó un único nodo, con ID 1.
- El nodo presentó los estados is_live = true e is_available = true.
- La tabla users contiene 50 usuarios.
- Después de reiniciar el servidor, se verificó la persistencia de los datos.

## 5. Observaciones

La consulta por ciudad utilizó el índice de la clave primaria, mientras que la consulta por nombre realizó un FULL SCAN.

Durante la revisión de los rangos se observó que las réplicas estaban asignadas al nodo 1.

Al detener el único nodo, las conexiones dejaron de estar disponibles. Después de iniciar nuevamente el servidor, se pudo acceder a la base de datos y consultar los registros.

## 6. Evidencias

Las capturas de pantalla de las actividades realizadas se encuentran en la carpeta `capturas`.

## 7. Archivos

- `consultas.sql`: contiene las consultas SQL utilizadas durante la práctica.
- `README.md`: contiene la descripción de las actividades y los resultados.
- `capturas/`: contiene las evidencias del laboratorio.
