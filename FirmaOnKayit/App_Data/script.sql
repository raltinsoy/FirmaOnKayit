USE [master]
GO
/****** Object:  Database [FirmaKayitDB]    Script Date: 4.4.2018 22:58:22 ******/
CREATE DATABASE [FirmaKayitDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FirmaKayitDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FirmaKayitDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FirmaKayitDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FirmaKayitDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FirmaKayitDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FirmaKayitDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FirmaKayitDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FirmaKayitDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FirmaKayitDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FirmaKayitDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FirmaKayitDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FirmaKayitDB] SET  MULTI_USER 
GO
ALTER DATABASE [FirmaKayitDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FirmaKayitDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FirmaKayitDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FirmaKayitDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FirmaKayitDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FirmaKayitDB', N'ON'
GO
ALTER DATABASE [FirmaKayitDB] SET QUERY_STORE = OFF
GO
USE [FirmaKayitDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FirmaKayitDB]
GO
/****** Object:  Table [dbo].[F2_Bankalar]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F2_Bankalar](
	[BankaKodu] [nvarchar](4) NOT NULL,
	[BankaAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bankalar_1] PRIMARY KEY CLUSTERED 
(
	[BankaKodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BankalarView]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BankalarView]
AS
SELECT        BankaKodu, BankaAdi
FROM            dbo.F2_Bankalar
GO
/****** Object:  Table [dbo].[F2_ParaBirimleri]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F2_ParaBirimleri](
	[ParaBirimiKodu] [nvarchar](4) NOT NULL,
	[ParaBirimiAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ParaBirimleri] PRIMARY KEY CLUSTERED 
(
	[ParaBirimiKodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ParaBirimleriView]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ParaBirimleriView]
AS
SELECT        ParaBirimiKodu, ParaBirimiAdi
FROM            dbo.F2_ParaBirimleri
GO
/****** Object:  Table [dbo].[F3_Sektor]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F3_Sektor](
	[SektorID] [int] IDENTITY(1,1) NOT NULL,
	[SektorAdi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Sektor] PRIMARY KEY CLUSTERED 
(
	[SektorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SektorView]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SektorView]
AS
SELECT        SektorID, SektorAdi
FROM            dbo.F3_Sektor
GO
/****** Object:  Table [dbo].[F1_Personeller]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F1_Personeller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsimSoyisim] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PersonellerView]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PersonellerView]
AS
SELECT        ID, IsimSoyisim
FROM            dbo.F1_Personeller
GO
/****** Object:  Table [dbo].[F3_HariciMalGrubu]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F3_HariciMalGrubu](
	[ID] [nvarchar](5) NOT NULL,
	[Text] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_HariciMalGrubu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HariciMalGrubuView]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HariciMalGrubuView]
AS
SELECT        ID, Text
FROM            dbo.F3_HariciMalGrubu
GO
/****** Object:  Table [dbo].[F1_FabrikaAdresi]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F1_FabrikaAdresi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[Sehir] [smallint] NOT NULL,
	[PostaKodu] [nvarchar](10) NULL,
	[AcikAdres] [nvarchar](450) NOT NULL,
	[Semt] [nvarchar](40) NOT NULL,
	[PostaKutusu] [nvarchar](50) NULL,
	[Telefon1] [nvarchar](50) NOT NULL,
	[Telefon2] [nvarchar](50) NULL,
	[Faks1] [nvarchar](50) NULL,
	[Mobil] [nvarchar](50) NULL,
 CONSTRAINT [PK_FabrikaAdresi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F1_MerkezAdresi]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F1_MerkezAdresi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[Sehir] [smallint] NOT NULL,
	[PostaKodu] [nvarchar](10) NULL,
	[AcikAdres] [nvarchar](450) NOT NULL,
	[Semt] [nvarchar](40) NOT NULL,
	[PostaKutusu] [nvarchar](50) NULL,
	[Telefon1] [nvarchar](50) NOT NULL,
	[Telefon2] [nvarchar](50) NULL,
	[Telefon3] [nvarchar](50) NULL,
	[Faks1] [nvarchar](50) NOT NULL,
	[Faks2] [nvarchar](50) NULL,
	[Faks3] [nvarchar](50) NULL,
	[Mobil] [nvarchar](50) NULL,
 CONSTRAINT [PK_MerkezAdresi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F1_SirketOrtaklari]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F1_SirketOrtaklari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Ortaklik] [float] NULL,
	[FirmaID] [int] NOT NULL,
 CONSTRAINT [PK_SirketOrtaklari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F1_SubeAdresi]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F1_SubeAdresi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[Sehir] [smallint] NOT NULL,
	[PostaKodu] [nvarchar](10) NULL,
	[AcikAdres] [nvarchar](450) NOT NULL,
	[Semt] [nvarchar](40) NOT NULL,
	[PostaKutusu] [nvarchar](50) NULL,
	[Telefon1] [nvarchar](50) NOT NULL,
	[Telefon2] [nvarchar](50) NULL,
	[Faks1] [nvarchar](50) NULL,
	[Mobil] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubeAdresi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F2_BankaBilgileri]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F2_BankaBilgileri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[BankaKodu] [nvarchar](4) NOT NULL,
	[IbanNo] [nvarchar](26) NOT NULL,
	[ParaBirimiKodu] [nvarchar](4) NOT NULL,
 CONSTRAINT [PK_BankaBilgileri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F2_FirmaGenelBilgi2]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F2_FirmaGenelBilgi2](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[SektorID] [int] NOT NULL,
	[FirmaFaliyetSekli] [nvarchar](9) NOT NULL,
	[SirketCirosu] [nvarchar](9) NOT NULL,
	[SirketCiroYili] [int] NOT NULL,
	[ToplamCalisanSayisi] [int] NULL,
	[IdariCalisan] [int] NULL,
	[Uretim] [int] NULL,
	[OnYilFazlaPers] [int] NULL,
	[Satis] [int] NULL,
	[Kalite] [int] NULL,
	[BagimsizDenetleme] [bit] NOT NULL,
	[TedarikciKaliteYonetim] [bit] NOT NULL,
	[KaliteSistemiBelgesi] [bit] NOT NULL,
	[ISO9001_K] [nvarchar](150) NULL,
	[ISO9001_Sure] [datetime] NULL,
	[ISO14001_K] [nvarchar](150) NULL,
	[ISO14001_Sure] [datetime] NULL,
	[OHSAS18001_K] [nvarchar](150) NULL,
	[OHSAS18001_Sure] [datetime] NULL,
	[Diger_K] [nvarchar](150) NULL,
	[Diger_Sure] [datetime] NULL,
 CONSTRAINT [PK_FirmaGenelBilgi2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F2_Referanslar]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F2_Referanslar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[FirmaAdi] [nvarchar](150) NOT NULL,
	[Ciro] [nvarchar](9) NULL,
	[YurtIci] [bit] NOT NULL,
 CONSTRAINT [PK_Referanslar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F3_FirmaGenelBilgi3]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F3_FirmaGenelBilgi3](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[FormDolAd] [nvarchar](30) NOT NULL,
	[FormDolSoyad] [nvarchar](30) NOT NULL,
	[FormDolUnvan] [nvarchar](30) NOT NULL,
	[FormDolDepart] [nvarchar](30) NOT NULL,
	[FormDolTel] [nvarchar](50) NOT NULL,
	[FormDolFaks] [nvarchar](50) NULL,
 CONSTRAINT [PK_FirmaGenelBilgi3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F3_HariciMal_Tanimlari]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F3_HariciMal_Tanimlari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HariciMalGrupID] [nvarchar](5) NOT NULL,
	[Tanim] [nvarchar](30) NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HariciMal_Tanimlari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F3_SirketCalisanlari]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F3_SirketCalisanlari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Soyad] [nvarchar](30) NOT NULL,
	[CepTel] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Dahili] [nvarchar](4) NULL,
	[CalisanTipi] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_F3_SirketCalisanlari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F3_UrunPortfoyu]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F3_UrunPortfoyu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[HariciMalTanimID] [int] NOT NULL,
	[FaaliyetSekli] [tinyint] NOT NULL,
 CONSTRAINT [PK_UrunPortfoyu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F4_BelgeVeDokuman]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F4_BelgeVeDokuman](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NOT NULL,
	[SicilTasdik] [nvarchar](300) NOT NULL,
	[SicilGazet] [nvarchar](300) NOT NULL,
	[İmzaSirkul] [nvarchar](300) NOT NULL,
	[TSE] [nvarchar](300) NULL,
	[ISO] [nvarchar](300) NULL,
	[HizmetYet] [nvarchar](300) NULL,
	[Yetki] [nvarchar](300) NULL,
 CONSTRAINT [PK_F4_BelgeVeDokuman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmaGenelBilgi]    Script Date: 4.4.2018 22:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmaGenelBilgi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](70) NOT NULL,
	[SirketTuru] [tinyint] NOT NULL,
	[KurulusYili] [int] NOT NULL,
	[IliskiliTaraf] [bit] NOT NULL,
	[OrtakIliskisi] [bit] NOT NULL,
	[Sermaye] [int] NULL,
	[WebAdresi] [nvarchar](250) NULL,
	[Email1] [nvarchar](250) NOT NULL,
	[Email2] [nvarchar](250) NULL,
	[Email3] [nvarchar](250) NULL,
	[VergiDairesi] [nvarchar](11) NOT NULL,
	[VergiNo] [nvarchar](10) NULL,
	[TCNo] [nvarchar](11) NULL,
	[OrtakIliskisiId] [int] NULL,
	[yazismaAdresi] [tinyint] NULL,
 CONSTRAINT [PK_FirmaGenelBilgi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[F1_FabrikaAdresi] ON 

INSERT [dbo].[F1_FabrikaAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Faks1], [Mobil]) VALUES (8, 3073, 322, NULL, N'asd', N'qwe', NULL, N'12421', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[F1_FabrikaAdresi] OFF
SET IDENTITY_INSERT [dbo].[F1_MerkezAdresi] ON 

INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2077, 3072, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2078, 3073, 322, NULL, N'asd', N'asd', NULL, N'asd', NULL, NULL, N'asd', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2079, 3074, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2080, 3075, 322, NULL, N'asd', N'asd', NULL, N'asd', NULL, NULL, N'asd', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2081, 3076, 322, NULL, N'asd', N'asd', NULL, N'asd', NULL, NULL, N'asd', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2082, 3077, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2083, 3078, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2084, 3079, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2085, 3080, 322, NULL, N'asd', N'add', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2086, 3081, 322, NULL, N'asd', N'add', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2087, 3082, 322, NULL, N'asd', N'add', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2088, 3083, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (2089, 3084, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3088, 4083, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3089, 4084, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3090, 4085, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3091, 4086, 322, NULL, N'asd', N'qwe', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3092, 4087, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3093, 4088, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3094, 4089, 322, NULL, N'asd', N'ad', NULL, N'123', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3095, 4090, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3096, 4091, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
INSERT [dbo].[F1_MerkezAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Telefon3], [Faks1], [Faks2], [Faks3], [Mobil]) VALUES (3097, 4092, 322, NULL, N'asd', N'asd', NULL, N'12312', NULL, NULL, N'123', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[F1_MerkezAdresi] OFF
SET IDENTITY_INSERT [dbo].[F1_Personeller] ON 

INSERT [dbo].[F1_Personeller] ([ID], [IsimSoyisim]) VALUES (5, N'Ramazan ALTINSOY')
INSERT [dbo].[F1_Personeller] ([ID], [IsimSoyisim]) VALUES (6, N'TEST1')
INSERT [dbo].[F1_Personeller] ([ID], [IsimSoyisim]) VALUES (7, N'TEST2')
SET IDENTITY_INSERT [dbo].[F1_Personeller] OFF
SET IDENTITY_INSERT [dbo].[F1_SirketOrtaklari] ON 

INSERT [dbo].[F1_SirketOrtaklari] ([ID], [Adi], [Soyadi], [Ortaklik], [FirmaID]) VALUES (2015, N'ad1', N'asd', 5.8, 3073)
SET IDENTITY_INSERT [dbo].[F1_SirketOrtaklari] OFF
SET IDENTITY_INSERT [dbo].[F1_SubeAdresi] ON 

INSERT [dbo].[F1_SubeAdresi] ([ID], [FirmaID], [Sehir], [PostaKodu], [AcikAdres], [Semt], [PostaKutusu], [Telefon1], [Telefon2], [Faks1], [Mobil]) VALUES (1015, 3073, 322, NULL, N'asd', N'asd', NULL, N'123', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[F1_SubeAdresi] OFF
SET IDENTITY_INSERT [dbo].[F2_BankaBilgileri] ON 

INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (2, 3075, N'B046', N'1234', N'DEM3')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (3, 3076, N'B046', N'1234', N'DEM3')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (4, 3077, N'B046', N'1234', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (5, 3077, N'B046', N'456547', N'USDN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (6, 3078, N'B046', N'12412', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (7, 3078, N'B046', N'124', N'DEM3')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (8, 3078, N'B046', N'453435', N'USDN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (9, 3079, N'B046', N'123', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (10, 3080, N'B046', N'123', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (11, 3081, N'B046', N'123', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (12, 3082, N'B046', N'123', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (13, 3083, N'B046', N'123', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (14, 3084, N'B046', N'123', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1013, 4083, N'B046', N'123124', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1014, 4084, N'B046', N'123124', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1015, 4085, N'B046', N'123124', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1016, 4086, N'B100', N'12345', N'DEM3')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1017, 4087, N'B046', N'1234', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1018, 4088, N'B046', N'1234', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1019, 4089, N'B046', N'132', N'-1')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1020, 4090, N'B046', N'123', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1021, 4091, N'B046', N'123', N'USDN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1022, 4091, N'B100', N'2312', N'AFN')
INSERT [dbo].[F2_BankaBilgileri] ([ID], [FirmaID], [BankaKodu], [IbanNo], [ParaBirimiKodu]) VALUES (1023, 4092, N'B143', N'123', N'AFN')
SET IDENTITY_INSERT [dbo].[F2_BankaBilgileri] OFF
INSERT [dbo].[F2_Bankalar] ([BankaKodu], [BankaAdi]) VALUES (N'B046', N'AKBANK T.A.Ş.')
INSERT [dbo].[F2_Bankalar] ([BankaKodu], [BankaAdi]) VALUES (N'B100', N'ADABANK A.Ş.')
INSERT [dbo].[F2_Bankalar] ([BankaKodu], [BankaAdi]) VALUES (N'B143', N'AKTİF YATIRIM BANKASI A.Ş.')
SET IDENTITY_INSERT [dbo].[F2_FirmaGenelBilgi2] ON 

INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1, 3076, 2, N'1', N'1234', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (2, 3077, 2, N'1', N'1314', 2005, 12, 12, 12, 12, 12, 12, 0, 0, 0, N'asdas', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'asfasf', CAST(N'2000-01-02T00:00:00.000' AS DateTime), N'asf', CAST(N'2000-01-03T00:00:00.000' AS DateTime), N'safasf', CAST(N'2000-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (3, 3078, 2, N'1', N'123', 2005, 124, 214, 124, 124, 124, 124, 1, 1, 1, N'asdas', CAST(N'1995-01-18T00:00:00.000' AS DateTime), N'asd', CAST(N'2000-01-02T00:00:00.000' AS DateTime), N'asd', CAST(N'2000-01-03T00:00:00.000' AS DateTime), N'asd', CAST(N'2000-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (4, 3079, 2, N'1', N'124', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (5, 3080, 2, N'1', N'123', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (6, 3081, 2, N'1', N'123', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (7, 3082, 2, N'1', N'123', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (8, 3083, 2, N'1', N'12312', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (9, 3084, 2, N'1', N'12312', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1008, 4085, 2, N'1', N'153135', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1009, 4086, 2, N'1', N'8561', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1010, 4087, 2, N'1', N'124', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1011, 4088, 2, N'1', N'124', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1012, 4089, 2, N'1', N'124', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1013, 4090, 2, N'1', N'2134', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1014, 4091, 2, N'1', N'2134', 2005, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, CAST(N'1995-01-18T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[F2_FirmaGenelBilgi2] ([ID], [FirmaID], [SektorID], [FirmaFaliyetSekli], [SirketCirosu], [SirketCiroYili], [ToplamCalisanSayisi], [IdariCalisan], [Uretim], [OnYilFazlaPers], [Satis], [Kalite], [BagimsizDenetleme], [TedarikciKaliteYonetim], [KaliteSistemiBelgesi], [ISO9001_K], [ISO9001_Sure], [ISO14001_K], [ISO14001_Sure], [OHSAS18001_K], [OHSAS18001_Sure], [Diger_K], [Diger_Sure]) VALUES (1015, 4092, 2, N'1', N'2134', 2005, 5, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, CAST(N'1995-01-18T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[F2_FirmaGenelBilgi2] OFF
INSERT [dbo].[F2_ParaBirimleri] ([ParaBirimiKodu], [ParaBirimiAdi]) VALUES (N'-1', N'--')
INSERT [dbo].[F2_ParaBirimleri] ([ParaBirimiKodu], [ParaBirimiAdi]) VALUES (N'AFN', N'Afghani')
INSERT [dbo].[F2_ParaBirimleri] ([ParaBirimiKodu], [ParaBirimiAdi]) VALUES (N'DEM3', N'(Internal) German Mark (3 dec.places)')
INSERT [dbo].[F2_ParaBirimleri] ([ParaBirimiKodu], [ParaBirimiAdi]) VALUES (N'USDN', N'(Internal) United States Dollar (5 Dec.)')
SET IDENTITY_INSERT [dbo].[F2_Referanslar] ON 

INSERT [dbo].[F2_Referanslar] ([ID], [FirmaID], [FirmaAdi], [Ciro], [YurtIci]) VALUES (1, 3077, N'ad1', N'1.2', 1)
INSERT [dbo].[F2_Referanslar] ([ID], [FirmaID], [FirmaAdi], [Ciro], [YurtIci]) VALUES (2, 3077, N'ad12', N'1.2', 1)
INSERT [dbo].[F2_Referanslar] ([ID], [FirmaID], [FirmaAdi], [Ciro], [YurtIci]) VALUES (3, 3077, N'ad13', N'1.2', 1)
INSERT [dbo].[F2_Referanslar] ([ID], [FirmaID], [FirmaAdi], [Ciro], [YurtIci]) VALUES (4, 3077, N'ad14', N'1.2', 0)
INSERT [dbo].[F2_Referanslar] ([ID], [FirmaID], [FirmaAdi], [Ciro], [YurtIci]) VALUES (5, 3077, N'ad15', N'1.2', 0)
INSERT [dbo].[F2_Referanslar] ([ID], [FirmaID], [FirmaAdi], [Ciro], [YurtIci]) VALUES (6, 3077, N'ad16', N'1.2', 0)
SET IDENTITY_INSERT [dbo].[F2_Referanslar] OFF
SET IDENTITY_INSERT [dbo].[F3_FirmaGenelBilgi3] ON 

INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (1, 3084, N'asd', N'asd', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (2, 4085, N'asd', N'qwe', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (3, 4086, N'asd', N'qwe', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (4, 4088, N'asd', N'asd', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (5, 4089, N'asd', N'asd', N'asd', N'asd', N'asd', NULL)
INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (6, 4090, N'zxc', N'asd', N'asd', N'asd', N'asd', NULL)
INSERT [dbo].[F3_FirmaGenelBilgi3] ([ID], [FirmaID], [FormDolAd], [FormDolSoyad], [FormDolUnvan], [FormDolDepart], [FormDolTel], [FormDolFaks]) VALUES (7, 4091, N'asd', N'asd', N'awf', N'asd', N'asd', NULL)
SET IDENTITY_INSERT [dbo].[F3_FirmaGenelBilgi3] OFF
SET IDENTITY_INSERT [dbo].[F3_HariciMal_Tanimlari] ON 

INSERT [dbo].[F3_HariciMal_Tanimlari] ([ID], [HariciMalGrupID], [Tanim], [Kod]) VALUES (10, N'T12', N'BLOKNOTLAR', N'T12020')
INSERT [dbo].[F3_HariciMal_Tanimlari] ([ID], [HariciMalGrupID], [Tanim], [Kod]) VALUES (11, N'T12', N'CEP DEFTERLERİ', N'T12000')
INSERT [dbo].[F3_HariciMal_Tanimlari] ([ID], [HariciMalGrupID], [Tanim], [Kod]) VALUES (12, N'P11', N'Degistir', N'Degistir')
SET IDENTITY_INSERT [dbo].[F3_HariciMal_Tanimlari] OFF
INSERT [dbo].[F3_HariciMalGrubu] ([ID], [Text]) VALUES (N'P11', N'180º DÖNÜŞLER')
INSERT [dbo].[F3_HariciMalGrubu] ([ID], [Text]) VALUES (N'P18', N'45º ÇATAL BAĞLANTI')
INSERT [dbo].[F3_HariciMalGrubu] ([ID], [Text]) VALUES (N'T12', N'DEFTERLER')
SET IDENTITY_INSERT [dbo].[F3_Sektor] ON 

INSERT [dbo].[F3_Sektor] ([SektorID], [SektorAdi]) VALUES (2, N'İnşaat-Ahşap Doğrama, Parke, Sunta')
INSERT [dbo].[F3_Sektor] ([SektorID], [SektorAdi]) VALUES (4, N'Elektrik ve Elektronik-Akü - Pil')
INSERT [dbo].[F3_Sektor] ([SektorID], [SektorAdi]) VALUES (5, N'Maden ve Metal Sanayi-Alüminyum ve Ürünleri')
INSERT [dbo].[F3_Sektor] ([SektorID], [SektorAdi]) VALUES (6, N'Ambalaj-Ambalaj Dizaynı, Hammaddeleri')
INSERT [dbo].[F3_Sektor] ([SektorID], [SektorAdi]) VALUES (7, N'Hizmetler-Araba Kiralama')
SET IDENTITY_INSERT [dbo].[F3_Sektor] OFF
SET IDENTITY_INSERT [dbo].[F3_SirketCalisanlari] ON 

INSERT [dbo].[F3_SirketCalisanlari] ([ID], [FirmaID], [Ad], [Soyad], [CepTel], [Email], [Dahili], [CalisanTipi]) VALUES (11, 3084, N'awdaw', N'wafawf', N'awfawf', N'awfwaf', N'asd', N'GenelM')
INSERT [dbo].[F3_SirketCalisanlari] ([ID], [FirmaID], [Ad], [Soyad], [CepTel], [Email], [Dahili], [CalisanTipi]) VALUES (12, 3084, N'awfafw', N'waf', N'wafawf', N'waf', N'asd', N'SatisM')
INSERT [dbo].[F3_SirketCalisanlari] ([ID], [FirmaID], [Ad], [Soyad], [CepTel], [Email], [Dahili], [CalisanTipi]) VALUES (13, 3084, N'fawfw', N'awf', N'awffwa', N'fawfaw', N'asd', N'SatisT')
INSERT [dbo].[F3_SirketCalisanlari] ([ID], [FirmaID], [Ad], [Soyad], [CepTel], [Email], [Dahili], [CalisanTipi]) VALUES (14, 3084, N'wafwaf', N'fwa', N'fwaawf', N'fawfwa', N'asd', N'ServisM')
INSERT [dbo].[F3_SirketCalisanlari] ([ID], [FirmaID], [Ad], [Soyad], [CepTel], [Email], [Dahili], [CalisanTipi]) VALUES (15, 3084, N'fwafwa', N'fwaawffw', N'afwafwa', N'awf', N'asd', N'UretimM')
SET IDENTITY_INSERT [dbo].[F3_SirketCalisanlari] OFF
SET IDENTITY_INSERT [dbo].[F3_UrunPortfoyu] ON 

INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (15, 3084, 12, 1)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (16, 3084, 10, 3)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (17, 3084, 11, 5)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1012, 4085, 12, 2)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1013, 4086, 10, 2)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1014, 4087, 10, 4)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1015, 4087, 12, 3)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1016, 4088, 10, 4)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1017, 4088, 12, 3)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1018, 4089, 12, 1)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1019, 4090, 12, 3)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1020, 4090, 10, 1)
INSERT [dbo].[F3_UrunPortfoyu] ([ID], [FirmaID], [HariciMalTanimID], [FaaliyetSekli]) VALUES (1021, 4091, 12, 1)
SET IDENTITY_INSERT [dbo].[F3_UrunPortfoyu] OFF
SET IDENTITY_INSERT [dbo].[F4_BelgeVeDokuman] ON 

INSERT [dbo].[F4_BelgeVeDokuman] ([ID], [FirmaID], [SicilTasdik], [SicilGazet], [İmzaSirkul], [TSE], [ISO], [HizmetYet], [Yetki]) VALUES (1, 4085, N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\1139B421600245.pdf', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\ad74d4fb948db777c8a9f9c8f0db91fc.doc', NULL, NULL, NULL, NULL)
INSERT [dbo].[F4_BelgeVeDokuman] ([ID], [FirmaID], [SicilTasdik], [SicilGazet], [İmzaSirkul], [TSE], [ISO], [HizmetYet], [Yetki]) VALUES (2, 4086, N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\1139B421600245.pdf', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\ad74d4fb948db777c8a9f9c8f0db91fc.doc', NULL, NULL, NULL, NULL)
INSERT [dbo].[F4_BelgeVeDokuman] ([ID], [FirmaID], [SicilTasdik], [SicilGazet], [İmzaSirkul], [TSE], [ISO], [HizmetYet], [Yetki]) VALUES (3, 4088, N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\1139B421600245.pdf', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\ad74d4fb948db777c8a9f9c8f0db91fc.doc', NULL, NULL, NULL, NULL)
INSERT [dbo].[F4_BelgeVeDokuman] ([ID], [FirmaID], [SicilTasdik], [SicilGazet], [İmzaSirkul], [TSE], [ISO], [HizmetYet], [Yetki]) VALUES (4, 4089, N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\ad74d4fb948db777c8a9f9c8f0db91fc.doc', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\1139B421600245.pdf', NULL, NULL, NULL, NULL)
INSERT [dbo].[F4_BelgeVeDokuman] ([ID], [FirmaID], [SicilTasdik], [SicilGazet], [İmzaSirkul], [TSE], [ISO], [HizmetYet], [Yetki]) VALUES (5, 4090, N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\1139B421600245.pdf', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', NULL, NULL, NULL, NULL)
INSERT [dbo].[F4_BelgeVeDokuman] ([ID], [FirmaID], [SicilTasdik], [SicilGazet], [İmzaSirkul], [TSE], [ISO], [HizmetYet], [Yetki]) VALUES (6, 4091, N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', N'C:\Program Files\FirmaOnKayit\FirmaOnKayit\Uploads\a.cpp', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[F4_BelgeVeDokuman] OFF
SET IDENTITY_INSERT [dbo].[FirmaGenelBilgi] ON 

INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3072, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3073, N'asd', 5, 2004, 0, 0, NULL, NULL, N'asd', NULL, NULL, N'123', N'12312', N'421412', 6, 2)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3074, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3075, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3076, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3077, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3078, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3079, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3080, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3081, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3082, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3083, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'asd', N'asd', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (3084, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'asd', N'asd', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4083, N'qwe', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4084, N'qwe', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4085, N'qwe', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4086, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'vergidaire', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4087, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4088, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4089, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4090, N'asdf', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4091, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
INSERT [dbo].[FirmaGenelBilgi] ([ID], [FirmaAdi], [SirketTuru], [KurulusYili], [IliskiliTaraf], [OrtakIliskisi], [Sermaye], [WebAdresi], [Email1], [Email2], [Email3], [VergiDairesi], [VergiNo], [TCNo], [OrtakIliskisiId], [yazismaAdresi]) VALUES (4092, N'asd', 1, 2005, 0, 0, NULL, NULL, N'email', NULL, NULL, N'123', N'123', NULL, 5, 1)
SET IDENTITY_INSERT [dbo].[FirmaGenelBilgi] OFF
/****** Object:  Index [IX_FabrikaAdresi]    Script Date: 4.4.2018 22:58:23 ******/
ALTER TABLE [dbo].[F1_FabrikaAdresi] ADD  CONSTRAINT [IX_FabrikaAdresi] UNIQUE NONCLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MerkezAdresi]    Script Date: 4.4.2018 22:58:23 ******/
ALTER TABLE [dbo].[F1_MerkezAdresi] ADD  CONSTRAINT [IX_MerkezAdresi] UNIQUE NONCLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubeAdresi]    Script Date: 4.4.2018 22:58:23 ******/
ALTER TABLE [dbo].[F1_SubeAdresi] ADD  CONSTRAINT [IX_SubeAdresi] UNIQUE NONCLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[F1_FabrikaAdresi]  WITH CHECK ADD  CONSTRAINT [FK_FabrikaAdresi_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F1_FabrikaAdresi] CHECK CONSTRAINT [FK_FabrikaAdresi_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F1_MerkezAdresi]  WITH CHECK ADD  CONSTRAINT [FK_MerkezAdresi_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F1_MerkezAdresi] CHECK CONSTRAINT [FK_MerkezAdresi_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F1_SirketOrtaklari]  WITH CHECK ADD  CONSTRAINT [FK_SirketOrtaklari_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F1_SirketOrtaklari] CHECK CONSTRAINT [FK_SirketOrtaklari_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F1_SubeAdresi]  WITH CHECK ADD  CONSTRAINT [FK_SubeAdresi_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F1_SubeAdresi] CHECK CONSTRAINT [FK_SubeAdresi_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F2_BankaBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_BankaBilgileri_Bankalar] FOREIGN KEY([BankaKodu])
REFERENCES [dbo].[F2_Bankalar] ([BankaKodu])
GO
ALTER TABLE [dbo].[F2_BankaBilgileri] CHECK CONSTRAINT [FK_BankaBilgileri_Bankalar]
GO
ALTER TABLE [dbo].[F2_BankaBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_BankaBilgileri_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F2_BankaBilgileri] CHECK CONSTRAINT [FK_BankaBilgileri_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F2_BankaBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_BankaBilgileri_ParaBirimleri] FOREIGN KEY([ParaBirimiKodu])
REFERENCES [dbo].[F2_ParaBirimleri] ([ParaBirimiKodu])
GO
ALTER TABLE [dbo].[F2_BankaBilgileri] CHECK CONSTRAINT [FK_BankaBilgileri_ParaBirimleri]
GO
ALTER TABLE [dbo].[F2_FirmaGenelBilgi2]  WITH CHECK ADD  CONSTRAINT [FK_FirmaGenelBilgi2_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F2_FirmaGenelBilgi2] CHECK CONSTRAINT [FK_FirmaGenelBilgi2_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F2_FirmaGenelBilgi2]  WITH CHECK ADD  CONSTRAINT [FK_FirmaGenelBilgi2_Sektor] FOREIGN KEY([SektorID])
REFERENCES [dbo].[F3_Sektor] ([SektorID])
GO
ALTER TABLE [dbo].[F2_FirmaGenelBilgi2] CHECK CONSTRAINT [FK_FirmaGenelBilgi2_Sektor]
GO
ALTER TABLE [dbo].[F2_Referanslar]  WITH CHECK ADD  CONSTRAINT [FK_Referanslar_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F2_Referanslar] CHECK CONSTRAINT [FK_Referanslar_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[F3_UrunPortfoyu]  WITH CHECK ADD  CONSTRAINT [FK_F3_UrunPortfoyu_FirmaGenelBilgi] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaGenelBilgi] ([ID])
GO
ALTER TABLE [dbo].[F3_UrunPortfoyu] CHECK CONSTRAINT [FK_F3_UrunPortfoyu_FirmaGenelBilgi]
GO
ALTER TABLE [dbo].[FirmaGenelBilgi]  WITH CHECK ADD  CONSTRAINT [FK_FirmaGenelBilgi_Personeller1] FOREIGN KEY([OrtakIliskisiId])
REFERENCES [dbo].[F1_Personeller] ([ID])
GO
ALTER TABLE [dbo].[FirmaGenelBilgi] CHECK CONSTRAINT [FK_FirmaGenelBilgi_Personeller1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "F2_Bankalar"
            Begin Extent = 
               Top = 9
               Left = 53
               Bottom = 105
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BankalarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BankalarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "F3_HariciMalGrubu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HariciMalGrubuView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HariciMalGrubuView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "F2_ParaBirimleri"
            Begin Extent = 
               Top = 13
               Left = 36
               Bottom = 109
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ParaBirimleriView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ParaBirimleriView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "F1_Personeller"
            Begin Extent = 
               Top = 12
               Left = 48
               Bottom = 108
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PersonellerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PersonellerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "F3_Sektor"
            Begin Extent = 
               Top = 12
               Left = 34
               Bottom = 108
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SektorView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SektorView'
GO
USE [master]
GO
ALTER DATABASE [FirmaKayitDB] SET  READ_WRITE 
GO
