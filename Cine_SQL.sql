CREATE DATABASE IF NOT EXISTS cine_db;
USE cine_db;

CREATE TABLE pelicula (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    duracion VARCHAR(50),
    clasificacion VARCHAR(10)
);
-- ... (el resto de tu código igual)

CREATE TABLE pelicula (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    duracion VARCHAR(50),
    clasificacion VARCHAR(10)
);

CREATE TABLE funcion (
    funcion_id INT AUTO_INCREMENT PRIMARY KEY,
    sala VARCHAR(50),
    horario VARCHAR(50),
    pelicula_id INT,
    CONSTRAINT fk_funcion_pelicula 
        FOREIGN KEY (pelicula_id) REFERENCES pelicula(pelicula_id)
);

CREATE TABLE boleto (
    boleto_id INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT,
    precio DECIMAL(10,2),
    funcion_id INT,
    CONSTRAINT fk_boleto_funcion 
        FOREIGN KEY (funcion_id) REFERENCES funcion(funcion_id)
);

CREATE TABLE usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    boleto_id INT,
    CONSTRAINT fk_usuario_boleto 
        FOREIGN KEY (boleto_id) REFERENCES boleto(boleto_id)
);

INSERT INTO pelicula (nombre, duracion, clasificacion) 
VALUES ('Inception', '148 min', 'B'), 
       ('Matrix', '136 min', 'B');

INSERT INTO usuario (nombre, contraseña, boleto_id) 
VALUES ('Ana López', 'password123', NULL), 
       ('Carlos Pérez', 'securePass456', NULL);
       
