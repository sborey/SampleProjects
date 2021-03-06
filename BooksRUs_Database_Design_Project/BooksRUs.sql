USE [master]
GO
/****** Object:  Database [BooksRUs]    Script Date: 8/23/2015 10:53:47 PM ******/
CREATE DATABASE [BooksRUs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksRUs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012DEV\MSSQL\DATA\BooksRUs.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BooksRUs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012DEV\MSSQL\DATA\BooksRUs_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BooksRUs] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksRUs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksRUs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksRUs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksRUs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksRUs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksRUs] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksRUs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BooksRUs] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BooksRUs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksRUs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksRUs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksRUs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksRUs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksRUs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksRUs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksRUs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksRUs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BooksRUs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksRUs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksRUs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksRUs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksRUs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksRUs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BooksRUs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksRUs] SET RECOVERY FULL 
GO
ALTER DATABASE [BooksRUs] SET  MULTI_USER 
GO
ALTER DATABASE [BooksRUs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksRUs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksRUs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksRUs] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BooksRUs]
GO
/****** Object:  Table [dbo].[AUTHOR]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHOR](
	[AUTH_ID] [int] IDENTITY(1,1) NOT NULL,
	[AUTH_FNAME] [nvarchar](50) NOT NULL,
	[AUTH_MI] [nchar](1) NULL,
	[AUTH_LNAME] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED 
(
	[AUTH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK](
	[PROD_ID] [int] NOT NULL,
	[GENRE_CODE] [nchar](4) NOT NULL,
	[AUTH_ID] [int] NOT NULL,
	[PUB_ID] [int] NOT NULL,
	[BOOK_TITLE] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_BOOK] PRIMARY KEY CLUSTERED 
(
	[PROD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CAFE]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAFE](
	[PROD_ID] [int] NOT NULL,
	[CAFE_NAME] [nvarchar](50) NOT NULL,
	[CAFE_DESCRIPTION] [nvarchar](250) NULL,
 CONSTRAINT [PK_CAFE] PRIMARY KEY CLUSTERED 
(
	[PROD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUST_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUST_FNAME] [nvarchar](50) NOT NULL,
	[CUST_MI] [nchar](1) NULL,
	[CUST_LNAME] [nvarchar](50) NOT NULL,
	[CUST_ADDR1] [nvarchar](250) NULL,
	[CUST_ADDR2] [nvarchar](250) NULL,
	[CUST_CITY] [nvarchar](50) NULL,
	[CUST_STATE] [nchar](2) NULL,
	[CUST_ZIP] [nchar](5) NOT NULL,
	[CUST_PHONE] [nchar](12) NOT NULL,
	[CUST_EMAIL] [nvarchar](150) NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CUST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GENRE]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENRE](
	[GENRE_CODE] [nchar](4) NOT NULL,
	[GENRE_DESCRIPTION] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_GENRE] PRIMARY KEY CLUSTERED 
(
	[GENRE_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIFT]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIFT](
	[PROD_ID] [int] NOT NULL,
	[GIFT_NAME] [nvarchar](50) NOT NULL,
	[GIFT_DESCRIPTION] [nvarchar](250) NULL,
 CONSTRAINT [PK_GIFT] PRIMARY KEY CLUSTERED 
(
	[PROD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MAGAZINE]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAGAZINE](
	[PROD_ID] [int] NOT NULL,
	[PUB_ID] [int] NOT NULL,
	[GENRE_CODE] [nchar](4) NOT NULL,
	[MAG_TITLE] [nvarchar](100) NOT NULL,
	[MAG_ISSUENUM] [int] NULL,
 CONSTRAINT [PK_MAGAZINE] PRIMARY KEY CLUSTERED 
(
	[PROD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[ORDDET_LINENUM] [int] NOT NULL,
	[ORDER_ID] [int] NOT NULL,
	[PROD_ID] [int] NOT NULL,
	[ORDDET_QTY] [int] NOT NULL,
	[ORDDET_RETAILPRICE] [decimal](9, 2) NOT NULL,
	[ORDDET_LINECOST]  AS ([ORDDET_QTY]*[ORDDET_RETAILPRICE]) PERSISTED,
	[ORDDET_ISOPEN] [bit] NOT NULL,
	[ORDDET_SHIPDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_ORDERDETAIL] PRIMARY KEY CLUSTERED 
(
	[ORDDET_LINENUM] ASC,
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDERPAYMENT]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERPAYMENT](
	[ORDER_ID] [int] NOT NULL,
	[PYMT_ID] [int] NOT NULL,
	[ORDPAY_AMOUNT] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_ORDERPAYMENT] PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC,
	[PYMT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDER_ID] [int] IDENTITY(1,1) NOT NULL,
	[STORE_ID] [int] NOT NULL,
	[CUST_ID] [int] NOT NULL,
	[ORDER_TOTAL] [decimal](9, 2) NOT NULL,
	[ORDER_ISBACKORDER] [bit] NOT NULL,
	[ORDER_ISPYMTPROC] [bit] NOT NULL,
	[ORDER_ORDERDATE] [datetime] NOT NULL,
	[ORDER_ISOPEN] [bit] NOT NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[PYMT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUST_ID] [int] NOT NULL,
	[PYMTTYPE_CODE] [nvarchar](4) NOT NULL,
	[PYMT_ACCTNUM] [nvarchar](30) NOT NULL,
	[PYMT_ROUTENUM] [nchar](9) NOT NULL,
	[PYMT_EXPDATE] [date] NOT NULL,
	[PYMT_CVV] [nvarchar](4) NOT NULL,
	[PYMT_BILLADDR] [nvarchar](250) NOT NULL,
	[PYMT_BILLCITY] [nvarchar](100) NOT NULL,
	[PYMT_BILLSTATE] [nchar](2) NOT NULL,
	[PYMT_BILLZIP] [nchar](5) NOT NULL,
 CONSTRAINT [PK_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[PYMT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENTTYPE]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENTTYPE](
	[PYMTTYPE_CODE] [nvarchar](4) NOT NULL,
	[PYMTTYPE_DESCRIPTION] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PAYMENTTYPE] PRIMARY KEY CLUSTERED 
(
	[PYMTTYPE_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[PROD_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROD_TYPE] [nvarchar](4) NOT NULL,
	[PROD_UNITCOST] [decimal](7, 2) NOT NULL,
	[PROD_RETAILPRICE] [decimal](7, 2) NOT NULL,
	[PROD_CURRQTY] [int] NOT NULL,
	[PROD_ONORDERQTY] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[PROD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PUBLISHER]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISHER](
	[PUB_ID] [int] IDENTITY(1,1) NOT NULL,
	[PUB_NAME] [nvarchar](100) NOT NULL,
	[PUB_CITY] [nvarchar](100) NOT NULL,
	[PUB_STATE] [nchar](2) NOT NULL,
 CONSTRAINT [PK_PUBLISHER] PRIMARY KEY CLUSTERED 
(
	[PUB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STORE]    Script Date: 8/23/2015 10:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STORE](
	[STORE_ID] [int] IDENTITY(1,1) NOT NULL,
	[STORE_NAME] [nvarchar](100) NOT NULL,
	[STORE_ADDR1] [nvarchar](250) NOT NULL,
	[STORE_ADDR2] [nvarchar](250) NULL,
	[STORE_CITY] [nvarchar](50) NOT NULL,
	[STORE_STATE] [nchar](2) NOT NULL,
	[STORE_ZIP] [nchar](5) NOT NULL,
	[STORE_PHONE] [nchar](12) NOT NULL,
	[STORE_FAX] [nchar](12) NOT NULL,
 CONSTRAINT [PK_STORE] PRIMARY KEY CLUSTERED 
(
	[STORE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AUTHOR] ON 

INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (1, N'Stephen', NULL, N'King')
INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (2, N'Dean', NULL, N'Koontz')
INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (3, N'J', N'K', N'Rowling')
INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (5, N'J R', N'R', N'Tolkien')
INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (6, N'Ernest', NULL, N'Hemmingway')
INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (7, N'C', N'S', N'Lewis')
INSERT [dbo].[AUTHOR] ([AUTH_ID], [AUTH_FNAME], [AUTH_MI], [AUTH_LNAME]) VALUES (9, N'Charles', N' ', N'Dickens')
SET IDENTITY_INSERT [dbo].[AUTHOR] OFF
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (1, N'SUSP', 1, 1, N'The Tommyknockers')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (5, N'SUSP', 1, 1, N'IT')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (6, N'FMLY', 3, 2, N'Harry Potter and the Chamber of Secrets')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (7, N'FMLY', 3, 2, N'Harry Potter and the Goblet of Fire')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (8, N'FMLY', 3, 2, N'Harry Potter and the Half Blood Prince')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (9, N'SUSP', 2, 1, N'The Bad Place')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (10, N'ADVT', 5, 3, N'The Fellowship of the Ring')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (11, N'ADVT', 5, 3, N'The Two Towers')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (12, N'ADVT', 5, 3, N'The Return of the King')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (13, N'RMCE', 6, 4, N'A Farewell to Arms')
INSERT [dbo].[BOOK] ([PROD_ID], [GENRE_CODE], [AUTH_ID], [PUB_ID], [BOOK_TITLE]) VALUES (14, N'ADVT', 7, 5, N'The Chronicals of Narnia')
INSERT [dbo].[CAFE] ([PROD_ID], [CAFE_NAME], [CAFE_DESCRIPTION]) VALUES (2, N'Coffee', N'Regular Coffee')
INSERT [dbo].[CAFE] ([PROD_ID], [CAFE_NAME], [CAFE_DESCRIPTION]) VALUES (15, N'Blueberry Muffin', N'Fresh-baked blueberry muffin')
INSERT [dbo].[CAFE] ([PROD_ID], [CAFE_NAME], [CAFE_DESCRIPTION]) VALUES (16, N'Double Choc Muffin', N'Double chocolate muffin')
INSERT [dbo].[CAFE] ([PROD_ID], [CAFE_NAME], [CAFE_DESCRIPTION]) VALUES (17, N'Premium Coffee', N'Premium coffee drinks')
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([CUST_ID], [CUST_FNAME], [CUST_MI], [CUST_LNAME], [CUST_ADDR1], [CUST_ADDR2], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_PHONE], [CUST_EMAIL]) VALUES (1, N'Shaun', N'P', N'Borey', N'104 Carmichael Ct', NULL, N'Cary', N'NC', N'27511', N'336-862-5711', N'sborey@yahoo.com')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [CUST_FNAME], [CUST_MI], [CUST_LNAME], [CUST_ADDR1], [CUST_ADDR2], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_PHONE], [CUST_EMAIL]) VALUES (2, N'John', N'C', N'Smith', N'123 Any Street', NULL, N'Somewhere', N'MA', N'01440', N'508-555-1234', N'jsmith@something.com')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [CUST_FNAME], [CUST_MI], [CUST_LNAME], [CUST_ADDR1], [CUST_ADDR2], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_PHONE], [CUST_EMAIL]) VALUES (3, N'Barry', N'L', N'Jones', N'425 Monroe Circle', NULL, N'Elkin', N'IL', N'61001', N'412-555-2345', N'bjones@yahoo.com')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [CUST_FNAME], [CUST_MI], [CUST_LNAME], [CUST_ADDR1], [CUST_ADDR2], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_PHONE], [CUST_EMAIL]) VALUES (4, N'Melanie', NULL, N'Cartwright', N'1819 Simmering Pine Way', NULL, N'Raleigh', N'NC', N'27418', N'919-555-3456', N'mcartwright@gmail.com')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [CUST_FNAME], [CUST_MI], [CUST_LNAME], [CUST_ADDR1], [CUST_ADDR2], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_PHONE], [CUST_EMAIL]) VALUES (5, N'Susan', N'A', N'Moore', N'981 Mason Circle', NULL, N'Gardner', N'MA', N'01440', N'508-555-6789', N'smoore@hotmail.com')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'ADVT', N'Adventure')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'CMDY', N'Comedy')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'DRMA', N'Drama')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'FMLY', N'Family')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'MSTY', N'Mystery')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'NEWS', N'News')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'RMCE', N'Romance')
INSERT [dbo].[GENRE] ([GENRE_CODE], [GENRE_DESCRIPTION]) VALUES (N'SUSP', N'Suspense')
INSERT [dbo].[GIFT] ([PROD_ID], [GIFT_NAME], [GIFT_DESCRIPTION]) VALUES (3, N'Gift Basket', N'Lots of stuff')
INSERT [dbo].[GIFT] ([PROD_ID], [GIFT_NAME], [GIFT_DESCRIPTION]) VALUES (21, N'Wall Clock', N'Antique-style wall clock')
INSERT [dbo].[GIFT] ([PROD_ID], [GIFT_NAME], [GIFT_DESCRIPTION]) VALUES (22, N'Designer Book Ends', N'Hand crafted book ends')
INSERT [dbo].[GIFT] ([PROD_ID], [GIFT_NAME], [GIFT_DESCRIPTION]) VALUES (23, N'Small Coffee Mug', N'6 oz coffee mug - various designs')
INSERT [dbo].[GIFT] ([PROD_ID], [GIFT_NAME], [GIFT_DESCRIPTION]) VALUES (24, N'Large Coffee Mug', N'10 oz coffe mug - various designs')
INSERT [dbo].[GIFT] ([PROD_ID], [GIFT_NAME], [GIFT_DESCRIPTION]) VALUES (25, N'Large Travel Mug', N'12 oz travel coffee mug')
INSERT [dbo].[MAGAZINE] ([PROD_ID], [PUB_ID], [GENRE_CODE], [MAG_TITLE], [MAG_ISSUENUM]) VALUES (4, 2, N'NEWS', N'U.S. Weekly', 3)
INSERT [dbo].[MAGAZINE] ([PROD_ID], [PUB_ID], [GENRE_CODE], [MAG_TITLE], [MAG_ISSUENUM]) VALUES (18, 6, N'NEWS', N'Time', 148)
INSERT [dbo].[MAGAZINE] ([PROD_ID], [PUB_ID], [GENRE_CODE], [MAG_TITLE], [MAG_ISSUENUM]) VALUES (19, 6, N'NEWS', N'People', 118)
INSERT [dbo].[MAGAZINE] ([PROD_ID], [PUB_ID], [GENRE_CODE], [MAG_TITLE], [MAG_ISSUENUM]) VALUES (20, 6, N'NEWS', N'Entertainment Weekly', 164)
SET ANSI_PADDING ON
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (1, 1, 1, 2, CAST(21.99 AS Decimal(9, 2)), 1, CAST(0x0000A4EF0142D803 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (1, 2, 5, 1, CAST(21.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (1, 3, 17, 2, CAST(3.49 AS Decimal(9, 2)), 0, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (1, 4, 23, 4, CAST(11.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (1, 5, 8, 1, CAST(21.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (2, 1, 2, 3, CAST(9.99 AS Decimal(9, 2)), 1, CAST(0x0000A4EF0142F15A AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (2, 2, 3, 2, CAST(12.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (2, 4, 24, 2, CAST(14.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (2, 5, 10, 1, CAST(21.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (3, 2, 14, 1, CAST(29.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
INSERT [dbo].[ORDERDETAIL] ([ORDDET_LINENUM], [ORDER_ID], [PROD_ID], [ORDDET_QTY], [ORDDET_RETAILPRICE], [ORDDET_ISOPEN], [ORDDET_SHIPDATE]) VALUES (3, 4, 25, 2, CAST(19.99 AS Decimal(9, 2)), 1, CAST(0x0000A4FD00000000 AS DateTime))
SET ANSI_PADDING OFF
INSERT [dbo].[ORDERPAYMENT] ([ORDER_ID], [PYMT_ID], [ORDPAY_AMOUNT]) VALUES (1, 1, CAST(31.98 AS Decimal(9, 2)))
INSERT [dbo].[ORDERPAYMENT] ([ORDER_ID], [PYMT_ID], [ORDPAY_AMOUNT]) VALUES (2, 4, CAST(77.96 AS Decimal(9, 2)))
INSERT [dbo].[ORDERPAYMENT] ([ORDER_ID], [PYMT_ID], [ORDPAY_AMOUNT]) VALUES (3, 1, CAST(6.98 AS Decimal(9, 2)))
INSERT [dbo].[ORDERPAYMENT] ([ORDER_ID], [PYMT_ID], [ORDPAY_AMOUNT]) VALUES (4, 5, CAST(117.92 AS Decimal(9, 2)))
INSERT [dbo].[ORDERPAYMENT] ([ORDER_ID], [PYMT_ID], [ORDPAY_AMOUNT]) VALUES (5, 2, CAST(30.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERPAYMENT] ([ORDER_ID], [PYMT_ID], [ORDPAY_AMOUNT]) VALUES (5, 3, CAST(13.98 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[ORDERS] ON 

INSERT [dbo].[ORDERS] ([ORDER_ID], [STORE_ID], [CUST_ID], [ORDER_TOTAL], [ORDER_ISBACKORDER], [ORDER_ISPYMTPROC], [ORDER_ORDERDATE], [ORDER_ISOPEN]) VALUES (1, 1, 1, CAST(31.98 AS Decimal(9, 2)), 0, 1, CAST(0x0000A4EF014328A8 AS DateTime), 1)
INSERT [dbo].[ORDERS] ([ORDER_ID], [STORE_ID], [CUST_ID], [ORDER_TOTAL], [ORDER_ISBACKORDER], [ORDER_ISPYMTPROC], [ORDER_ORDERDATE], [ORDER_ISOPEN]) VALUES (2, 1, 4, CAST(77.96 AS Decimal(9, 2)), 0, 1, CAST(0x0000A4FD00000000 AS DateTime), 1)
INSERT [dbo].[ORDERS] ([ORDER_ID], [STORE_ID], [CUST_ID], [ORDER_TOTAL], [ORDER_ISBACKORDER], [ORDER_ISPYMTPROC], [ORDER_ORDERDATE], [ORDER_ISOPEN]) VALUES (3, 2, 1, CAST(6.98 AS Decimal(9, 2)), 0, 1, CAST(0x0000A4FD00000000 AS DateTime), 0)
INSERT [dbo].[ORDERS] ([ORDER_ID], [STORE_ID], [CUST_ID], [ORDER_TOTAL], [ORDER_ISBACKORDER], [ORDER_ISPYMTPROC], [ORDER_ORDERDATE], [ORDER_ISOPEN]) VALUES (4, 2, 5, CAST(117.92 AS Decimal(9, 2)), 0, 1, CAST(0x0000A4FD00000000 AS DateTime), 1)
INSERT [dbo].[ORDERS] ([ORDER_ID], [STORE_ID], [CUST_ID], [ORDER_TOTAL], [ORDER_ISBACKORDER], [ORDER_ISPYMTPROC], [ORDER_ORDERDATE], [ORDER_ISOPEN]) VALUES (5, 1, 2, CAST(43.98 AS Decimal(9, 2)), 0, 1, CAST(0x0000A4FD01564CCB AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
SET IDENTITY_INSERT [dbo].[PAYMENT] ON 

INSERT [dbo].[PAYMENT] ([PYMT_ID], [CUST_ID], [PYMTTYPE_CODE], [PYMT_ACCTNUM], [PYMT_ROUTENUM], [PYMT_EXPDATE], [PYMT_CVV], [PYMT_BILLADDR], [PYMT_BILLCITY], [PYMT_BILLSTATE], [PYMT_BILLZIP]) VALUES (1, 1, N'VISA', N'4123456789012345', N'0        ', CAST(0x1D3D0B00 AS Date), N'123', N'104 Carmichael Ct', N'Cary', N'NC', N'27511')
INSERT [dbo].[PAYMENT] ([PYMT_ID], [CUST_ID], [PYMTTYPE_CODE], [PYMT_ACCTNUM], [PYMT_ROUTENUM], [PYMT_EXPDATE], [PYMT_CVV], [PYMT_BILLADDR], [PYMT_BILLCITY], [PYMT_BILLSTATE], [PYMT_BILLZIP]) VALUES (2, 2, N'MCRD', N'5432123456789012', N'0        ', CAST(0x2E3E0B00 AS Date), N'234', N'123 Any Street', N'Somewhere', N'MA', N'01440')
INSERT [dbo].[PAYMENT] ([PYMT_ID], [CUST_ID], [PYMTTYPE_CODE], [PYMT_ACCTNUM], [PYMT_ROUTENUM], [PYMT_EXPDATE], [PYMT_CVV], [PYMT_BILLADDR], [PYMT_BILLCITY], [PYMT_BILLSTATE], [PYMT_BILLZIP]) VALUES (3, 2, N'CHKG', N'9985476621', N'123456789', CAST(0x5B950A00 AS Date), N'0', N'123 Any Street', N'Somewhere', N'MA', N'01440')
INSERT [dbo].[PAYMENT] ([PYMT_ID], [CUST_ID], [PYMTTYPE_CODE], [PYMT_ACCTNUM], [PYMT_ROUTENUM], [PYMT_EXPDATE], [PYMT_CVV], [PYMT_BILLADDR], [PYMT_BILLCITY], [PYMT_BILLSTATE], [PYMT_BILLZIP]) VALUES (4, 4, N'AMEX', N'34561234598541', N'0        ', CAST(0xE03C0B00 AS Date), N'1234', N'254 Morris Drive', N'Winston Salem', N'NC', N'27103')
INSERT [dbo].[PAYMENT] ([PYMT_ID], [CUST_ID], [PYMTTYPE_CODE], [PYMT_ACCTNUM], [PYMT_ROUTENUM], [PYMT_EXPDATE], [PYMT_CVV], [PYMT_BILLADDR], [PYMT_BILLCITY], [PYMT_BILLSTATE], [PYMT_BILLZIP]) VALUES (5, 5, N'DISC', N'6011234567890123', N'0        ', CAST(0xCF3B0B00 AS Date), N'456', N'981 Mason Circle', N'Gardner', N'MA', N'01440')
SET IDENTITY_INSERT [dbo].[PAYMENT] OFF
INSERT [dbo].[PAYMENTTYPE] ([PYMTTYPE_CODE], [PYMTTYPE_DESCRIPTION]) VALUES (N'AMEX', N'American Express')
INSERT [dbo].[PAYMENTTYPE] ([PYMTTYPE_CODE], [PYMTTYPE_DESCRIPTION]) VALUES (N'CHKG', N'Checking Account')
INSERT [dbo].[PAYMENTTYPE] ([PYMTTYPE_CODE], [PYMTTYPE_DESCRIPTION]) VALUES (N'DISC', N'Discover')
INSERT [dbo].[PAYMENTTYPE] ([PYMTTYPE_CODE], [PYMTTYPE_DESCRIPTION]) VALUES (N'MCRD', N'Mastercard')
INSERT [dbo].[PAYMENTTYPE] ([PYMTTYPE_CODE], [PYMTTYPE_DESCRIPTION]) VALUES (N'VISA', N'Visa')
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (1, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 6, 0)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (2, N'CAFE', CAST(0.10 AS Decimal(7, 2)), CAST(1.99 AS Decimal(7, 2)), 20, 0)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (3, N'GIFT', CAST(3.99 AS Decimal(7, 2)), CAST(12.99 AS Decimal(7, 2)), 10, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (4, N'MAG', CAST(2.99 AS Decimal(7, 2)), CAST(9.99 AS Decimal(7, 2)), 5, 0)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (5, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 8, 0)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (6, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 3, 7)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (7, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 4, 7)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (8, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 2, 7)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (9, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 3, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (10, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 4, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (11, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 2, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (12, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 6, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (13, N'BOOK', CAST(9.99 AS Decimal(7, 2)), CAST(21.99 AS Decimal(7, 2)), 2, 4)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (14, N'BOOK', CAST(14.99 AS Decimal(7, 2)), CAST(29.99 AS Decimal(7, 2)), 5, 8)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (15, N'CAFE', CAST(1.50 AS Decimal(7, 2)), CAST(2.99 AS Decimal(7, 2)), 3, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (16, N'CAFE', CAST(1.50 AS Decimal(7, 2)), CAST(2.99 AS Decimal(7, 2)), 2, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (17, N'CAFE', CAST(2.00 AS Decimal(7, 2)), CAST(3.49 AS Decimal(7, 2)), 18, 15)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (18, N'MAG', CAST(2.99 AS Decimal(7, 2)), CAST(9.99 AS Decimal(7, 2)), 8, 10)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (19, N'MAG', CAST(2.99 AS Decimal(7, 2)), CAST(9.99 AS Decimal(7, 2)), 6, 10)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (20, N'MAG', CAST(2.99 AS Decimal(7, 2)), CAST(9.99 AS Decimal(7, 2)), 4, 10)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (21, N'GIFT', CAST(15.99 AS Decimal(7, 2)), CAST(29.99 AS Decimal(7, 2)), 6, 5)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (22, N'GIFT', CAST(10.99 AS Decimal(7, 2)), CAST(24.99 AS Decimal(7, 2)), 8, 0)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (23, N'GIFT', CAST(5.99 AS Decimal(7, 2)), CAST(11.99 AS Decimal(7, 2)), 12, 20)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (24, N'GIFT', CAST(7.99 AS Decimal(7, 2)), CAST(14.99 AS Decimal(7, 2)), 8, 20)
INSERT [dbo].[PRODUCT] ([PROD_ID], [PROD_TYPE], [PROD_UNITCOST], [PROD_RETAILPRICE], [PROD_CURRQTY], [PROD_ONORDERQTY]) VALUES (25, N'GIFT', CAST(8.99 AS Decimal(7, 2)), CAST(19.99 AS Decimal(7, 2)), 6, 20)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
SET IDENTITY_INSERT [dbo].[PUBLISHER] ON 

INSERT [dbo].[PUBLISHER] ([PUB_ID], [PUB_NAME], [PUB_CITY], [PUB_STATE]) VALUES (1, N'Penguin Publishing Group', N'Boston', N'MA')
INSERT [dbo].[PUBLISHER] ([PUB_ID], [PUB_NAME], [PUB_CITY], [PUB_STATE]) VALUES (2, N'Scholastic, Inc', N'New York', N'NY')
INSERT [dbo].[PUBLISHER] ([PUB_ID], [PUB_NAME], [PUB_CITY], [PUB_STATE]) VALUES (3, N'Houghton Mifflin Harcourt', N'Orlando', N'FL')
INSERT [dbo].[PUBLISHER] ([PUB_ID], [PUB_NAME], [PUB_CITY], [PUB_STATE]) VALUES (4, N'Beta Nu Publishing', N'Chicago', N'IL')
INSERT [dbo].[PUBLISHER] ([PUB_ID], [PUB_NAME], [PUB_CITY], [PUB_STATE]) VALUES (5, N'HarperCollins Publishers', N'Los Angeles', N'CA')
INSERT [dbo].[PUBLISHER] ([PUB_ID], [PUB_NAME], [PUB_CITY], [PUB_STATE]) VALUES (6, N'Time, Inc', N'New York', N'NY')
SET IDENTITY_INSERT [dbo].[PUBLISHER] OFF
SET IDENTITY_INSERT [dbo].[STORE] ON 

INSERT [dbo].[STORE] ([STORE_ID], [STORE_NAME], [STORE_ADDR1], [STORE_ADDR2], [STORE_CITY], [STORE_STATE], [STORE_ZIP], [STORE_PHONE], [STORE_FAX]) VALUES (1, N'Books R Us South', N'123 Any Street', NULL, N'Gardner', N'MA', N'01440', N'508-555-1234', N'508-555-1235')
INSERT [dbo].[STORE] ([STORE_ID], [STORE_NAME], [STORE_ADDR1], [STORE_ADDR2], [STORE_CITY], [STORE_STATE], [STORE_ZIP], [STORE_PHONE], [STORE_FAX]) VALUES (2, N'Books R Us North', N'498 Some Street', NULL, N'Manchester', N'NH', N'01230', N'614-555-2345', N'614-555-2347')
SET IDENTITY_INSERT [dbo].[STORE] OFF
ALTER TABLE [dbo].[CUSTOMER] ADD  CONSTRAINT [DF_CUSTOMER_CUST_PHONE]  DEFAULT (((0)-(0))-(0)) FOR [CUST_PHONE]
GO
ALTER TABLE [dbo].[ORDERDETAIL] ADD  CONSTRAINT [DF_ORDERDETAIL_ORDDET_QTY]  DEFAULT ((0)) FOR [ORDDET_QTY]
GO
ALTER TABLE [dbo].[ORDERDETAIL] ADD  CONSTRAINT [DF_ORDERDETAIL_ORDDET_UNITPRICE]  DEFAULT ((0.00)) FOR [ORDDET_RETAILPRICE]
GO
ALTER TABLE [dbo].[ORDERDETAIL] ADD  CONSTRAINT [DF_ORDERDETAIL_ORDDET_ISOPEN]  DEFAULT ((1)) FOR [ORDDET_ISOPEN]
GO
ALTER TABLE [dbo].[ORDERDETAIL] ADD  CONSTRAINT [DF_ORDERDETAIL_ORDDET_SHIPDATE]  DEFAULT (getdate()) FOR [ORDDET_SHIPDATE]
GO
ALTER TABLE [dbo].[ORDERPAYMENT] ADD  CONSTRAINT [DF_ORDERPAYMENT_ORDPAY_AMOUNT]  DEFAULT ((0.00)) FOR [ORDPAY_AMOUNT]
GO
ALTER TABLE [dbo].[ORDERS] ADD  CONSTRAINT [DF_ORDER_ORDER_TOTAL]  DEFAULT ((0.00)) FOR [ORDER_TOTAL]
GO
ALTER TABLE [dbo].[ORDERS] ADD  CONSTRAINT [DF_ORDER_ORDER_ISBACKORDER]  DEFAULT ((0)) FOR [ORDER_ISBACKORDER]
GO
ALTER TABLE [dbo].[ORDERS] ADD  CONSTRAINT [DF_ORDER_ORDER_ISPYMTPROC]  DEFAULT ((0)) FOR [ORDER_ISPYMTPROC]
GO
ALTER TABLE [dbo].[ORDERS] ADD  CONSTRAINT [DF_ORDER_ORDER_ORDERDATE]  DEFAULT (getdate()) FOR [ORDER_ORDERDATE]
GO
ALTER TABLE [dbo].[ORDERS] ADD  CONSTRAINT [DF_ORDER_ORDER_ISOPEN]  DEFAULT ((1)) FOR [ORDER_ISOPEN]
GO
ALTER TABLE [dbo].[PAYMENT] ADD  CONSTRAINT [DF_PAYMENT_PYMT_ROUTENUM]  DEFAULT ((0)) FOR [PYMT_ROUTENUM]
GO
ALTER TABLE [dbo].[PAYMENT] ADD  CONSTRAINT [DF_PAYMENT_PYMT_EXPDATE]  DEFAULT ('1900-01-01') FOR [PYMT_EXPDATE]
GO
ALTER TABLE [dbo].[PAYMENT] ADD  CONSTRAINT [DF_PAYMENT_PYMT_CVV]  DEFAULT ((0)) FOR [PYMT_CVV]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_PROD_TYPE]  DEFAULT (N'BOOK') FOR [PROD_TYPE]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_PROD_UNITCOST]  DEFAULT ((0.00)) FOR [PROD_UNITCOST]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_PROD_RETAILPRICE]  DEFAULT ((0.00)) FOR [PROD_RETAILPRICE]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_PROD_CURRQTY]  DEFAULT ((0)) FOR [PROD_CURRQTY]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_PROD_ONORDERQTY]  DEFAULT ((0)) FOR [PROD_ONORDERQTY]
GO
ALTER TABLE [dbo].[STORE] ADD  CONSTRAINT [DF_STORE_STORE_PHONE]  DEFAULT (((0)-(0))-(0)) FOR [STORE_PHONE]
GO
ALTER TABLE [dbo].[STORE] ADD  CONSTRAINT [DF_STORE_STORE_FAX]  DEFAULT (((0)-(0))-(0)) FOR [STORE_FAX]
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_AUTHOR] FOREIGN KEY([AUTH_ID])
REFERENCES [dbo].[AUTHOR] ([AUTH_ID])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [FK_BOOK_AUTHOR]
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_GENRE] FOREIGN KEY([GENRE_CODE])
REFERENCES [dbo].[GENRE] ([GENRE_CODE])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [FK_BOOK_GENRE]
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_PUBLISHER] FOREIGN KEY([PUB_ID])
REFERENCES [dbo].[PUBLISHER] ([PUB_ID])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [FK_BOOK_PUBLISHER]
GO
ALTER TABLE [dbo].[MAGAZINE]  WITH CHECK ADD  CONSTRAINT [FK_MAGAZINE_GENRE] FOREIGN KEY([GENRE_CODE])
REFERENCES [dbo].[GENRE] ([GENRE_CODE])
GO
ALTER TABLE [dbo].[MAGAZINE] CHECK CONSTRAINT [FK_MAGAZINE_GENRE]
GO
ALTER TABLE [dbo].[MAGAZINE]  WITH CHECK ADD  CONSTRAINT [FK_MAGAZINE_PUBLISHER] FOREIGN KEY([PUB_ID])
REFERENCES [dbo].[PUBLISHER] ([PUB_ID])
GO
ALTER TABLE [dbo].[MAGAZINE] CHECK CONSTRAINT [FK_MAGAZINE_PUBLISHER]
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDETAIL_ORDERS] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDERS] ([ORDER_ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL] CHECK CONSTRAINT [FK_ORDERDETAIL_ORDERS]
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDETAIL_PRODUCT] FOREIGN KEY([PROD_ID])
REFERENCES [dbo].[PRODUCT] ([PROD_ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL] CHECK CONSTRAINT [FK_ORDERDETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[ORDERPAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_ORDERPAYMENT_ORDERS] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDERS] ([ORDER_ID])
GO
ALTER TABLE [dbo].[ORDERPAYMENT] CHECK CONSTRAINT [FK_ORDERPAYMENT_ORDERS]
GO
ALTER TABLE [dbo].[ORDERPAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_ORDERPAYMENT_PAYMENT] FOREIGN KEY([PYMT_ID])
REFERENCES [dbo].[PAYMENT] ([PYMT_ID])
GO
ALTER TABLE [dbo].[ORDERPAYMENT] CHECK CONSTRAINT [FK_ORDERPAYMENT_PAYMENT]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUSTOMER] FOREIGN KEY([CUST_ID])
REFERENCES [dbo].[CUSTOMER] ([CUST_ID])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUSTOMER]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_STORE] FOREIGN KEY([STORE_ID])
REFERENCES [dbo].[STORE] ([STORE_ID])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_STORE]
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_PAYMENT_CUSTOMER] FOREIGN KEY([CUST_ID])
REFERENCES [dbo].[CUSTOMER] ([CUST_ID])
GO
ALTER TABLE [dbo].[PAYMENT] CHECK CONSTRAINT [FK_PAYMENT_CUSTOMER]
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_PAYMENT_PAYMENTTYPE] FOREIGN KEY([PYMTTYPE_CODE])
REFERENCES [dbo].[PAYMENTTYPE] ([PYMTTYPE_CODE])
GO
ALTER TABLE [dbo].[PAYMENT] CHECK CONSTRAINT [FK_PAYMENT_PAYMENTTYPE]
GO
USE [master]
GO
ALTER DATABASE [BooksRUs] SET  READ_WRITE 
GO
