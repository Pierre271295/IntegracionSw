USE [master]
GO
/****** Object:  Database [Bootstrap]    Script Date: 23/05/2020 07:49:10 ******/
CREATE DATABASE [Bootstrap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bootstrap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bootstrap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bootstrap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bootstrap_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bootstrap] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bootstrap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bootstrap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bootstrap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bootstrap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bootstrap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bootstrap] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bootstrap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bootstrap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bootstrap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bootstrap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bootstrap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bootstrap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bootstrap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bootstrap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bootstrap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bootstrap] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bootstrap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bootstrap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bootstrap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bootstrap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bootstrap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bootstrap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bootstrap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bootstrap] SET RECOVERY FULL 
GO
ALTER DATABASE [Bootstrap] SET  MULTI_USER 
GO
ALTER DATABASE [Bootstrap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bootstrap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bootstrap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bootstrap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bootstrap] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bootstrap', N'ON'
GO
ALTER DATABASE [Bootstrap] SET QUERY_STORE = OFF
GO
USE [Bootstrap]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IDCategoria] [int] NOT NULL,
	[NombreCategoria] [nvarchar](15) NOT NULL,
	[Descripcion] [ntext] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleOrden]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrden](
	[IDOrden] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[PrecioUnitario] [money] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Descuento] [real] NOT NULL,
 CONSTRAINT [PK_DetalleOrden] PRIMARY KEY CLUSTERED 
(
	[IDOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPago](
	[IDPago] [int] NOT NULL,
	[FormaPago] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InicioSesion]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InicioSesion](
	[Correo] [nvarchar](20) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[IDOrden] [int] NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[Envio] [money] NOT NULL,
	[FechaOrden] [datetime] NOT NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[IDOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IDProducto] [int] NOT NULL,
	[NombreProducto] [nvarchar](50) NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[IDProveedor] [nchar](10) NULL,
	[PrecioProducto] [money] NOT NULL,
	[StockProducto] [smallint] NOT NULL,
	[DescripcionProducto] [nvarchar](50) NOT NULL,
	[Descontinuados] [bit] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDProveedor] [nchar](10) NOT NULL,
	[NombreProveedor] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](50) NULL,
	[Correo] [nvarchar](20) NULL,
	[Telefono] [int] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[NombreCompleto] [nvarchar](30) NOT NULL,
	[Correo] [nvarchar](20) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[Direccion] [nchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Ciudad] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarjetaDeCredito]    Script Date: 23/05/2020 07:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarjetaDeCredito](
	[NombreTarjeta] [nvarchar](10) NOT NULL,
	[NumeroTarjeta] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleOrden]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrden_Ordenes] FOREIGN KEY([IDOrden])
REFERENCES [dbo].[Ordenes] ([IDOrden])
GO
ALTER TABLE [dbo].[DetalleOrden] CHECK CONSTRAINT [FK_DetalleOrden_Ordenes]
GO
ALTER TABLE [dbo].[DetalleOrden]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrden_Productos] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([IDProducto])
GO
ALTER TABLE [dbo].[DetalleOrden] CHECK CONSTRAINT [FK_DetalleOrden_Productos]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Categorias] ([IDCategoria])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Categorias] ([IDCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedor] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedor] ([IDProveedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedor]
GO
USE [master]
GO
ALTER DATABASE [Bootstrap] SET  READ_WRITE 
GO
