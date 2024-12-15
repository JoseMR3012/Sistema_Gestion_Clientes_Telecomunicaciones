CREATE DATABASE dsrp_sistema_gestion_telecomunicaciones
GO

CREATE TABLE cliente(
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(200) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
appellido_materno VARCHAR (255) NOT NULL,
correo_electronico VARCHAR(200),
tipo_cliente VARCHAR(200) NOT NULL,
direccion VARCHAR (250) NOT NULL,
telefono VARCHAR (200) NOT NULL);
GO

SELECT*FROM cliente;

