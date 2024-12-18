USE [master]
GO
/****** Object:  Database [NNSABD]    Script Date: 02/12/2024 8:06:34 ******/
CREATE DATABASE [NNSABD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NNSABD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NNSABD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NNSABD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NNSABD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NNSABD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NNSABD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NNSABD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NNSABD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NNSABD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NNSABD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NNSABD] SET ARITHABORT OFF 
GO
ALTER DATABASE [NNSABD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NNSABD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NNSABD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NNSABD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NNSABD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NNSABD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NNSABD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NNSABD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NNSABD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NNSABD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NNSABD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NNSABD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NNSABD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NNSABD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NNSABD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NNSABD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NNSABD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NNSABD] SET RECOVERY FULL 
GO
ALTER DATABASE [NNSABD] SET  MULTI_USER 
GO
ALTER DATABASE [NNSABD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NNSABD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NNSABD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NNSABD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NNSABD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NNSABD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NNSABD', N'ON'
GO
ALTER DATABASE [NNSABD] SET QUERY_STORE = OFF
GO
USE [NNSABD]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [int] NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[rutaFoto] [nvarchar](255) NULL,
	[fechaIngreso] [datetime] NOT NULL,
	[cargoId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudServicio]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudServicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[empleadoId] [int] NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
	[numeroSolicitud] [int] NOT NULL,
	[estadoSolicitudId] [int] NOT NULL,
	[servicioSolicitadoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON 

INSERT [dbo].[Cargo] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (1, CAST(N'2024-12-02T00:18:53.417' AS DateTime), CAST(N'2024-12-02T00:18:53.417' AS DateTime), N'Scrum Master')
INSERT [dbo].[Cargo] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (2, CAST(N'2024-12-02T00:18:53.417' AS DateTime), CAST(N'2024-12-02T00:18:53.417' AS DateTime), N'Desarrollador')
INSERT [dbo].[Cargo] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (3, CAST(N'2024-12-02T00:18:53.417' AS DateTime), CAST(N'2024-12-02T00:18:53.417' AS DateTime), N'QA')
INSERT [dbo].[Cargo] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (4, CAST(N'2024-12-02T00:18:53.417' AS DateTime), CAST(N'2024-12-02T00:18:53.417' AS DateTime), N'PO')
SET IDENTITY_INSERT [dbo].[Cargo] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([id], [cedula], [nombre], [rutaFoto], [fechaIngreso], [cargoId]) VALUES (1, 1444, N'yefferson andres', N'\Images\272300372_5440022452679517_4275556349199615978_n.jpg', CAST(N'2024-12-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleado] ([id], [cedula], [nombre], [rutaFoto], [fechaIngreso], [cargoId]) VALUES (2, 1010, N'negro', N'\Images\aa9dad5c-2e7c-4344-bd2d-015d2ee8025c.JPG', CAST(N'2024-12-06T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (1, CAST(N'2024-12-02T07:59:37.390' AS DateTime), CAST(N'2024-12-02T07:59:37.390' AS DateTime), N'Creada')
INSERT [dbo].[Estados] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (2, CAST(N'2024-12-02T07:59:37.390' AS DateTime), CAST(N'2024-12-02T07:59:37.390' AS DateTime), N'Asignada')
INSERT [dbo].[Estados] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (3, CAST(N'2024-12-02T07:59:37.390' AS DateTime), CAST(N'2024-12-02T07:59:37.390' AS DateTime), N'Entramite')
INSERT [dbo].[Estados] ([id], [UpdateDate], [CreateDate], [nombre]) VALUES (4, CAST(N'2024-12-02T07:59:37.390' AS DateTime), CAST(N'2024-12-02T07:59:37.390' AS DateTime), N'Cerrada')
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD FOREIGN KEY([empleadoId])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD FOREIGN KEY([empleadoId])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD FOREIGN KEY([estadoSolicitudId])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD FOREIGN KEY([estadoSolicitudId])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD FOREIGN KEY([servicioSolicitadoId])
REFERENCES [dbo].[Servicio] ([id])
GO
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD FOREIGN KEY([servicioSolicitadoId])
REFERENCES [dbo].[Servicio] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarEmpleado]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ActualizarEmpleado]
@idempleado int ,
	@cedula int , 
	@nombre nvarchar(100) ,
	@rutaFoto nvarchar(255),
	@fechaIngreso  datetime,
	@cargoId int
AS
BEGIN
      UPDATE [dbo].[Empleado]
         SET [cedula] = @cedula
            ,[nombre] = @nombre
            ,[rutaFoto] = @rutaFoto
            ,[cargoId] = @cargoId
       WHERE id = @idempleado
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarEmpleadoConId]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ConsultarEmpleadoConId]
	@id int
	as
BEGIN
SELECT e.[id]
      ,[cedula]
      ,e.[nombre]
      ,[rutaFoto]
      ,[fechaIngreso]
      ,[cargoId]
	  ,c.nombre as 'Cargo'
  FROM [dbo].[Empleado] e
  inner join cargo c on c.id = e.cargoId
  WHERE e.id =@id
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearCargo]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearCargo]
	@nombre nvarchar(100)
	as
BEGIN
	INSERT INTO [dbo].[Cargo]
           ([UpdateDate]
           ,[CreateDate]
           ,[nombre])
     VALUES
           (getdate()
           ,getdate()
           ,@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearEmpleado]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearEmpleado]
	@cedula int , 
	@nombre nvarchar(100) ,
	@rutaFoto nvarchar(255),
	@fechaIngreso  datetime,
	@cargoId int
AS
BEGIN
	INSERT INTO [dbo].[Empleado]
           (
            [cedula]
           ,[nombre]
           ,[rutaFoto]
           ,[fechaIngreso]
           ,[cargoId])
     VALUES
           (@cedula
           ,@nombre
           ,@rutaFoto
           ,@fechaIngreso
           ,@cargoId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEmpleado]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EliminarEmpleado] 

	@IdEmpleado int

AS
BEGIN
	DELETE EMPLEADO WHERE ID= @IdEmpleado 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarCargos]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_listarCargos] 

AS
BEGIN


    SELECT  [id]
      ,[nombre]
  FROM [NNSABD].[dbo].[Cargo]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleados]    Script Date: 02/12/2024 8:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ListarEmpleados]
	
	as
BEGIN
SELECT e.[id]
      ,[cedula]
      ,e.[nombre]
      ,[rutaFoto]
      ,[fechaIngreso]
      ,[cargoId]
	  ,c.nombre as 'Cargo'
  FROM [dbo].[Empleado] e
  inner join cargo c on c.id = e.cargoId

  END
GO
USE [master]
GO
ALTER DATABASE [NNSABD] SET  READ_WRITE 
GO
