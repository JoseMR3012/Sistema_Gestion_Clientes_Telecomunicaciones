CREATE DATABASE dsrp_sistema_gestion_telecomunicaciones
GO
USE dsrp_sistema_gestion_telecomunicaciones;
GO
-- Creacion de tabla cliente
CREATE TABLE cliente(
id INT PRIMARY KEY IDENTITY(1,1),
factura_id INT NOT NULL,
contrato_id INT NOT NULL,
servicio_id INT NOT NULL,
numero_documento VARCHAR(200) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR (255) NOT NULL,
correo_electronico VARCHAR(200),
tipo_cliente VARCHAR(200) NOT NULL,
direccion VARCHAR (250) NOT NULL,
telefono VARCHAR (200) NOT NULL,
CONSTRAINT FK_factura_cliente FOREIGN KEY (factura_id) REFERENCES factura(id),
CONSTRAINT FK_contrato_cliente FOREIGN KEY (contrato_id) REFERENCES contrato(id),
CONSTRAINT FK_servicio_cliente FOREIGN KEY (servicio_id) REFERENCES servicio(id));
--- Tabla de Clientes agregando columnas
ALTER TABLE cliente
ADD fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME NULL,
    usuario_creador VARCHAR(250) NULL,
    usuario_modificador VARCHAR(250) NULL;
GO
--Llamada a la tabla cliente
SELECT*FROM cliente;

-- Creacion de la tabla Servicio
CREATE TABLE servicio (
id INT PRIMARY KEY IDENTITY(1,1),
nombre_servicio VARCHAR(200) NOT NULL,
precio_mensual FLOAT NOT NULL,
descuento FLOAT NOT NULL);
-- Agregando columnas Tabla de Servicios
ALTER TABLE servicio
ALTER COLUMN descuento DECIMAL(5, 2) NOT NULL;
ALTER TABLE servicio
ADD fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME NULL,
    usuario_creador VARCHAR(50) NULL;
--Agregando soporte_id en la tabla servicio
ALTER TABLE servicio
ADD soporte_id INT NOT NULL;
--Agregando soporte_id
ALTER TABLE servicio
ADD CONSTRAINT FK_soporte_servicio FOREIGN KEY (soporte_id) REFERENCES soporte_tecnico(id);
GO
--Llamada a la tabla servicio
SELECT*FROM servicio;

-- Creacion de la tabla contrato
CREATE TABLE contrato(
id INT PRIMARY KEY IDENTITY(1,1),
fecha_inicio DATE NOT NULL,
fecha_vencimiento DATE NOT NULL);
--- Tabla de Contrato agregando columnas
ALTER TABLE contrato
ADD fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME NULL;
GO
--Llamada a la tabla contrato
SELECT*FROM contrato;

--Creacion de tabla pago
CREATE TABLE pago(
id INT PRIMARY KEY IDENTITY(1,1),
fecha_pago DATE NOT NULL,
monto_pago FLOAT NOT NULL,
metodo_pago VARCHAR(200) NOT NULL);
-- Agregando columnnas de la Tabla de Pago
ALTER TABLE pago
ADD referencia_pago VARCHAR(200) NULL,
    estado_pago VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME NULL;
GO
--Llamada a la tabla pago
SELECT*FROM pago;

--Creacion de tabla factura
CREATE TABLE factura(
id INT PRIMARY KEY IDENTITY(1,1),
pago_id INT NOT NULL,
fecha_emision DATE NOT NULL,
fecha_vencimiento DATE NOT NULL,
monto_total FLOAT NOT NULL,
estado_pago VARCHAR(200) NOT NULL,
CONSTRAINT FK_pago_factura FOREIGN KEY (pago_id) REFERENCES pago(id));
--Tabla factura
ALTER TABLE factura
ADD moneda VARCHAR(10) NOT NULL DEFAULT 'USD',
    descuento FLOAT DEFAULT 0.0,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME NULL,
    usuario_creador VARCHAR(50) NULL;
GO

--Llamada de tabla de factura
SELECT*FROM factura;

-- Creacion de tabla Soporte
CREATE TABLE soporte_tecnico(
id INT PRIMARY KEY IDENTITY(1,1),
fecha_solicitud DATE NOT NULL,
estado_solicitud VARCHAR(200) NOT NULL,
descripcion_problema VARCHAR(1000) NOT NULL);
--Agregando columnnas a la tabla soporte_Tecnico
ALTER TABLE soporte_tecnico
ADD fecha_resolucion DATETIME NOT NULL,
    tecnico_asignado VARCHAR(255) NOT NNULL,
    comentarios VARCHAR(1000) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME NOT NULL;
--Llamada de tabla de soporte_tecnico
SELECT*FROM soporte_tecnico;

-- Creacion de tabla intermedia
CREATE TABLE contrato_servicio (
    id INT IDENTITY(1,1) PRIMARY KEY,
    contratosv_id INT NOT NULL,
    servicio_id INT NOT NULL,
    fecha_asociacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_contrato_servicio_contrato FOREIGN KEY (contratosv_id) REFERENCES contrato(id),
    CONSTRAINT FK_contrato_servicio_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id));
GO
SELECT*FROM contrato_servicio;