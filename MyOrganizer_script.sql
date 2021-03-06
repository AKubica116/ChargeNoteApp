USE [master]
GO
/****** Object:  Database [MyOrganizer]    Script Date: 07.10.2018 20:02:29 ******/
CREATE DATABASE [MyOrganizer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyOrganizer', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyOrganizer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyOrganizer_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyOrganizer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyOrganizer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyOrganizer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyOrganizer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyOrganizer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyOrganizer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyOrganizer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyOrganizer] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyOrganizer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyOrganizer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyOrganizer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyOrganizer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyOrganizer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyOrganizer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyOrganizer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyOrganizer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyOrganizer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyOrganizer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyOrganizer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyOrganizer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyOrganizer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyOrganizer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyOrganizer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyOrganizer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyOrganizer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyOrganizer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyOrganizer] SET  MULTI_USER 
GO
ALTER DATABASE [MyOrganizer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyOrganizer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyOrganizer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyOrganizer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyOrganizer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyOrganizer] SET QUERY_STORE = OFF
GO
USE [MyOrganizer]
GO
/****** Object:  Table [dbo].[InstallmentTable]    Script Date: 07.10.2018 20:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstallmentTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentID] [int] NULL,
	[InstallmentDate] [date] NULL,
	[Amount] [float] NULL,
	[isPaid] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTable]    Script Date: 07.10.2018 20:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[FullAmount] [float] NULL,
	[InstallmentCount] [int] NULL,
	[isPaid] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[InstallmentTable] ON 

INSERT [dbo].[InstallmentTable] ([ID], [PaymentID], [InstallmentDate], [Amount], [isPaid]) VALUES (1, 1, CAST(N'2018-10-01' AS Date), 1500, 0)
INSERT [dbo].[InstallmentTable] ([ID], [PaymentID], [InstallmentDate], [Amount], [isPaid]) VALUES (2, 1, CAST(N'2018-11-01' AS Date), 1500, 0)
INSERT [dbo].[InstallmentTable] ([ID], [PaymentID], [InstallmentDate], [Amount], [isPaid]) VALUES (3, 2, CAST(N'2018-10-20' AS Date), 150, 0)
INSERT [dbo].[InstallmentTable] ([ID], [PaymentID], [InstallmentDate], [Amount], [isPaid]) VALUES (4, 2, CAST(N'2018-11-20' AS Date), 150, 0)
INSERT [dbo].[InstallmentTable] ([ID], [PaymentID], [InstallmentDate], [Amount], [isPaid]) VALUES (5, 2, CAST(N'2018-12-20' AS Date), 150, 0)
SET IDENTITY_INSERT [dbo].[InstallmentTable] OFF
SET IDENTITY_INSERT [dbo].[PaymentTable] ON 

INSERT [dbo].[PaymentTable] ([ID], [Title], [FullAmount], [InstallmentCount], [isPaid]) VALUES (1, N'Zadłużenie - Mama', 5000, 3, 0)
INSERT [dbo].[PaymentTable] ([ID], [Title], [FullAmount], [InstallmentCount], [isPaid]) VALUES (2, N'Rower', 3000, 12, 0)
SET IDENTITY_INSERT [dbo].[PaymentTable] OFF
USE [master]
GO
ALTER DATABASE [MyOrganizer] SET  READ_WRITE 
GO
