CREATE TABLE [Cliente] (
	[ID_Cliente] int NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Correo_Electrónico] nvarchar(max) NOT NULL,
	[Tipo_Cliente] nvarchar(max) NOT NULL,
	[Direccion] nvarchar(max) NOT NULL,
	[Telefono] nvarchar(max) NOT NULL,
	PRIMARY KEY ([ID_Cliente])
);

CREATE TABLE [Servicio] (
	[ID_Servicio] int NOT NULL,
	[Nombre_Servicio] nvarchar(max) NOT NULL,
	[Precio_Mensual] decimal(18,0) NOT NULL,
	[Descuento] decimal(18,0) NOT NULL,
	PRIMARY KEY ([ID_Servicio])
);

CREATE TABLE [Contrato] (
	[ID_Contrato] int NOT NULL,
	[ID_Cliente] int NOT NULL,
	[Fecha_Inicio] date NOT NULL,
	[Fecha_Termino] date NOT NULL,
	PRIMARY KEY ([ID_Contrato])
);

CREATE TABLE [Factura] (
	[ID_Factura] int NOT NULL,
	[ID_Cliente] int NOT NULL,
	[Fecha_Vencimiento] date NOT NULL,
	[Monto_Total] decimal(18,0) NOT NULL,
	[Estado_Pago] nvarchar(max) NOT NULL,
	[Fecha_Emision] date NOT NULL,
	PRIMARY KEY ([ID_Factura])
);

CREATE TABLE [Pago] (
	[ID_Pago] int NOT NULL,
	[ID_Factura] int NOT NULL,
	[Fecha_Pago] date NOT NULL,
	[Monto_Pago] decimal(18,0) NOT NULL,
	[Método_Pago] nvarchar(max) NOT NULL,
	PRIMARY KEY ([ID_Pago])
);

CREATE TABLE [Soporte_Tecnico] (
	[ID_Soporte] int NOT NULL,
	[ID_Cliente] int NOT NULL,
	[ID_Servicio] int NOT NULL,
	[Fecha_Solicitud] date NOT NULL,
	[Estado_Solicitud] nvarchar(max) NOT NULL,
	[Descripcion_Problema] nvarchar(max) NOT NULL,
	PRIMARY KEY ([ID_Soporte])
);



ALTER TABLE [Contrato] ADD CONSTRAINT [Contrato_fk1] FOREIGN KEY ([ID_Cliente]) REFERENCES [Cliente]([ID_Cliente]);
ALTER TABLE [Factura] ADD CONSTRAINT [Factura_fk1] FOREIGN KEY ([ID_Cliente]) REFERENCES [Cliente]([ID_Cliente]);
ALTER TABLE [Pago] ADD CONSTRAINT [Pago_fk1] FOREIGN KEY ([ID_Factura]) REFERENCES [Factura]([ID_Factura]);
ALTER TABLE [Soporte_Tecnico] ADD CONSTRAINT [Soporte_Tecnico_fk1] FOREIGN KEY ([ID_Cliente]) REFERENCES [Cliente]([ID_Cliente]);

ALTER TABLE [Soporte_Tecnico] ADD CONSTRAINT [Soporte_Tecnico_fk2] FOREIGN KEY ([ID_Servicio]) REFERENCES [Servicio]([ID_Servicio]);