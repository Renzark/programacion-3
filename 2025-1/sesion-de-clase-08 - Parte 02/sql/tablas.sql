USE prog3;

CREATE TABLE IF NOT EXISTS AREA (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    nombre VARCHAR(50) NOT NULL, 
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS CUENTA_USUARIO (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    userName VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL, 
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS EMPLEADO (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    idArea INT NOT NULL, 
    idCuentaUsuario INT NOT NULL, 
    dni CHAR(8) NOT NULL, 
    nombre VARCHAR(50) NOT NULL, 
    apellidoPaterno VARCHAR(50) NOT NULL, 
    genero CHAR NOT NULL, 
    fechaNacimiento DATE NOT NULL, 
    cargo VARCHAR(50) NOT NULL, 
    sueldo DECIMAL(10, 2) NOT NULL, 
    activo BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_EMPLEADO_AREA 
FOREIGN KEY (idArea) REFERENCES AREA(id);

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_EMPLEADO_CUENTA_USUARIO
FOREIGN KEY (idCuentaUsuario) REFERENCES CUENTA_USUARIO(id);