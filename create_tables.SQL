--psql --host=localhost --username=postgres



DROP DATABASE localidades;
CREATE DATABASE localidades;
-- Conectar a la base de datos
\c localidades

-- Crear tabla país
CREATE TABLE pais (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla departamento
CREATE TABLE departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_id INTEGER,
    FOREIGN KEY (pais_id) REFERENCES pais(id)
);

-- Crear tabla municipio
CREATE TABLE municipio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento_id INTEGER NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);

-- Crear tabla localidades
CREATE TABLE localidades (    
    departamento_id INTEGER NOT NULL,   
    departamentoName VARCHAR(100),
    municipio_id INTEGER NOT NULL,      
    municipioName VARCHAR(100)
);


INSERT INTO departamento (id, nombre)
SELECT DISTINCT departamento_id, departamentoName
FROM localidades
ORDER BY departamento_id ASC;


INSERT INTO municipio (id, nombre, departamento_id)
SELECT DISTINCT municipio_id, municipioName, departamento_id
FROM localidades
ORDER BY municipioName ASC;

-- ALTER TABLE localidades ADD CONSTRAINT fk_localidades_departamento FOREIGN KEY (departamento_id)
-- REFERENCES departamento(id);

-- CREATE TABLE localidades (
--     id SERIAL PRIMARY KEY,
--     departamento_id INTEGER NOT NULL,
--     FOREIGN KEY (departamento_id) REFERENCES departamento(id),
--     departamentoName VARCHAR(100),
--     municipio_id INTEGER NOT NULL,
--     FOREIGN KEY (municipio_id)  REFERENCES municipio(id),    
--     municipioName VARCHAR(100)
-- );