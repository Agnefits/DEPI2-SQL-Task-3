USE [master]
GO
/****** Object:  Database [CompanyDB]    Script Date: 2/14/2022 3:09:22 PM ******/
CREATE DATABASE [CompanyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyDB', FILENAME = N'H:\DB\CompanyDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CompanyDB_log', FILENAME = N'H:\DB\CompanyDB_log.ldf' , SIZE = 2624KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CompanyDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CompanyDB] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CompanyDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompanyDB', N'ON'
GO
ALTER DATABASE [CompanyDB] SET QUERY_STORE = OFF
GO
USE [CompanyDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/14/2022 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DName] [nvarchar](20) NULL,
	[DNumber] [int] NOT NULL,
	[MGRSSN] [int] NULL,
	[MGRStartDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dept_Locations]    Script Date: 2/14/2022 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dept_Locations](
	[DNumber] [int] NOT NULL,
	[DLocation] [nvarchar](20) NOT NULL,
 CONSTRAINT [Dept_Location_PK] PRIMARY KEY CLUSTERED 
(
	[DNumber] ASC,
	[DLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/14/2022 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[FName] [nvarchar](20) NULL,
	[LName] [nvarchar](20) NULL,
	[SSN] [int] NOT NULL,
	[BDate] [date] NULL,
	[Address] [nvarchar](30) NULL,
	[Sex] [nvarchar](10) NULL,
	[Salary] [int] NULL,
	[SuperSSN] [int] NULL,
	[DNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2/14/2022 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[PName] [nvarchar](20) NULL,
	[PNumber] [int] NOT NULL,
	[PLocation] [nvarchar](20) NULL,
	[DNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Works_ON]    Script Date: 2/14/2022 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Works_ON](
	[ESSN] [int] NOT NULL,
	[PNO] [int] NOT NULL,
	[Hours] [int] NULL,
 CONSTRAINT [Works_ON_PK] PRIMARY KEY CLUSTERED 
(
	[ESSN] ASC,
	[PNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([DName], [DNumber], [MGRSSN], [MGRStartDate]) VALUES (N'CS', 10, 968574, CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Department] ([DName], [DNumber], [MGRSSN], [MGRStartDate]) VALUES (N'IT', 11, 968475, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[Department] ([DName], [DNumber], [MGRSSN], [MGRStartDate]) VALUES (N'SD', 12, 968123, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[Dept_Locations] ([DNumber], [DLocation]) VALUES (10, N'Cairo')
INSERT [dbo].[Dept_Locations] ([DNumber], [DLocation]) VALUES (11, N'Alex')
INSERT [dbo].[Dept_Locations] ([DNumber], [DLocation]) VALUES (12, N'Beni Suief')
INSERT [dbo].[Employee] ([FName], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [DNo]) VALUES (N'Ahmed', N'Mohamed', 123456, CAST(N'1994-01-01' AS Date), N'Cairo', N'Male', 2000, 654123, 10)
INSERT [dbo].[Employee] ([FName], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [DNo]) VALUES (N'Mohamed', N'Ali', 521364, CAST(N'1996-02-05' AS Date), N'Beni Sueif', N'Male', 2000, 654123, 12)
INSERT [dbo].[Employee] ([FName], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [DNo]) VALUES (N'Huda', N'Ahmed', 654123, CAST(N'1992-02-02' AS Date), N'Alex', N'Female', 5000, 123456, 11)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNumber]) VALUES (N'P1', 50, N'Cairo', 10)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNumber]) VALUES (N'P2', 60, N'Alex', 11)
INSERT [dbo].[Works_ON] ([ESSN], [PNO], [Hours]) VALUES (123456, 50, 100)
INSERT [dbo].[Works_ON] ([ESSN], [PNO], [Hours]) VALUES (521364, 50, 150)
INSERT [dbo].[Works_ON] ([ESSN], [PNO], [Hours]) VALUES (654123, 60, 200)
ALTER TABLE [dbo].[Dept_Locations]  WITH CHECK ADD  CONSTRAINT [Dept_Location_Department_FK] FOREIGN KEY([DNumber])
REFERENCES [dbo].[Department] ([DNumber])
GO
ALTER TABLE [dbo].[Dept_Locations] CHECK CONSTRAINT [Dept_Location_Department_FK]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Emp_DFK] FOREIGN KEY([DNo])
REFERENCES [dbo].[Department] ([DNumber])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Emp_DFK]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [Project_Department_FK] FOREIGN KEY([DNumber])
REFERENCES [dbo].[Department] ([DNumber])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [Project_Department_FK]
GO
ALTER TABLE [dbo].[Works_ON]  WITH CHECK ADD  CONSTRAINT [Works_ON_Employee_FK] FOREIGN KEY([ESSN])
REFERENCES [dbo].[Employee] ([SSN])
GO
ALTER TABLE [dbo].[Works_ON] CHECK CONSTRAINT [Works_ON_Employee_FK]
GO
ALTER TABLE [dbo].[Works_ON]  WITH CHECK ADD  CONSTRAINT [Wroks_ON_Project_FK] FOREIGN KEY([PNO])
REFERENCES [dbo].[Project] ([PNumber])
GO
ALTER TABLE [dbo].[Works_ON] CHECK CONSTRAINT [Wroks_ON_Project_FK]
GO
USE [master]
GO
ALTER DATABASE [CompanyDB] SET  READ_WRITE 
GO
