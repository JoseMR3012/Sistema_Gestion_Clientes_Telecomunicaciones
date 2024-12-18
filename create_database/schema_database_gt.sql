USE [dsrp_sistema_gestion_telecomunicaciones]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[factura_id] [int] NOT NULL,
	[contrato_id] [int] NOT NULL,
	[servicio_id] [int] NOT NULL,
	[numero_documento] [varchar](200) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[correo_electronico] [varchar](200) NULL,
	[tipo_cliente] [varchar](200) NOT NULL,
	[direccion] [varchar](250) NOT NULL,
	[telefono] [varchar](200) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
	[usuario_creador] [varchar](250) NULL,
	[usuario_modificador] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contrato]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contrato_servicio]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato_servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contratosv_id] [int] NOT NULL,
	[servicio_id] [int] NOT NULL,
	[fecha_asociacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pago_id] [int] NOT NULL,
	[fecha_emision] [date] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[monto_total] [float] NOT NULL,
	[estado_pago] [varchar](200) NOT NULL,
	[moneda] [varchar](10) NOT NULL,
	[descuento] [float] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
	[usuario_creador] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_pago] [date] NOT NULL,
	[monto_pago] [float] NOT NULL,
	[metodo_pago] [varchar](200) NOT NULL,
	[referencia_pago] [varchar](200) NULL,
	[estado_pago] [varchar](50) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [varchar](200) NOT NULL,
	[precio_mensual] [float] NOT NULL,
	[descuento] [decimal](5, 2) NOT NULL,
	[soporte_id] [int] NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
	[usuario_creador] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[soporte_tecnico]    Script Date: 19/12/2024 05:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[soporte_tecnico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_solicitud] [date] NOT NULL,
	[estado_solicitud] [varchar](200) NOT NULL,
	[descripcion_problema] [varchar](1000) NOT NULL,
	[fecha_resolucion] [datetime] NULL,
	[tecnico_asignado] [varchar](255) NULL,
	[comentarios] [varchar](1000) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[contrato] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[contrato_servicio] ADD  DEFAULT (getdate()) FOR [fecha_asociacion]
GO
ALTER TABLE [dbo].[factura] ADD  DEFAULT ('USD') FOR [moneda]
GO
ALTER TABLE [dbo].[factura] ADD  DEFAULT ((0.0)) FOR [descuento]
GO
ALTER TABLE [dbo].[factura] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[pago] ADD  DEFAULT ('Pendiente') FOR [estado_pago]
GO
ALTER TABLE [dbo].[pago] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[servicio] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[soporte_tecnico] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_contrato_cliente] FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_contrato_cliente]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_factura_cliente] FOREIGN KEY([factura_id])
REFERENCES [dbo].[factura] ([id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_factura_cliente]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_servicio_cliente] FOREIGN KEY([servicio_id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_servicio_cliente]
GO
ALTER TABLE [dbo].[contrato_servicio]  WITH CHECK ADD  CONSTRAINT [FK_contrato_servicio_contrato] FOREIGN KEY([contratosv_id])
REFERENCES [dbo].[contrato] ([id])
GO
ALTER TABLE [dbo].[contrato_servicio] CHECK CONSTRAINT [FK_contrato_servicio_contrato]
GO
ALTER TABLE [dbo].[contrato_servicio]  WITH CHECK ADD  CONSTRAINT [FK_contrato_servicio_servicio] FOREIGN KEY([servicio_id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[contrato_servicio] CHECK CONSTRAINT [FK_contrato_servicio_servicio]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_pago_factura] FOREIGN KEY([pago_id])
REFERENCES [dbo].[pago] ([id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_pago_factura]
GO
ALTER TABLE [dbo].[servicio]  WITH CHECK ADD  CONSTRAINT [FK_soporte_servicio] FOREIGN KEY([soporte_id])
REFERENCES [dbo].[soporte_tecnico] ([id])
GO
ALTER TABLE [dbo].[servicio] CHECK CONSTRAINT [FK_soporte_servicio]
GO
