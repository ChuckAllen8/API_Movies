USE [master]
GO
/****** Object:  Database [Movie_API]    Script Date: 9/23/2020 8:29:57 AM ******/
CREATE DATABASE [Movie_API]
GO
ALTER DATABASE [Movie_API] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movie_API].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movie_API] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movie_API] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movie_API] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movie_API] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movie_API] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movie_API] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movie_API] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movie_API] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movie_API] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movie_API] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movie_API] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movie_API] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movie_API] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movie_API] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movie_API] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Movie_API] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movie_API] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movie_API] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movie_API] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movie_API] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movie_API] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movie_API] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movie_API] SET RECOVERY FULL 
GO
ALTER DATABASE [Movie_API] SET  MULTI_USER 
GO
ALTER DATABASE [Movie_API] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movie_API] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movie_API] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movie_API] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movie_API] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Movie_API', N'ON'
GO
ALTER DATABASE [Movie_API] SET QUERY_STORE = OFF
GO
USE [Movie_API]
GO
/****** Object:  User [DB4_User]    Script Date: 9/23/2020 8:29:57 AM ******/
CREATE USER [DB4_User] FOR LOGIN [sa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DB4_User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [DB4_User]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 9/23/2020 8:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (1, N'Die Hard', N'Holiday')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (2, N'Die Hard 2', N'Holiday')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (3, N'Jurassic Park', N'Thriller')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (4, N'Serenity', N'SciFi')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (5, N'Starship Troopers', N'SciFi')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (6, N'Bright', N'Fantasy')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (7, N'We Were Soldiers', N'War')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (8, N'Man of Steel', N'Superhero')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (9, N'Iron Man', N'Superhero')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (10, N'Spider-Man', N'Superhero')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (11, N'Thor', N'Superhero')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (12, N'Trolls', N'Animated')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (13, N'Trolls World Tour', N'Animated')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (14, N'Captain Marverl', N'Superhero')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (15, N'Aladdin', N'Animated')
INSERT [dbo].[Movie] ([Id], [Name], [Category]) VALUES (16, N'Howl''s Moving Castle', N'Animated')
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movie]    Script Date: 9/23/2020 8:29:57 AM ******/
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [IX_Movie] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Movie_API] SET  READ_WRITE 
GO
