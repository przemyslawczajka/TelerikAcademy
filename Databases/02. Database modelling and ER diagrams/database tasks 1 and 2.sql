USE [master]
GO
/****** Object:  Database [AddressesTasks]    Script Date: 23.8.2014 г. 19:38:05 ******/
CREATE DATABASE [AddressesTasks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressesTasks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AddressesTasks.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AddressesTasks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AddressesTasks_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AddressesTasks] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressesTasks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressesTasks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressesTasks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressesTasks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressesTasks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressesTasks] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressesTasks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AddressesTasks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressesTasks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressesTasks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressesTasks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressesTasks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressesTasks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressesTasks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressesTasks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressesTasks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AddressesTasks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressesTasks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressesTasks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressesTasks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressesTasks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressesTasks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressesTasks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressesTasks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AddressesTasks] SET  MULTI_USER 
GO
ALTER DATABASE [AddressesTasks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressesTasks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressesTasks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressesTasks] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AddressesTasks] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AddressesTasks]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 23.8.2014 г. 19:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [text] NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 23.8.2014 г. 19:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Continents](
	[ContinentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 23.8.2014 г. 19:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContinentId] [int] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 23.8.2014 г. 19:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 23.8.2014 г. 19:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Towns](
	[TownId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (1, N'Plot No. 459 Dodoma Municipality', 5)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (2, N'101 Wakefield Street', 2)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (3, N'Alexander Malinov 1 Str.', 1)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (2, N'Africa')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (3, N'Australia and Oceania')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (2, N'Tanzania', 2)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (4, N'New Zealand', 3)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (1, N'John', N'Johnson', 1)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (2, N'Peter', N'Peterson', 2)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (3, N'Ivan', N'Ivanov', 3)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (2, N'Wellington', 4)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (5, N'Dodoma', 2)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([TownId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([ContinentId])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [AddressesTasks] SET  READ_WRITE 
GO
