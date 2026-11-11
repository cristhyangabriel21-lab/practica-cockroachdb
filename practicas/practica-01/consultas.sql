
-- ==========================================
-- PRACTICA 01 - COCKROACHDB
-- Base de datos: movr
-- Version: CockroachDB v22.1.10
-- ==========================================

-- 1. Comprobar la version de CockroachDB
SELECT version();

-- 2. Seleccionar la base de datos
USE movr;

-- 3. Mostrar las tablas de la base de datos
SHOW TABLES;

-- 4. Consultar la estructura de la tabla users
SHOW CREATE TABLE users;

-- 5. Contar las columnas de cada tabla
SELECT table_name, COUNT(*) AS total_columnas
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name
ORDER BY table_name;

-- 6. Consultar vehiculos por ciudad y estado
SELECT city, status, COUNT(*) AS total_vehiculos
FROM vehicles
GROUP BY city, status
ORDER BY city, status;

-- 7. Consultar usuarios y viajes por ciudad
SELECT u.city, COUNT(r.id) AS total_viajes,
       SUM(r.revenue) AS ingresos
FROM users u
JOIN rides r
  ON u.city = r.city
 AND u.id = r.rider_id
GROUP BY u.city
ORDER BY u.city;

-- 8. Consultar usuarios
SELECT city, id, name
FROM users
ORDER BY city, name;

-- 9. Analizar una consulta utilizando la ciudad
EXPLAIN SELECT * FROM users
WHERE city = 'Boston';

-- 10. Analizar una consulta utilizando el nombre
EXPLAIN SELECT * FROM users
WHERE name = 'Brian Campbell';

-- 11. Contar los viajes
SELECT COUNT(*) AS total_viajes
FROM rides;

-- 12. Consultar la configuracion de replicacion
SHOW ZONE CONFIGURATION FOR DATABASE movr;

-- 13. Consultar los rangos de la tabla users
SHOW RANGES FROM TABLE users;

-- 14. Consultar una metrica del nodo
SELECT name, value
FROM crdb_internal.node_metrics
WHERE name = 'server.time_until_store_dead';
