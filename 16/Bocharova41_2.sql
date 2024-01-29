USE [master]
GO
/****** Object:  Database [Bocharova41]    Script Date: 29.01.2024 18:10:07 ******/
CREATE DATABASE [Bocharova41]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bocharova41', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Bocharova41.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bocharova41_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Bocharova41_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bocharova41] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bocharova41].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bocharova41] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bocharova41] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bocharova41] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bocharova41] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bocharova41] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bocharova41] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bocharova41] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bocharova41] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bocharova41] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bocharova41] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bocharova41] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bocharova41] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bocharova41] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bocharova41] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bocharova41] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bocharova41] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bocharova41] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bocharova41] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bocharova41] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bocharova41] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bocharova41] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bocharova41] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bocharova41] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bocharova41] SET  MULTI_USER 
GO
ALTER DATABASE [Bocharova41] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bocharova41] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bocharova41] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bocharova41] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bocharova41] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bocharova41] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bocharova41] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bocharova41] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bocharova41]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29.01.2024 18:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderClientFirstname] [nvarchar](max) NULL,
	[OrderClientName] [nvarchar](max) NULL,
	[OrderClientOtchestvo] [nvarchar](max) NULL,
	[OrderReceiveCode] [int] NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF17FA90AE] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 29.01.2024 18:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK__OrderPro__817A2662F2975849] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 29.01.2024 18:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] NOT NULL,
	[Index] [int] NULL,
	[City] [nvarchar](150) NULL,
	[Street] [nvarchar](150) NULL,
	[House number] [int] NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.01.2024 18:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](150) NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductUnit] [nvarchar](50) NULL,
	[ProductDiscountMax] [tinyint] NULL,
	[ProductProvider] [nvarchar](max) NOT NULL,
	[ProductStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD54298FB63] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.01.2024 18:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.01.2024 18:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC058E4D5C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 10, N'Анохин', N'Арсений', N'Андреевич', 911, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 5, N'Козлов', N'Максим', N'Максимович', 912, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime), 11, N'Черных', N'Марк', N'Кириллович', 913, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 10, N'', N'', N'', 914, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 1, N'', N'', N'', 915, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 32, N'', N'', N'', 916, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-28T00:00:00.000' AS DateTime), 20, N'Козлов', N'Давид', N'Александрович', 917, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-29T00:00:00.000' AS DateTime), 34, N'', N'', N'', 918, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 25, N'', N'', N'', 919, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientFirstname], [OrderClientName], [OrderClientOtchestvo], [OrderReceiveCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-25T00:00:00.000' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), 36, N'', N'', N'', 920, N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'H782T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'F635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'G783F5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'D572U8', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'J384T6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'B320R5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'D329H3', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'G432E4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'S213E3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'K345R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'S634B5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'G531F4', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'J542F5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'C436G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'P764G4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'D364R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'S326R5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'D268G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'M542T5', 2)
GO
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (1, 344288, N'  Москва', N' ул. Чехова', 1)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (2, 614164, N' Москва', N'  ул. Степная', 30)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (3, 394242, N'  Москва', N' ул. Коммунистическая', 43)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (4, 660540, N'  Москва', N' ул. Солнечная', 25)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (5, 125837, N'  Москва', N' ул. Шоссейная', 40)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (6, 125703, N'  Москва', N' ул. Партизанская', 49)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (7, 625283, N'  Москва', N' ул. Победы', 46)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (8, 614611, N'  Москва', N' ул. Молодежная', 50)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (9, 454311, N' Москва', N' ул. Новая', 19)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (10, 660007, N' Москва', N' ул. Октябрьская', 19)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (11, 603036, N'  Москва', N' ул. Садовая', 4)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (12, 450983, N' Москва', N' ул. Комсомольская', 26)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (13, 394782, N'  Москва', N' ул. Чехова', 3)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (14, 603002, N'  Москва', N' ул. Дзержинского', 28)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (15, 450558, N'  Москва', N' ул. Набережная', 30)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (16, 394060, N' Москва', N' ул. Фрунзе', 43)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (17, 410661, N'  Москва', N' ул. Школьная', 50)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (18, 625590, N'  Москва', N' ул. Коммунистическая', 20)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (19, 625683, N'  Москва', N' ул. 8 Марта', NULL)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (20, 400562, N'  Москва', N' ул. Зеленая', 32)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (21, 614510, N'  Москва', N' ул. Маяковского', 47)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (22, 410542, N'  Москва', N' ул. Светлая', 46)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (23, 620839, N'  Москва', N' ул. Цветочная', 8)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (24, 443890, N'  Москва', N' ул. Коммунистическая', 1)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (25, 603379, N'  Москва', N' ул. Спортивная', 46)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (26, 603721, N'  Москва', N' ул. Гоголя', 41)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (27, 410172, N'  Москва', N' ул. Северная', 13)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (28, 420151, N'  Москва', N' ул. Вишневая', 32)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (29, 125061, N'  Москва', N' ул. Подгорная', 8)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (30, 630370, N'  Москва', N' ул. Шоссейная', 24)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (31, 614753, N'  Москва', N' ул. Полевая', 35)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (32, 426030, N'  Москва', N' ул. Маяковского', 44)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (33, 450375, N'  Москва', N' ул. Клубная', 44)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (34, 625560, N'  Москва', N' ул. Некрасова', 12)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (35, 630201, N'  Москва', N' ул. Комсомольская', 17)
INSERT [dbo].[PickupPoint] ([ID], [Index], [City], [Street], [House number]) VALUES (36, 190949, N'  Москва', N' ул. Мичурина', 26)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'B320R5', N'Туфли', N'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', N'Женская обувь', N'Resources\Товар_import\B320R5.jpg', N'Rieker', CAST(4300.00 AS Decimal(19, 2)), 2, 6, N'шт.', 15, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'B431R5', N'Ботинки', N'Мужские кожаные ботинки/мужские ботинки', N'Мужская обувь', NULL, N'Rieker', CAST(2700.00 AS Decimal(19, 2)), 2, 5, N'шт.', 10, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'C436G5', N'Ботинки', N'Ботинки женские, ARGO, размер 40', N'Женская обувь', NULL, N'Alessio Nesca', CAST(10200.00 AS Decimal(19, 2)), 2, 9, N'шт.', 15, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'D268G5', N'Туфли', N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', N'Женская обувь', NULL, N'Rieker', CAST(4399.00 AS Decimal(19, 2)), 3, 12, N'шт.', 10, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'D329H3', N'Полуботинки', N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'Женская обувь', N'Resources\Товар_import\D329H3.jpg', N'Alessio Nesca', CAST(1890.00 AS Decimal(19, 2)), 4, 4, N'шт.', 10, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'D364R4', N'Туфли', N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', N'Женская обувь', NULL, N'Kari', CAST(12400.00 AS Decimal(19, 2)), 2, 5, N'шт.', 10, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'D572U8', N'Кроссовки', N'129615-4 Кроссовки мужские', N'Мужская обувь', N'Resources\Товар_import\D572U8.jpg', N'Рос', CAST(4100.00 AS Decimal(19, 2)), 3, 6, N'шт.', 5, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'E482R4', N'Полуботинки', N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(1800.00 AS Decimal(19, 2)), 2, 14, N'шт.', 15, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'F427R5', N'Ботинки', N'Ботинки на молнии с декоративной пряжкой FRAU', N'Женская обувь', NULL, N'Rieker', CAST(11800.00 AS Decimal(19, 2)), 4, 11, N'шт.', 10, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'F572H7', N'Туфли', N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'Женская обувь', N'Resources\Товар_import\F572H7.jpg', N'Marco Tozzi', CAST(2700.00 AS Decimal(19, 2)), 2, 14, N'шт.', 15, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'F635R4', N'Ботинки', N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'Женская обувь', N'Resources\Товар_import\F635R4.jpg', N'Marco Tozzi', CAST(3244.00 AS Decimal(19, 2)), 2, 13, N'шт.', 20, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'G432E4', N'Туфли', N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'Женская обувь', N'Resources\Товар_import\G432E4.jpg', N'Kari', CAST(2800.00 AS Decimal(19, 2)), 3, 15, N'шт.', 10, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'G531F4', N'Ботинки', N'Ботинки женские зимние ROMER арт. 893167-01 Черный', N'Женская обувь', NULL, N'Kari', CAST(6600.00 AS Decimal(19, 2)), 2, 9, N'шт.', 5, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'G783F5', N'Ботинки', N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'Мужская обувь', N'Resources\Товар_import\G783F5.jpg', N'Рос', CAST(5900.00 AS Decimal(19, 2)), 2, 8, N'шт.', 25, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'H535R5', N'Ботинки', N'Женские Ботинки демисезонные', N'Женская обувь', NULL, N'Rieker', CAST(2300.00 AS Decimal(19, 2)), 2, 7, N'шт.', 25, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'H782T5', N'Туфли', N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'Мужская обувь', N'Resources\Товар_import\H782T5.jpg', N'Kari', CAST(4499.00 AS Decimal(19, 2)), 4, 5, N'шт.', 30, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'J384T6', N'Ботинки', N'B3430/14 Полуботинки мужские Rieker', N'Мужская обувь', N'Resources\Товар_import\J384T6.jpg', N'Rieker', CAST(3800.00 AS Decimal(19, 2)), 2, 16, N'шт.', 10, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'J542F5', N'Тапочки', N'Тапочки мужские Арт.70701-55-67син р.41', N'Мужская обувь', NULL, N'Kari', CAST(500.00 AS Decimal(19, 2)), 3, 12, N'шт.', 5, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'K345R4', N'Полуботинки', N'407700/01-02 Полуботинки мужские CROSBY', N'Мужская обувь', NULL, N'CROSBY', CAST(2100.00 AS Decimal(19, 2)), 2, 3, N'шт.', 15, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'K358H6', N'Тапочки', N'Тапочки мужские син р.41', N'Мужская обувь', NULL, N'Rieker', CAST(599.00 AS Decimal(19, 2)), 3, 2, N'шт.', 5, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'L754R4', N'Полуботинки', N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(1700.00 AS Decimal(19, 2)), 2, 7, N'шт.', 10, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'M542T5', N'Кроссовки', N'Кроссовки мужские TOFA', N'Мужская обувь', NULL, N'Rieker', CAST(2800.00 AS Decimal(19, 2)), 5, 3, N'шт.', 5, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'N457T5', N'Полуботинки', N'Полуботинки Ботинки черные зимние, мех', N'Женская обувь', NULL, N'CROSBY', CAST(4600.00 AS Decimal(19, 2)), 3, 13, N'шт.', 5, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'O754F4', N'Туфли', N'Туфли женские демисезонные Rieker артикул 55073-68/37', N'Женская обувь', NULL, N'Rieker', CAST(5400.00 AS Decimal(19, 2)), 4, 18, N'шт.', 10, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'P764G4', N'Туфли', N'Туфли женские, ARGO, размер 38', N'Женская обувь', NULL, N'CROSBY', CAST(6800.00 AS Decimal(19, 2)), 3, 15, N'шт.', 30, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'S213E3', N'Полуботинки', N'407700/01-01 Полуботинки мужские CROSBY', N'Мужская обувь', NULL, N'CROSBY', CAST(2156.00 AS Decimal(19, 2)), 3, 6, N'шт.', 5, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'S326R5', N'Тапочки', N'Мужские кожаные тапочки "Профиль С.Дали" ', N'Мужская обувь', NULL, N'CROSBY', CAST(9900.00 AS Decimal(19, 2)), 3, 15, N'шт.', 15, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'S634B5', N'Кеды', N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', N'Мужская обувь', NULL, N'CROSBY', CAST(5500.00 AS Decimal(19, 2)), 3, 6, N'шт.', 20, N'Обувь для вас', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'T324F5', N'Сапоги', N'Сапоги замша Цвет: синий', N'Женская обувь', NULL, N'CROSBY', CAST(4699.00 AS Decimal(19, 2)), 2, 5, N'шт.', 15, N'Kari', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductUnit], [ProductDiscountMax], [ProductProvider], [ProductStatus]) VALUES (N'А112Т4', N'Ботинки', N'Женские Ботинки демисезонные kari', N'Женская обувь', N'Resources\Товар_import\А112Т4.jpg', N'Kari', CAST(4990.00 AS Decimal(19, 2)), 3, 6, N'шт.', 30, N'Kari', NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Герасимов ', N'Вячеслав', N'Ростиславович', N'loginDEftn2018', N'gPq+a}', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Суворов ', N'Всеволод', N'Богданович', N'loginDEhuv2018', N'EJFYzS', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Ширяев ', N'Иван', N'Игоревич', N'loginDEfhd2018', N'{4wU7n', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Колобова ', N'Иванна', N'Геннадьевна', N'loginDEaon2018', N'&OmaNE', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шестаков ', N'Антон', N'Константинович', N'loginDEyat2018', N'ELSTyH', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Игнатьев ', N'Федосей', N'Богданович', N'loginDEmin2018', N'pQ6jze', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Горбунов ', N'Валентин', N'Григорьевич', N'loginDEzal2018', N'zbU8R5', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Терентьева ', N'Анжела', N'Михаиловна', N'loginDEemw2018', N'NxhF5I', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Мясникова ', N'Ия', N'Евсеевна', N'loginDEmqt2018', N'SIasu5', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Горбунов ', N'Григорий', N'Денисович', N'loginDEpxx2018', N'Xv{vjN', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Герасимов ', N'Олег', N'Авксентьевич', N'loginDEetv2018', N'lNi&rF', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Меркушева ', N'Нинель', N'Матвеевна', N'loginDEonq2018', N'mKIIRQ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Степанов ', N'Григорий', N'Матвеевич', N'loginDErhl2018', N'U}rb9j', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Агафонов ', N'Владлен', N'Станиславович', N'loginDEfou2018', N'O+S9hm', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Кузнецов ', N'Фрол', N'Георгьевич', N'loginDElno2018', N'le1vt2', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Игнатьев ', N'Борис', N'Владиславович', N'loginDEtbx2018', N'CQplH|', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Симонов ', N'Юрий', N'Созонович', N'loginDEltw2018', N'zvjkwE', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Степанов ', N'Евсей', N'Федотович', N'loginDEfuz2018', N'ILry03', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зыков ', N'Вячеслав', N'Антонович', N'loginDEygj2018', N'7b6PUb', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Анисимова ', N'Алина', N'Протасьевна', N'loginDEwpn2018', N'9BBkXP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Артемьева ', N'Лариса', N'Макаровна', N'loginDEyix2018', N'6zbXg*', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Мамонтова ', N'Ия', N'Христофоровна', N'loginDEtms2018', N'70Z&Zy', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Котова ', N'Светлана', N'Леонидовна', N'loginDEmgl2018', N'QJNgD&', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Фёдорова ', N'Алла', N'Брониславовна', N'loginDEhix2018', N'ZKnd*0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Гущина ', N'Анжела', N'Аркадьевна', N'loginDEwbk2018', N'iJMh5B', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Дмитриев ', N'Григорий', N'Мэлорович', N'loginDEpwa2018', N'yn5MLQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Дроздова ', N'Фёкла', N'Митрофановна', N'loginDElrx2018', N'lbX+dF', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Гаврилов ', N'Василий', N'Германович', N'loginDEidx2018', N'R2j0mn', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Суханова ', N'Фаина', N'Юрьевна', N'loginDEzmk2018', N'ZrgBk6', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Савельев ', N'Егор', N'Сергеевич', N'loginDEvje2018', N'gCU1fd', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Иван ', N'Васильевна', NULL, N'loginDEwun2018', N'yy+Qhe', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Сазонова ', N'Клавдия', N'Евгеньевна', N'loginDEfzq2018', N'36H8f}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Шаров ', N'Григорий', N'Созонович', N'loginDEwel2018', N'UU5FTi', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Щербаков ', N'Кондрат', N'Фёдорович', N'loginDEljg2018', N'CT44Gc', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Дроздов ', N'Дмитрий', N'Юлианович', N'loginDEgsp2018', N'9ACW}r', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Молчанов ', N'Юрий', N'Лукьянович', N'loginDEjvp2018', N'etLGcB', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Тихонов ', N'Валентин', N'Авдеевич', N'loginDEapt2018', N'cwx{RH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Виноградов ', N'Юрий', N'Лукьевич', N'loginDEilb2018', N'IN2Ahc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Горбунова ', N'Нинель', N'Сергеевна', N'loginDErch2018', N'|&DFy+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Маслов ', N'Леонид', N'Николаевич', N'loginDEfwx2018', N't|*wCk', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Родионова ', N'Венера', N'Арсеньевна', N'loginDEggp2018', N'bBNxJb', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Агафонов ', N'Пантелеймон', N'Гордеевич', N'loginDEbgb2018', N'VtmP58', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Кудрявцев ', N'Гордей', N'Авксентьевич', N'loginDEnif2018', N'Nhj*t+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Лыткина ', N'Алевтина', N'Романовна', N'loginDEsvs2018', N'tLgPnC', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Князев ', N'Геласий', N'Евсеевич', N'loginDEghx2018', N'gue+iw', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Бирюкова ', N'Пелагея', N'Дмитрьевна', N'loginDElmy2018', N'X2LtuP', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Быков ', N'Лаврентий', N'Ярославович', N'loginDEevd2018', N'GMbcZN', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Воронов ', N'Олег', N'Яковович', N'loginDEodd2018', N's2|Eb1', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Богданова ', N'Марфа', N'Владимировна', N'loginDEmrj2018', N'blrD&8', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Беляев ', N'Донат', N'Агафонович', N'loginDEyct2018', N'uD+|Ud', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__398D8EEE] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__398D8EEE]
GO
USE [master]
GO
ALTER DATABASE [Bocharova41] SET  READ_WRITE 
GO
