USE [master]
GO
/****** Object:  Database [Proyectos]    Script Date: 13/08/2020 06:52:46 p. m. ******/
CREATE DATABASE [Proyectos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyectos', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Proyectos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Proyectos_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Proyectos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Proyectos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyectos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyectos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyectos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyectos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyectos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyectos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyectos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyectos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Proyectos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyectos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyectos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyectos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyectos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyectos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyectos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyectos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyectos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyectos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyectos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyectos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyectos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyectos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyectos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyectos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyectos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyectos] SET  MULTI_USER 
GO
ALTER DATABASE [Proyectos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyectos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyectos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyectos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Proyectos]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/08/2020 06:52:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[codigo_cli] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cli] [varchar](40) NOT NULL,
	[RFC_cli] [varchar](40) NOT NULL,
	[direccion_cli] [varchar](40) NOT NULL,
	[ciudad_cli] [varchar](40) NOT NULL,
	[telefono_cli] [varchar](40) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[codigo_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 13/08/2020 06:52:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departamento](
	[nombre_dep] [varchar](40) NOT NULL,
	[ciudad_dep] [varchar](40) NOT NULL,
	[telefono_dep] [int] NOT NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[nombre_dep] ASC,
	[ciudad_dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 13/08/2020 06:52:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleado](
	[codigo_empl] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empl] [varchar](40) NOT NULL,
	[apellidos_empl] [varchar](40) NOT NULL,
	[sueldo_emp] [money] NOT NULL,
	[nombre_dep] [varchar](40) NOT NULL,
	[ciudad_dep] [varchar](40) NOT NULL,
	[codigo_proy] [int] NOT NULL,
 CONSTRAINT [PK_empleados] PRIMARY KEY CLUSTERED 
(
	[codigo_empl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proyecto]    Script Date: 13/08/2020 06:52:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proyecto](
	[codigo_proy] [int] IDENTITY(1,1) NOT NULL,
	[nombre_proy] [varchar](40) NOT NULL,
	[precio_proy] [money] NOT NULL,
	[fecha_inicio_proy] [date] NOT NULL,
	[fecha_prev_proy] [date] NOT NULL,
	[fecha_fin_proy] [date] NOT NULL,
	[codigo_cliente] [int] NOT NULL,
 CONSTRAINT [PK_proyecto] PRIMARY KEY CLUSTERED 
(
	[codigo_proy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_departamento] FOREIGN KEY([nombre_dep], [ciudad_dep])
REFERENCES [dbo].[departamento] ([nombre_dep], [ciudad_dep])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_departamento]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_proyecto] FOREIGN KEY([codigo_proy])
REFERENCES [dbo].[proyecto] ([codigo_proy])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_proyecto]
GO
ALTER TABLE [dbo].[proyecto]  WITH CHECK ADD  CONSTRAINT [FK_proyecto_cliente] FOREIGN KEY([codigo_cliente])
REFERENCES [dbo].[cliente] ([codigo_cli])
GO
ALTER TABLE [dbo].[proyecto] CHECK CONSTRAINT [FK_proyecto_cliente]
GO
USE [master]
GO
ALTER DATABASE [Proyectos] SET  READ_WRITE 
GO
