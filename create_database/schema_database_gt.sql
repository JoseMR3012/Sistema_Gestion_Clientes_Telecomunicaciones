USE [master]
GO
/****** Object:  Database [dsrp_sistema_gestion_telecomunicaciones]    Script Date: 17/12/2024 05:47:12 ******/
CREATE DATABASE [dsrp_sistema_gestion_telecomunicaciones]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dsrp_sistema_gestion_telecomunicaciones', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dsrp_sistema_gestion_telecomunicaciones.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dsrp_sistema_gestion_telecomunicaciones_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dsrp_sistema_gestion_telecomunicaciones_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dsrp_sistema_gestion_telecomunicaciones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET RECOVERY FULL 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET  MULTI_USER 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dsrp_sistema_gestion_telecomunicaciones', N'ON'
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET QUERY_STORE = ON
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dsrp_sistema_gestion_telecomunicaciones]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 17/12/2024 05:47:12 ******/
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
/****** Object:  Table [dbo].[contrato]    Script Date: 17/12/2024 05:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 17/12/2024 05:47:12 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 17/12/2024 05:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_pago] [date] NOT NULL,
	[monto_pago] [float] NOT NULL,
	[metodo_pago] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 17/12/2024 05:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [varchar](200) NOT NULL,
	[precio_mensual] [float] NOT NULL,
	[descuento] [float] NOT NULL,
	[soporte_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[soporte_tecnico]    Script Date: 17/12/2024 05:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[soporte_tecnico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_solicitud] [date] NOT NULL,
	[estado_solicitud] [varchar](200) NOT NULL,
	[descripcion_problema] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [dsrp_sistema_gestion_telecomunicaciones] SET  READ_WRITE 
GO
