USE [master]
GO
/****** Object:  Database [ComeGetSomeFood]    Script Date: 9/19/2015 11:05:44 AM ******/
CREATE DATABASE [ComeGetSomeFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComeGetSomeFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012DEV\MSSQL\DATA\ComeGetSomeFood.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ComeGetSomeFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012DEV\MSSQL\DATA\ComeGetSomeFood_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ComeGetSomeFood] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComeGetSomeFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComeGetSomeFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ComeGetSomeFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComeGetSomeFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComeGetSomeFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComeGetSomeFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComeGetSomeFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET RECOVERY FULL 
GO
ALTER DATABASE [ComeGetSomeFood] SET  MULTI_USER 
GO
ALTER DATABASE [ComeGetSomeFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComeGetSomeFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComeGetSomeFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComeGetSomeFood] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ComeGetSomeFood]
GO
/****** Object:  Table [dbo].[GroceryItems]    Script Date: 9/19/2015 11:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroceryItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](15) NOT NULL,
	[Brand] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[CurrentQty] [int] NOT NULL,
	[OnOrderQty] [int] NOT NULL,
	[MaxQty] [int] NOT NULL,
	[OrderThreshold] [int] NOT NULL,
	[DateLastReceived] [datetime] NOT NULL,
	[QtyLastReceived] [int] NOT NULL,
	[UnitCost] [float] NOT NULL,
	[RetailPrice] [float] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateLastModified] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_GroceryItems] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 9/19/2015 11:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[OrderQty] [int] NOT NULL,
	[LineTotal] [float] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/19/2015 11:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderNotes] [nvarchar](500) NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsOpen] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/19/2015 11:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EMailAddress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[GroceryItems] ON 

INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (1, N'1234567890', N'Snippies', N'Honey Graham Crackers (16oz)', 5, 0, 25, 10, CAST(0x0000A4BB017A52BF AS DateTime), 0, 1, 2.25, CAST(0x0000A4B9014C81E5 AS DateTime), 1, CAST(0x0000A4BE000E434F AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (2, N'1234567891', N'Snippies', N'Honey Graham Crackers (24oz)', 12, 0, 25, 15, CAST(0x0000A4BB017A52C0 AS DateTime), 0, 1.15, 2.25, CAST(0x0000A4BA0133EC9A AS DateTime), 1, CAST(0x0000A4BB01813D24 AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (3, N'1234567892', N'Nabisco', N'Oreo (Original)', 8, 0, 23, 15, CAST(0x0000A4BB017A52C1 AS DateTime), 0, 0.95, 1.99, CAST(0x0000A4BA01345D6C AS DateTime), 1, CAST(0x0000A4BE00031B80 AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (5, N'1234567894', N'Nabisco', N'Shredded Wheat', 6, 0, 20, 15, CAST(0x0000A4BC0028F135 AS DateTime), 0, 1.5, 2.99, CAST(0x0000A4BC0028F135 AS DateTime), 1, CAST(0x0000A4BC0028F135 AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (6, N'1234567896', N'Kellogs', N'Rice Crispies (22 oz)', 9, 0, 45, 15, CAST(0x0000A4BE0002DF05 AS DateTime), 0, 2.5, 4.29, CAST(0x0000A4BE0002DF05 AS DateTime), 1, CAST(0x0000A4BE0002DF05 AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (7, N'1234567897', N'Prego', N'Traditional (16oz)', 8, 0, 25, 10, CAST(0x0000A4BE000384A4 AS DateTime), 0, 1.05, 2.25, CAST(0x0000A4BE000384A4 AS DateTime), 1, CAST(0x0000A4BE000384A4 AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (9, N'1234567899', N'Keebler', N'Fudge Grahams', 10, 0, 25, 15, CAST(0x0000A4BE000A84AF AS DateTime), 0, 1.95, 2, CAST(0x0000A4BE000A84AF AS DateTime), 1, CAST(0x0000A4BE000A84AF AS DateTime), 1)
INSERT [dbo].[GroceryItems] ([ItemID], [SKU], [Brand], [Description], [CurrentQty], [OnOrderQty], [MaxQty], [OrderThreshold], [DateLastReceived], [QtyLastReceived], [UnitCost], [RetailPrice], [DateCreated], [CreatedBy], [DateLastModified], [LastModifiedBy]) VALUES (10, N'1234567810', N'Charmin', N'2-ply Bathroom Tissue', 14, 0, 40, 20, CAST(0x0000A4BE00227970 AS DateTime), 0, 3.95, 6.99, CAST(0x0000A4BE00227970 AS DateTime), 1, CAST(0x0000A4BE00227970 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[GroceryItems] OFF
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (26, 2, 5, 5.75)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (26, 3, 3, 2.8499999999999996)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (26, 5, 2, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (27, 3, 3, 2.8499999999999996)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (27, 5, 2, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (28, 3, 3, 2.8499999999999996)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (28, 5, 2, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (29, 3, 3, 2.8499999999999996)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (29, 5, 2, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (30, 3, 3, 2.8499999999999996)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (30, 5, 3, 4.5)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (31, 3, 8, 7.6)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (31, 5, 7, 10.5)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (32, 3, 9, 8.5499999999999989)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (32, 6, 40, 100)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (32, 7, 19, 19.95)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (33, 3, 8, 7.6)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (33, 9, 19, 37.05)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (34, 9, 19, 37.05)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (35, 10, 10, 39.5)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (36, 2, 3, 3.4499999999999997)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (36, 3, 9, 8.5499999999999989)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (36, 5, 10, 15)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (36, 7, 16, 16.8)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (36, 9, 20, 39)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (36, 10, 28, 110.60000000000001)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (37, 2, 17, 19.549999999999997)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (37, 3, 8, 7.6)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 1, 22, 22)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 2, 20, 23)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 3, 14, 13.299999999999999)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 5, 16, 24)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 6, 35, 87.5)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 9, 20, 39)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [OrderQty], [LineTotal]) VALUES (38, 10, 33, 130.35)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (26, 11.6, N'These are some order notes.', CAST(0x0000A4BC016FDD79 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (27, 5.85, N'These are some order notes.', CAST(0x0000A4BC01707B52 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (28, 5.85, N'These are some order notes.', CAST(0x0000A4BC0170ECD0 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (29, 5.85, N'These are some order notes.', CAST(0x0000A4BC0171FB7C AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (30, 7.35, N'Order Notes go here', CAST(0x0000A4BC0175C248 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (31, 18.1, N'Order Notes', CAST(0x0000A4BD01858AF9 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (32, 128.5, N'Here is another order', CAST(0x0000A4BE0003CCB6 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (33, 44.65, N'Another Order', CAST(0x0000A4BE0010C623 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (34, 37.05, N'', CAST(0x0000A4BE00154321 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (35, 39.5, N'Some notes', CAST(0x0000A4BE0022BFC8 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (36, 193.4, N'', CAST(0x0000A4BE00DD320E AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (37, 27.15, N'', CAST(0x0000A4BE00DF1332 AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderID], [OrderTotal], [OrderNotes], [OrderDate], [IsOpen]) VALUES (38, 339.15, N'', CAST(0x0000A4BE00E21A20 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (1, 0, N'admin', N'61956d5260d24de338817a2cd2266fbf8a', N'Administrator', N'Account', N'admin@cgsf.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (4, 1, N'sborey', N'70c62d1725d10eb707be2d78de273eb78e12', N'Shaun', N'Borey', N'sborey@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (5, 1, N'jborey', N'7ba77c4e658746b754d12c47df2338ecdc15b9ee', N'James', N'Borey', N'jfw2261@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (6, 1, N'jschmo', N'31c62d1549db5de255852878d5', N'Joe', N'Schmo', N'jschmo@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (7, 1, N'jmama', N'31c62d1549db5de255852878d5', N'Joe', N'Mama', N'jmama@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (8, 1, N'jdoe', N'31c62d1549db5de255852878d5', N'Jane', N'Doe', N'jdoe@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (9, 1, N'auser', N'31c62d1549db5de255852878d5', N'Adam', N'User', N'auser@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (10, 1, N'tuser', N'31c62d1549db5de255852878d5', N'Test', N'User', N'tuser@yahoo.com')
INSERT [dbo].[Users] ([UserID], [UserType], [UserName], [Password], [FirstName], [LastName], [EMailAddress]) VALUES (13, 1, N'jsmith', N'31c62d1549db5de255852878d5', N'John', N'Smith', N'jsmith@yahoo.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_IsOpen]  DEFAULT ((1)) FOR [IsOpen]
GO
USE [master]
GO
ALTER DATABASE [ComeGetSomeFood] SET  READ_WRITE 
GO
