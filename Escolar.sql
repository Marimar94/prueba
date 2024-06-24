CREATE DATABASE EduControl;
USE EduControl;

CREATE TABLE Roles (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(50) UNIQUE
);

INSERT INTO Roles (nombreRol) VALUES ('admin'), ('profesor');

CREATE TABLE Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    matricula VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    contraseña VARCHAR(255),
    idRol INT,
    FOREIGN KEY (idRol) REFERENCES Roles(idRol)
);

CREATE TABLE Materias (
    idMateria INT AUTO_INCREMENT PRIMARY KEY,
    nombreMateria VARCHAR(255) NOT NULL UNIQUE,
    descripcion TEXT,
    cuatrimestre INT
);

CREATE INDEX idx_nombre ON Materias(nombreMateria);
CREATE INDEX idx_cuatrimestre ON Materias(cuatrimestre);

CREATE TABLE Asistencias (
    idAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT NOT NULL,
    fecha DATE NOT NULL,
    asistio BOOLEAN NOT NULL,
    FOREIGN KEY (usuarioId) REFERENCES Usuarios(idUsuario)
);

CREATE INDEX idx_usuario_fecha ON Asistencias(usuarioId, fecha);
