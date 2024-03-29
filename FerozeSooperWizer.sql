USE [master]
GO
/****** Object:  Database [SooperWizer]    Script Date: 3/13/2024 3:11:34 PM ******/
CREATE DATABASE [SooperWizer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SooperWizer', FILENAME = N'/var/opt/sqlserver/data/SooperWizer_Primary.mdf' , SIZE = 663552KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SooperWizer_log', FILENAME = N'/var/opt/sqlserver/log/SooperWizer_Primary.ldf' , SIZE = 1712128KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SooperWizer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SooperWizer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SooperWizer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SooperWizer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SooperWizer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SooperWizer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SooperWizer] SET ARITHABORT OFF 
GO
ALTER DATABASE [SooperWizer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SooperWizer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SooperWizer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SooperWizer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SooperWizer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SooperWizer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SooperWizer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SooperWizer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SooperWizer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SooperWizer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SooperWizer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SooperWizer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SooperWizer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SooperWizer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SooperWizer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SooperWizer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SooperWizer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SooperWizer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SooperWizer] SET  MULTI_USER 
GO
ALTER DATABASE [SooperWizer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SooperWizer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SooperWizer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SooperWizer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SooperWizer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SooperWizer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SooperWizer', N'ON'
GO
ALTER DATABASE [SooperWizer] SET QUERY_STORE = OFF
GO
USE [SooperWizer]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [distributor_admin]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE USER [distributor_admin] FOR LOGIN [distributor_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Admin]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_owner] ADD MEMBER [distributor_admin]
GO
/****** Object:  Schema [Data]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE SCHEMA [Data]
GO
/****** Object:  Schema [DW]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE SCHEMA [DW]
GO
/****** Object:  Schema [Essentials]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE SCHEMA [Essentials]
GO
/****** Object:  Schema [LineLayout]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE SCHEMA [LineLayout]
GO
/****** Object:  Schema [report]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE SCHEMA [report]
GO
/****** Object:  Table [Essentials].[CutJob]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[CutJob](
	[CutJobID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CutNo] [varchar](32) NOT NULL,
	[ProductionOrderID] [int] NOT NULL,
	[Plies] [int] NULL,
	[MarkerID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[StyleTemplateID] [int] NULL,
	[WeighmentDate] [smalldatetime] NULL,
	[FabricCode] [varchar](20) NULL,
	[TFamilyCode] [varchar](30) NULL,
	[OColorCode] [varchar](6) NULL,
	[NetWeight] [numeric](9, 2) NULL,
	[ShiftCode] [char](20) NULL,
	[QualityCode] [varchar](25) NULL,
	[SaleOrderCode] [varchar](100) NULL,
 CONSTRAINT [PK_CutJobID] PRIMARY KEY CLUSTERED 
(
	[CutJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ProductionOrder_CutNo] UNIQUE NONCLUSTERED 
(
	[ProductionOrderID] ASC,
	[CutNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[CutReport]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[CutReport](
	[BundleID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BundleCode] [varchar](64) NOT NULL,
	[BundleQuantity] [int] NOT NULL,
	[ScannedQuantity] [int] NOT NULL,
	[RemainingQuantity] [int] NOT NULL,
	[CutJobID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[StyleTemplateID] [int] NULL,
	[Size] [varchar](32) NULL,
	[Color] [varchar](64) NULL,
 CONSTRAINT [PK_BundleID] PRIMARY KEY CLUSTERED 
(
	[BundleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_CutJobID_BundleCode] UNIQUE NONCLUSTERED 
(
	[CutJobID] ASC,
	[BundleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[EndLineSession]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[EndLineSession](
	[EndLineSessionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LineID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[BundleID] [int] NOT NULL,
	[PieceID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_EndLineSessionNew] PRIMARY KEY CLUSTERED 
(
	[EndLineSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[EndLineFaultLog]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[EndLineFaultLog](
	[EndLineFaultLogID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EndLineSessionID] [int] NOT NULL,
	[FaultID] [int] NOT NULL,
	[FaultCount] [int] NOT NULL,
	[PieceWiseScanningID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_EndLineFaultLogNew] PRIMARY KEY CLUSTERED 
(
	[EndLineFaultLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Line]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Line](
	[LineID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LineCode] [varchar](64) NOT NULL,
	[LineDescription] [varchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_LineID] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_LineCode] UNIQUE NONCLUSTERED 
(
	[LineCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[ProductionOrder]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[ProductionOrder](
	[ProductionOrderID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductionOrderCode] [varchar](100) NOT NULL,
	[SaleOrderID] [int] NOT NULL,
	[StyleTemplateID] [int] NULL,
	[IsFollowOperationSequence] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[IsPoClosed] [bit] NOT NULL,
 CONSTRAINT [PK_ProductionOrderID] PRIMARY KEY CLUSTERED 
(
	[ProductionOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ProductionOrderCode] UNIQUE NONCLUSTERED 
(
	[ProductionOrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[SaleOrder]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[SaleOrder](
	[SaleOrderID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderCode] [varchar](100) NOT NULL,
	[Customer] [varchar](64) NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_SaleOrderID] PRIMARY KEY CLUSTERED 
(
	[SaleOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_SaleOrderCode] UNIQUE NONCLUSTERED 
(
	[SaleOrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[StyleBulletin]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[StyleBulletin](
	[StyleBulletinID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StyleTemplateID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
	[OperationSequence] [int] NOT NULL,
	[ScanType] [varchar](10) NOT NULL,
	[IsFirst] [bit] NOT NULL,
	[IsLast] [bit] NOT NULL,
	[MachineTypeID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[SMV] [float] NULL,
	[PieceRate] [float] NULL,
	[IsCritical] [bit] NOT NULL,
 CONSTRAINT [PK_StyleBulletinID] PRIMARY KEY CLUSTERED 
(
	[StyleBulletinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_StyleBulletin_StyleTemplateID_OperationID] UNIQUE NONCLUSTERED 
(
	[StyleTemplateID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Section]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Section](
	[SectionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SectionCode] [varchar](64) NOT NULL,
	[SectionDescription] [varchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_SectionID] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_SectionCode] UNIQUE NONCLUSTERED 
(
	[SectionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [report].[vw_EndLineSession]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE View [report].[vw_EndLineSession] as

SELECT cast(t1.CreatedAt as date)CreatedAtDate,t1.*,LineCode,LineDescription,SectionCode,SectionDescription ,
T3.SaleOrderCode,t4.SaleOrderID,ProductionOrderCode,t4.ProductionOrderID,t4.StyleTemplateID,t8.GarmentSam,ISNULL (TotalFaults, 0 ) as Totalfaults

FROM [Data].[EndLineSession] t1 
 Left JOIN [Essentials].[CutReport] t2 
  on t1.BundleID = t2.BundleID
  left join Essentials.CutJob t3
 on t2.CutJobID=t3.CutJobID 
 left join [Essentials].[ProductionOrder] t4
 on t3.ProductionOrderID = t4.ProductionOrderID
 left join Essentials.SaleOrder t5
 on t4.SaleOrderID=t5.SaleOrderID
 left join Essentials.Section t6
 on t1.SectionID=t6.SectionID
 left join Essentials.Line t7
 on t1.LineID = t7.LineID
  
 left join (SELECT StyleTemplateID,sum(SMV)GarmentSam
  FROM [Essentials].[StyleBulletin]
  group by StyleTemplateID) t8
  on t4.StyleTemplateID=t8.StyleTemplateID
  left join (SELECT EndLineSessionID,sum(FaultCount)TotalFaults
  FROM Data.EndLineFaultLog
  group by EndLineSessionID) t9
  on t1.EndLineSessionID=t9.EndLineSessionID
GO
/****** Object:  Table [Essentials].[PieceWiseCutReport]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[PieceWiseCutReport](
	[PieceID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BundleID] [int] NOT NULL,
	[PieceNumber] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[StyleTemplateID] [int] NULL,
 CONSTRAINT [PK_PieceID] PRIMARY KEY CLUSTERED 
(
	[PieceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_BundleID_PieceNo] UNIQUE NONCLUSTERED 
(
	[BundleID] ASC,
	[PieceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[PieceWiseScan]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[PieceWiseScan](
	[PieceWiseScanningID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ScanID] [bigint] NULL,
	[BundleID] [int] NOT NULL,
	[PieceID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
	[WorkerID] [int] NULL,
	[LineID] [int] NULL,
	[MachineID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[PieceWiseGroupID] [int] NULL,
	[GroupID] [int] NULL,
	[ShortAddress] [varchar](64) NULL,
	[LongAddress] [varchar](64) NULL,
	[HostIP] [varchar](64) NULL,
 CONSTRAINT [PK_PieceWiseScanningID] PRIMARY KEY CLUSTERED 
(
	[PieceWiseScanningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PieceWiseScan_BundleID_PieceID_OperationID] UNIQUE NONCLUSTERED 
(
	[BundleID] ASC,
	[PieceID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Operation]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Operation](
	[OperationID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OperationCode] [varchar](64) NOT NULL,
	[OperationName] [varchar](64) NOT NULL,
	[OperationDescription] [varchar](64) NOT NULL,
	[PieceRate] [float] NULL,
	[OperationType] [varchar](64) NOT NULL,
	[OperationImageUrl] [varchar](max) NULL,
	[OperationThumbnailUrl] [varchar](max) NULL,
	[SectionID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DepartmentID] [int] NULL,
	[SMV] [float] NULL,
 CONSTRAINT [PK_OperationID] PRIMARY KEY CLUSTERED 
(
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_OperationCode] UNIQUE NONCLUSTERED 
(
	[OperationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Worker]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Worker](
	[WorkerID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WorkerCode] [varchar](64) NOT NULL,
	[WorkerDescription] [varchar](64) NOT NULL,
	[WorkerImageUrl] [varchar](max) NULL,
	[WorkerThumbnailUrl] [varchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[TodayCheckin] [datetime] NULL,
	[TodayProduction] [int] NULL,
	[WorkerType] [varchar](64) NULL,
 CONSTRAINT [PK_WorkerID] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_WorkerCode] UNIQUE NONCLUSTERED 
(
	[WorkerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [report].[vw_WageStation]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE view [report].[vw_WageStation] as

select sum(CurrentDayWage)TodaysWage,sum(CurrentMonthWage)MonthlyWage,WorkerCode,WorkerDescription, WorkerID,cast(getdate() as date) TodaysDate
from (
SELECT cast (t1.[CreatedAt] as date) CreatedAtDate,
CONVERT(varchar(15),CAST(t1.[CreatedAt] AS TIME),100) ScanningTime,
  DATEPART(HOUR,t1.[CreatedAt]) HourSLot
		,[PieceWiseScanningID]
      ,[ScanID]
      ,t7.SaleOrderID
      ,t8.SaleOrderCode
      ,t8.Customer
      ,t8.OrderQuantity
      ,t6.ProductionOrderID
      ,t7.ProductionOrderCode
      ,t1.[BundleID]
      ,t2.BundleCode
      ,t2.BundleQuantity
	  ,t2.Size
      ,t2.CutJobID
      ,t6.CutNo
      ,t1.[PieceID]
      ,t3.PieceNumber
      ,t3.StyleTemplateID
      ,t4.StyleBulletinID
      ,t5.DepartmentID
      ,t5.SectionID,t11.SectionCode, t11.SectionDescription
      ,t1.[OperationID]
      ,t5.OperationCode
      ,t5.OperationDescription
      ,t5.OperationName
      ,t5.OperationType
      ,t4.OperationSequence
      ,t4.IsFirst
      ,t4.IsLast
      ,t4.SMV
      ,t4.PieceRate, 
	  t4.PieceRate * BundleQuantity as wage
      ,case when cast(t1.CreatedAt as date) = cast(GETDATE() as date) then t4.PieceRate * BundleQuantity else 0 end as CurrentDayWage
	  ,case when MONTH(t1.CreatedAt) = MONTH(getdate()) then t4.PieceRate * BundleQuantity else 0 end as CurrentMonthWage
	  ,t4.IsCritical
      ,t4.MachineTypeID
      ,t1.[WorkerID]
      ,t9.WorkerCode
      ,t9.WorkerDescription
      ,t1.[LineID],t10.LineCode, t10.LineDescription
      ,[MachineID]
      ,t1.[CreatedAt]
      ,t1.[UpdatedAt]
      ,[PieceWiseGroupID]
      ,[GroupID]
      --,[ShortAddress]
      --,[LongAddress]
      --,[HostIP]
	  , t4.PieceRate*BundleQuantity  as WorkerWage
  FROM [Data].[PieceWiseScan] t1 
 Left JOIN [Essentials].[CutReport] t2 
  on t1.BundleID = t2.BundleID
  left join [Essentials].[PieceWiseCutReport] t3
  on t1.PieceID=t3.PieceID
  Left Join [Essentials].[StyleBulletin] t4
  on t3.StyleTemplateID=t4.StyleTemplateID AND
    t1.OperationID=t4.OperationID
    Left Join [Essentials].[Operation] t5
    on t1.OperationID=t5.OperationID
    Left join [Essentials].[CutJob] t6
    on t2.CutJobID=t6.CutJobID
    left join [Essentials].[ProductionOrder] t7
    on t6.ProductionOrderID=t7.ProductionOrderID
    left join [Essentials].[SaleOrder] t8
    on t7.SaleOrderID=t8.SaleOrderID
    Left join [Essentials].[Worker] t9
    on t1.WorkerID=t9.WorkerID
    left join [Essentials].[Line] t10
    on t1.LineID=t10.LineID
 left join [Essentials].[Section] t11
 on t5.SectionID=t11.SectionID
    
	Where t3.PieceNumber=1 --and MONTH(t1.CreatedAt) = MONTH(getdate())
	) tab1
	group by WorkerCode,WorkerDescription, WorkerID
GO
/****** Object:  Table [Data].[WorkerScan]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[WorkerScan](
	[WorkerScanID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WorkerID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[HasExpired] [bit] NOT NULL,
	[EndedAt] [datetime] NULL,
	[Extras] [varchar](64) NULL,
 CONSTRAINT [PK_WorkerScanID] PRIMARY KEY CLUSTERED 
(
	[WorkerScanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Yesterday_FirstLogin_vw]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Yesterday_FirstLogin_vw]
AS
SELECT WorkerID, MIN(CreatedAt) AS loginTime
FROM  Data.WorkerScan
WHERE (CAST(CreatedAt AS date) = DATEADD(day, - 1, CAST(GETDATE() AS date)))
GROUP BY WorkerID
GO
/****** Object:  Table [Data].[PieceWiseScanDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[PieceWiseScanDN](
	[PieceWiseScanningID] [int] NOT NULL,
	[ScanID] [bigint] NULL,
	[SaleOrderID] [int] NULL,
	[SaleOrderCode] [varchar](100) NULL,
	[Customer] [varchar](64) NULL,
	[OrderQuantity] [int] NULL,
	[ProductionOrderID] [int] NULL,
	[ProductionOrderCode] [varchar](100) NULL,
	[CutJobID] [int] NULL,
	[CutNo] [varchar](32) NULL,
	[MarkerID] [int] NULL,
	[Plies] [int] NULL,
	[WeighmentDate] [smalldatetime] NULL,
	[FabricCode] [varchar](20) NULL,
	[TFamilyCode] [varchar](30) NULL,
	[OColorCode] [varchar](6) NULL,
	[NetWeight] [numeric](9, 2) NULL,
	[ShiftCode] [char](20) NULL,
	[BundleID] [int] NULL,
	[BundleCode] [varchar](64) NULL,
	[BundleQuantity] [int] NULL,
	[ScannedQuantity] [int] NULL,
	[RemainingQuantity] [int] NULL,
	[Size] [varchar](32) NULL,
	[Color] [varchar](64) NULL,
	[PieceID] [int] NULL,
	[PieceNumber] [int] NULL,
	[OperationID] [int] NULL,
	[OperationCode] [varchar](64) NULL,
	[OperationName] [varchar](64) NULL,
	[OperationDescription] [varchar](64) NULL,
	[OperationType] [varchar](64) NULL,
	[SectionID] [int] NULL,
	[DepartmentID] [int] NULL,
	[DepartmentName] [varchar](40) NULL,
	[WorkerID] [int] NULL,
	[WorkerCode] [varchar](64) NULL,
	[WorkerDescription] [varchar](64) NULL,
	[TodayCheckin] [datetime] NULL,
	[TodayProduction] [int] NULL,
	[LineID] [int] NULL,
	[LineCode] [varchar](64) NULL,
	[LineDescription] [varchar](64) NULL,
	[MachineID] [int] NULL,
	[MachineCode] [varchar](64) NULL,
	[MachineDescription] [varchar](64) NULL,
	[MachineTypeID] [int] NULL,
	[BoxID] [int] NULL,
	[IsMachineDown] [bit] NULL,
	[StyleTemplateID] [int] NULL,
	[IsFirst] [bit] NULL,
	[IsLast] [bit] NULL,
	[PieceRate] [float] NULL,
	[OperationSequence] [int] NULL,
	[SMV] [float] NULL,
	[PieceWiseGroupID] [int] NULL,
	[GroupID] [int] NULL,
	[ShortAddress] [varchar](64) NULL,
	[LongAddress] [varchar](64) NULL,
	[HostIP] [varchar](64) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[CreatedAtDate]  AS (CONVERT([date],[CreatedAt])),
	[HourSlot]  AS (datepart(hour,[CreatedAt])),
	[NewHourSlot]  AS (dateadd(hour,datepart(hour,[CreatedAt]),CONVERT([time],CONVERT([varchar](20),[CreatedAt],(112))))),
 CONSTRAINT [UQ_PieceWiseScanDN_PieceWiseScanningID_SaleOrderID_ProductionOrderID_BundleID_PieceID_OperationID] UNIQUE NONCLUSTERED 
(
	[PieceWiseScanningID] ASC,
	[SaleOrderID] ASC,
	[ProductionOrderID] ASC,
	[BundleID] ASC,
	[PieceID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PieceWiseScanDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create View [dbo].[PieceWiseScanDN] AS
SELECT t1.*,t2.SectionCode,t2.SectionDescription FROM  [Data].[PieceWiseScanDN] t1 
left join Essentials.Section t2
on t1.SectionID=t2.SectionID

GO
/****** Object:  Table [Essentials].[Machine]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Machine](
	[MachineID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MachineCode] [varchar](64) NOT NULL,
	[MachineDescription] [varchar](64) NOT NULL,
	[MachineImageUrl] [varchar](max) NULL,
	[MachineThumbnailUrl] [varchar](max) NULL,
	[MachineTypeID] [int] NOT NULL,
	[ActiveWorkerID] [int] NULL,
	[LineID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[BoxID] [int] NULL,
	[IsMachineDown] [bit] NULL,
 CONSTRAINT [PK_MachineID] PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Machine_MachineID_BoxID] UNIQUE NONCLUSTERED 
(
	[MachineID] ASC,
	[BoxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_MachineCode] UNIQUE NONCLUSTERED 
(
	[MachineCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[User]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[User](
	[UserID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [varchar](64) NOT NULL,
	[Password] [varchar](1024) NOT NULL,
	[UserType] [varchar](64) NOT NULL,
	[LineID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UserImageUrl] [varchar](2056) NULL,
	[UserThumbnailUrl] [varchar](2056) NULL,
 CONSTRAINT [PK_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[AuditFormSession]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[AuditFormSession](
	[AuditFormSessionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WorkerID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[MachineRound] [int] NOT NULL,
	[FollowUp] [int] NOT NULL,
	[DefectedPieces] [int] NOT NULL,
	[RoundColor] [varchar](6) NOT NULL,
	[CreatedAtDate] [date] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditFormSessionID] PRIMARY KEY CLUSTERED 
(
	[AuditFormSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_MachineID_MachineRound_CreatedAtDate_FollowUp] UNIQUE NONCLUSTERED 
(
	[MachineID] ASC,
	[CreatedAtDate] ASC,
	[MachineRound] ASC,
	[FollowUp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[AuditFormFaultLog]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[AuditFormFaultLog](
	[AuditFormFaultLogID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AuditFormSessionID] [int] NOT NULL,
	[FaultID] [int] NOT NULL,
	[FaultCount] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditFormFaultLogID] PRIMARY KEY CLUSTERED 
(
	[AuditFormFaultLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Fault]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Fault](
	[FaultID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FaultCode] [varchar](64) NOT NULL,
	[FaultDescription] [varchar](256) NOT NULL,
	[SectionID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_FaultID] PRIMARY KEY CLUSTERED 
(
	[FaultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Section_FaultCode] UNIQUE NONCLUSTERED 
(
	[SectionID] ASC,
	[FaultCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [report].[AuditFormDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [report].[AuditFormDN] as
select  [AuditFormSessionID]
      ,[WorkerID]
      ,[WorkerCode]
      ,[WorkerDescription]
      ,[OperationID]
      ,[OperationCode]
      ,[OperationDescription]
      ,[UserID]
      ,[UserName]
      ,[LineID]
      ,[LineCode]
      ,[LineDescription]
      ,[SectionID]
      ,[SectionCode]
      ,[SectionDescription]
      ,[MachineID]
      ,[MachineCode]
      ,[MachineDescription]
      ,[MachineRound]
      ,[AuditFormFaultLogID]
      ,[FaultID]
      ,[FaultCode]
      ,[FaultDescription]
      ,[FaultCount]
      ,[FollowUp]
      ,[DefectedPieces]
      ,[RoundColor]
      ,[CreatedAtDate]
      ,[CreatedAt]
      ,[UpdatedAt] from (
SELECT ils.*,l.LineCode,l.LineDescription,s.SectionCode,s.SectionDescription,u.UserName,f.FaultCode,f.FaultDescription,m.MachineCode,MachineDescription,w.WorkerCode,w.WorkerDescription,
op.OperationCode,op.OperationDescription FROM
(
SELECT E.*,F.AuditFormFaultLogID,F.FaultID,F.FaultCount,ISNULL(F.TotalFaults,0) AS TotalFaults FROM
(
SELECT * FROM [Data].[AuditFormSession]
) E
LEFT JOIN (
--------------------------------------------------------------------------------------------
SELECT T.*,T1.TotalFaults FROM
(
SELECT * FROM [Data].[AuditFormFaultLog]
) T
INNER JOIN
(
SELECT AuditFormSessionID,SUM(FaultCount) AS TotalFaults FROM [Data].[AuditFormFaultLog] 
GROUP BY AuditFormSessionID
) T1 ON T1.AuditFormSessionID=T.AuditFormSessionID
--------------------------------------------------------------------------------------------				
) F ON F.AuditFormSessionID=E.AuditFormSessionID
) ils
INNER JOIN [Essentials].[Line] l ON l.LineID=ils.LineID
INNER JOIN [Essentials].[Section] s ON s.SectionID=ils.SectionID 
INNER JOIN [Essentials].[User] u on u.UserID=ils.UserID
INNER JOIN [Essentials].[Machine] m ON m.MachineID=ils.MachineID
INNER JOIN [Essentials].[Operation] op ON op.OperationID=ils.OperationID
INNER JOIN [Essentials].[Worker] w ON w.WorkerID=ils.WorkerID
LEFT JOIN [Essentials].[Fault] f ON f.FaultID=ils.FaultID
)tab1

GO
/****** Object:  View [report].[AuditFormSessionDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [report].[AuditFormSessionDN] as
select  [AuditFormSessionID]
      ,[WorkerID]
      ,[WorkerCode]
      ,[WorkerDescription]
      ,[OperationID]
      ,[OperationCode]
      ,[OperationDescription]
      ,[UserID]
      ,[UserName]
      ,[LineID]
      ,[LineCode]
      ,[LineDescription]
      ,[SectionID]
      ,[SectionCode]
      ,[SectionDescription]
      ,[MachineID]
      ,[MachineCode]
      ,[MachineDescription]
      ,[MachineRound]
      ,[TotalFaults]
      ,[FollowUp]
      ,[DefectedPieces]
      ,[RoundColor]
      ,[CreatedAtDate]
      ,[CreatedAt]
      ,[UpdatedAt]  from (
SELECT ils.*,l.LineCode,l.LineDescription,s.SectionCode,s.SectionDescription,u.UserName,f.FaultCode,f.FaultDescription,m.MachineCode,MachineDescription,w.WorkerCode,w.WorkerDescription,
op.OperationCode,op.OperationDescription FROM
(
SELECT E.*,F.AuditFormFaultLogID,F.FaultID,F.FaultCount,ISNULL(F.TotalFaults,0) AS TotalFaults FROM
(
SELECT * FROM [Data].[AuditFormSession]
) E
LEFT JOIN (
--------------------------------------------------------------------------------------------
SELECT T.*,T1.TotalFaults FROM
(
SELECT * FROM [Data].[AuditFormFaultLog]
) T
INNER JOIN
(
SELECT AuditFormSessionID,SUM(FaultCount) AS TotalFaults FROM [Data].[AuditFormFaultLog] 
GROUP BY AuditFormSessionID
) T1 ON T1.AuditFormSessionID=T.AuditFormSessionID
--------------------------------------------------------------------------------------------				
) F ON F.AuditFormSessionID=E.AuditFormSessionID
) ils
INNER JOIN [Essentials].[Line] l ON l.LineID=ils.LineID
INNER JOIN [Essentials].[Section] s ON s.SectionID=ils.SectionID 
INNER JOIN [Essentials].[User] u on u.UserID=ils.UserID
INNER JOIN [Essentials].[Machine] m ON m.MachineID=ils.MachineID
INNER JOIN [Essentials].[Operation] op ON op.OperationID=ils.OperationID
INNER JOIN [Essentials].[Worker] w ON w.WorkerID=ils.WorkerID
LEFT JOIN [Essentials].[Fault] f ON f.FaultID=ils.FaultID
)tab1
group by  [AuditFormSessionID]
      ,[WorkerID]
      ,[WorkerCode]
      ,[WorkerDescription]
      ,[OperationID]
      ,[OperationCode]
      ,[OperationDescription]
      ,[UserID]
      ,[UserName]
      ,[LineID]
      ,[LineCode]
      ,[LineDescription]
      ,[SectionID]
      ,[SectionCode]
      ,[SectionDescription]
      ,[MachineID]
      ,[MachineCode]
      ,[MachineDescription]
      ,[MachineRound]
      ,[TotalFaults]
      ,[FollowUp]
      ,[DefectedPieces]
      ,[RoundColor]
      ,[CreatedAtDate]
      ,[CreatedAt]
      ,[UpdatedAt]

GO
/****** Object:  View [report].[EndLineDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create View [report].[EndLineDN] AS
select tab1.*,tab2.OperationCode,tab2.OperationDescription,tab2.WorkerCode,tab2.WorkerDescription
 from (select [EndLineSessionID]
      ,[SaleOrderID]
      ,[SaleOrderCode]
      ,[Customer]
      ,[OrderQuantity]
      ,[ProductionOrderID]
      ,[ProductionOrderCode]
      ,[CutJobID]
      ,[CutNo]
      ,[MarkerID]
      ,[Plies]
      ,[BundleID]
      ,[BundleCode]
      ,[BundleQuantity]
      ,[ScannedQuantity]
      ,[RemainingQuantity]
      ,[Size]
      ,[Color]
      ,[PieceID]
      ,[PieceNumber]
      ,[StyleTemplateID]
      ,[LineID]
      ,[LineCode]
      ,[LineDescription]
      ,[SectionID]
      ,[SectionCode]
      ,[SectionDescription]
      ,[Status]
      ,[UserID]
      ,[UserName]
      ,[TotalFaults]
      ,[CreatedAt]
      ,[UpdatedAt]
      ,(datepart(hour,[CreatedAt]))as [HourSlot]
      ,(dateadd(hour,datepart(hour,[CreatedAt]),CONVERT([time],CONVERT([varchar](20),[CreatedAt],(112)))))as   [NewHourSlot] 
	 ,FaultID,FaultCode,FaultDescription
	 ,PieceWiseScanningID
	  from (SELECT EndLineSessionID,SaleOrderID,SaleOrderCode,Customer,OrderQuantity,ProductionOrderID,ProductionOrderCode,CutJobID,CutNo,MarkerID,Plies,
BundleID,BundleCode,BundleQuantity,ScannedQuantity,RemainingQuantity,Size,Color,PieceID,PieceNumber,StyleTemplateID,LineID,LineCode,LineDescription,
SectionID,SectionCode,SectionDescription,[Status],UserID,UserName,FaultID,FaultCode,FaultDescription,FaultCount,TotalFaults,CreatedAt,UpdatedAt 
,PieceWiseScanningID
FROM
(
SELECT T.*,pwcr.PieceNumber,pwcr.StyleTemplateID,l.LineCode,l.LineDescription,s.SectionCode,
s.SectionDescription,u.UserName,f.FaultCode,f.FaultDescription  
FROM
(
SELECT els.*,cr.BundleCode,cr.BundleQuantity,cr.ScannedQuantity,cr.RemainingQuantity,cr.Size,cr.Color,cj.CutJobID,cj.CutNo,
cj.MarkerID,cj.Plies,p.ProductionOrderID,p.ProductionOrderCode,so.SaleOrderID,so.SaleOrderCode,so.Customer,so.OrderQuantity
FROM
(
SELECT els.*,elflg.FaultID,elflg.FaultCount,ISNULL(elflg.TotalFaults,0) AS TotalFaults,PieceWiseScanningID FROM Data.EndLineSession els
LEFT JOIN (

SELECT T.*
,T1.TotalFaults 
FROM [Data].[EndLineFaultLog] T
LEFT JOIN
(
SELECT EndLineSessionID,SUM(FaultCount) AS TotalFaults 
FROM [Data].[EndLineFaultLog]
GROUP BY EndLineSessionID
) T1 ON T.EndLineSessionID=T1.EndLineSessionID

) elflg ON elflg.EndLineSessionID=els.EndLineSessionID

) els 
INNER JOIN [Essentials].[CutReport] cr ON cr.BundleID=els.BundleID
INNER JOIN [Essentials].[CutJob] cj ON cj.CutJobID=cr.CutJobID
INNER JOIN [Essentials].[ProductionOrder] p ON p.ProductionOrderID=cj.ProductionOrderID
INNER JOIN [Essentials].[SaleOrder] so ON so.SaleOrderID=P.SaleOrderID 
) T INNER JOIN [Essentials].[PieceWiseCutReport] pwcr ON pwcr.PieceID = T.PieceID
INNER JOIN [Essentials].[Line] l ON l.LineID=T.LineID
INNER JOIN [Essentials].[Section] s ON s.SectionID=T.SectionID 
INNER JOIN [Essentials].[User] u on u.UserID=T.UserID
LEFT JOIN [Essentials].[Fault] f ON f.FaultID=T.FaultID
) T1
)PO

) tab1 
 
  left join 

 (
 select * from data.PieceWiseScanDN 
 where PieceWiseScanningID in (select distinct PieceWiseScanningID from data.EndLineFaultLog)
 )
 tab2 
 on tab1.PieceWiseScanningID=tab2.PieceWiseScanningID
GO
/****** Object:  View [report].[EndLineSessionDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [report].[EndLineSessionDN] AS
 select [EndLineSessionID]
      ,[SaleOrderID]
      ,[SaleOrderCode]
      ,[Customer]
      ,[OrderQuantity]
      ,[ProductionOrderID]
      ,[ProductionOrderCode]
      ,[CutJobID]
      ,[CutNo]
      ,[MarkerID]
      ,[Plies]
      ,[BundleID]
      ,[BundleCode]
      ,[BundleQuantity]
      ,[ScannedQuantity]
      ,[RemainingQuantity]
      ,[Size]
      ,[Color]
      ,[PieceID]
      ,[PieceNumber]
      ,[StyleTemplateID]
      ,[LineID]
      ,[LineCode]
      ,[LineDescription]
      ,[SectionID]
      ,[SectionCode]
      ,[SectionDescription]
      ,[Status]
      ,[UserID]
      ,[UserName]
      ,[TotalFaults]
      ,[CreatedAt]
      ,[UpdatedAt]
      ,(datepart(hour,[CreatedAt]))as [HourSlot]
      ,(dateadd(hour,datepart(hour,[CreatedAt]),CONVERT([time],CONVERT([varchar](20),[CreatedAt],(112)))))as   [NewHourSlot] 
	  from (SELECT EndLineSessionID,SaleOrderID,SaleOrderCode,Customer,OrderQuantity,ProductionOrderID,ProductionOrderCode,CutJobID,CutNo,MarkerID,Plies,
BundleID,BundleCode,BundleQuantity,ScannedQuantity,RemainingQuantity,Size,Color,PieceID,PieceNumber,StyleTemplateID,LineID,LineCode,LineDescription,
SectionID,SectionCode,SectionDescription,[Status],UserID,UserName,FaultID,FaultCode,FaultDescription,FaultCount,TotalFaults,CreatedAt,UpdatedAt 
FROM
(
SELECT T.*,pwcr.PieceNumber,pwcr.StyleTemplateID,l.LineCode,l.LineDescription,s.SectionCode,
s.SectionDescription,u.UserName,f.FaultCode,f.FaultDescription  
FROM
(
SELECT els.*,cr.BundleCode,cr.BundleQuantity,cr.ScannedQuantity,cr.RemainingQuantity,cr.Size,cr.Color,cj.CutJobID,cj.CutNo,
cj.MarkerID,cj.Plies,p.ProductionOrderID,p.ProductionOrderCode,so.SaleOrderID,so.SaleOrderCode,so.Customer,so.OrderQuantity
FROM
(
SELECT els.*,elflg.FaultID,elflg.FaultCount,ISNULL(elflg.TotalFaults,0) AS TotalFaults FROM Data.EndLineSession els
LEFT JOIN (

SELECT T.*,T1.TotalFaults FROM [Data].[EndLineFaultLog] T
LEFT JOIN
(
SELECT EndLineSessionID,SUM(FaultCount) AS TotalFaults 
FROM [Data].[EndLineFaultLog]
GROUP BY EndLineSessionID
) T1 ON T.EndLineSessionID=T1.EndLineSessionID

) elflg ON elflg.EndLineSessionID=els.EndLineSessionID

) els 
INNER JOIN [Essentials].[CutReport] cr ON cr.BundleID=els.BundleID
INNER JOIN [Essentials].[CutJob] cj ON cj.CutJobID=cr.CutJobID
INNER JOIN [Essentials].[ProductionOrder] p ON p.ProductionOrderID=cj.ProductionOrderID
INNER JOIN [Essentials].[SaleOrder] so ON so.SaleOrderID=P.SaleOrderID 
) T INNER JOIN [Essentials].[PieceWiseCutReport] pwcr ON pwcr.PieceID = T.PieceID
INNER JOIN [Essentials].[Line] l ON l.LineID=T.LineID
INNER JOIN [Essentials].[Section] s ON s.SectionID=T.SectionID 
INNER JOIN [Essentials].[User] u on u.UserID=T.UserID
LEFT JOIN [Essentials].[Fault] f ON f.FaultID=T.FaultID
) T1
)PO 
GROUP BY 
[EndLineSessionID]
      ,[SaleOrderID]
      ,[SaleOrderCode]
      ,[Customer]
      ,[OrderQuantity]
      ,[ProductionOrderID]
      ,[ProductionOrderCode]
      ,[CutJobID]
      ,[CutNo]
      ,[MarkerID]
      ,[Plies]
      ,[BundleID]
      ,[BundleCode]
      ,[BundleQuantity]
      ,[ScannedQuantity]
      ,[RemainingQuantity]
      ,[Size]
      ,[Color]
      ,[PieceID]
      ,[PieceNumber]
      ,[StyleTemplateID]
      ,[LineID]
      ,[LineCode]
      ,[LineDescription]
      ,[SectionID]
      ,[SectionCode]
      ,[SectionDescription]
      ,[Status]
      ,[UserID]
      ,[UserName]
      ,[TotalFaults]
      ,[CreatedAt]
      ,[UpdatedAt]

GO
/****** Object:  View [report].[vwLineWiseProductionInductionDHU_Today]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create view [report].[vwLineWiseProductionInductionDHU_Today] as 

select CreatedAtDate,SaleOrderID,SaleOrderCode,ProductionOrderID,ProductionOrderCode,LineCode,LineDescription
,0 as induction, count(0) as production, 0 as InlineCheckedPcs, 0 as InlinelineFaults, 0 as EndlineCheckedPcs, 0 as EndlineFaults
 from Data.PieceWiseScanDN
where CreatedAtDate=cast(GETDATE() as date) and IsLast = 1
group by CreatedAtDate,SaleOrderID,SaleOrderCode,ProductionOrderID,ProductionOrderCode,LineCode,LineDescription

UNION

select CreatedAtDate,SaleOrderID,SaleOrderCode,ProductionOrderID,ProductionOrderCode,LineCode,LineDescription
,count(0) as induction, 0 as production, 0 as InlineCheckedPcs, 0 as InlinelineFaults, 0 as EndlineCheckedPcs, 0 as EndlineFaults
 from Data.PieceWiseScanDN
where CreatedAtDate=cast(GETDATE() as date) and IsFirst = 1
group by CreatedAtDate,SaleOrderID,SaleOrderCode,ProductionOrderID,ProductionOrderCode,LineCode,LineDescription

union 

SELECT CAST(CreatedAt AS DATE) AS CreatedAtDate,SaleOrderID,SaleOrderCode,ProductionOrderID,ProductionOrderCode,LineCode,LineDescription
,0 as induction, 0 as production
, 0 as InlineCheckedPcs, 0 as InlinelineFaults, COUNT(PieceID) as EndlineCheckedPcs, Sum(TotalFaults) as EndlineFaults
--0.0 as InlineDHU,(Sum(TotalFaults)*1.0) /COUNT(PieceID)  EndlineDHU
 FROM report.EndLineSessionDN WHERE CAST(CreatedAt AS DATE)= CAST(GETDATE() AS DATE)
 group by CAST(CreatedAt AS DATE),SaleOrderID,SaleOrderCode,ProductionOrderID,ProductionOrderCode,LineCode,LineDescription



 union 


  
select CreatedAtDate,null as SaleOrderID,null as SaleOrderCode,null as ProductionOrderID,
null as ProductionOrderCode,LineCode,LineDescription
,0 as induction, 0 as production, sum(checkedpcs) as InlineCheckedPcs, sum(TotalFaults) as InlinelineFaults, 0 as EndlineCheckedPcs, 0 as EndlineFaults

 from (
SELECT 7 as checkedpcs,* FROM report.AuditFormSessionDN
where CreatedAtDate=cast(getdate() as date)
)p1
group by CreatedAtDate,LineCode,LineDescription
GO
/****** Object:  View [report].[vwWrokerEfficiencyReportNotToday]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

 create view [report].[vwWrokerEfficiencyReportNotToday] as 
SELECT DaysOfDate, case when BreakTimeCheck=22 then 0 else StayMins end as StayMins,
Identifier,earnedMins,RowNumber,BreakTimeCheck,startTime,CreatedAtDate,ScannedPcs,CutJobID,CutNo,ProductionOrderID
,ProductionOrderCode,StyleTemplateID,Size,Color,WorkerCode,WorkerDescription,WorkerID,
LineCode,LineID,LineDescription,SMV,flag,OperationID,OperationDescription,OperationSequence,SaleOrderCode,SaleOrderID
,OperationCode
FROM (

select DATENAME(DW,createdAtDate)DaysOfDate,
 CASE wHEN Identifier=1
					THEN (datediff(SECOND, startTime,lead(startTime) over(order by RowNumber)))/60.0  
					ELSE  ScannedPcs  *  smv 
					END AS StayMins,* from (
select 
CASE          WHEN startTime -  EndTime = 0 then 2
			WHEN createdAtdate = lead(createdAtdate) OVER(ORDER BY RowNumber) AND
					workerid = lead(workerid) OVER(ORDER BY RowNumber)  and
					LineID = lead(LineID) over (order by RowNumber)
					THEN 1
			ELSE 0 END AS Identifier

,ScannedPcs*SMV earnedMins,*
 
 
from (
 
SELECT  Row_number() OVER (ORDER BY WorkerID,startTime) AS RowNumber,* 

FROM (




  select  
  -- this check is for break time just replace 0 with 22 and change the time to exclude staytime of breaktime 
  case when  DATENAME(DW,createdAtDate) = 'Friday' and cast(CreatedAt as time)> '13:00' and  cast(CreatedAt as time)< '14:30'
  then 0 
  when DATENAME(DW,createdAtDate) <> 'Friday' and cast(CreatedAt as time)> '13:00' and  cast(CreatedAt as time)< '14:00'
  then 0 else 0 end as BreakTimeCheck,
  CreatedAt startTime,null as EndTime,CreatedAtDate,count(PieceID) as ScannedPcs
,CutJobID,CutNo,ProductionOrderID,ProductionOrderCode,StyleTemplateID,Size,color, 
WorkerCode,WorkerID,WorkerDescription,LineID,LineCode,LineDescription,smv,2 as flag
,OperationID,OperationDescription,OperationSequence ,SaleOrderCode,SaleOrderID,OperationCode
FROM dbo.PieceWiseScanDN
where CreatedAtDate<>cast(GETDATE() as date)  and OperationDescription<> 'Out From Cutting'
group by CreatedAt ,CreatedAtDate
,CutJobID,CutNo,ProductionOrderID,ProductionOrderCode,StyleTemplateID,Size,color,
WorkerCode,WorkerID,WorkerDescription,LineID,LineCode,LineDescription,smv,OperationID,OperationDescription,OperationSequence,SaleOrderCode
,SaleOrderID,OperationCode
 ) op


) p1 ) tab2
 
 )TAB3
 
 


 
-- Drop table if exists  report.vwWrokerEfficiencyReportNotTodayTBL

-- Select * 
--into report.vwWrokerEfficiencyReportNotTodayTBL  
-- from
-- (
-- SELECT * FROM report.vwWrokerEfficiencyReportNotToday
--  )a
 




GO
/****** Object:  View [report].[vwWrokerEfficiencyReportToday]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 


 CREATE view [report].[vwWrokerEfficiencyReportToday] as 
SELECT DaysOfDate, case when BreakTimeCheck=22 then 0 else StayMins end as StayMins,
Identifier,earnedMins,RowNumber,BreakTimeCheck,startTime,CreatedAtDate,ScannedPcs,CutJobID,CutNo,ProductionOrderID
,ProductionOrderCode,StyleTemplateID,Size,Color,WorkerCode,WorkerDescription,WorkerID,
LineCode,LineID,LineDescription,SMV,flag,OperationID,OperationDescription,OperationSequence,SaleOrderCode,SaleOrderID
,OperationCode
FROM (

select DATENAME(DW,createdAtDate)DaysOfDate,
 CASE wHEN Identifier=1
					THEN (datediff(SECOND, startTime,lead(startTime) over(order by RowNumber)))/60.0  
					ELSE  ScannedPcs  *  smv 
					END AS StayMins,* from (
select 
CASE          WHEN startTime -  EndTime = 0 then 2
			WHEN createdAtdate = lead(createdAtdate) OVER(ORDER BY RowNumber) AND
					workerid = lead(workerid) OVER(ORDER BY RowNumber)  and
					LineID = lead(LineID) over (order by RowNumber)
					THEN 1
			ELSE 0 END AS Identifier

,ScannedPcs*SMV earnedMins,*
 
 
from (
 
SELECT  Row_number() OVER (ORDER BY WorkerID,startTime) AS RowNumber,* 

FROM (




  select   
   -- this check is for break time just replace 0 with 22 and change the time to exclude staytime of breaktime 
  case when  DATENAME(DW,createdAtDate) = 'Friday' and cast(CreatedAt as time)> '13:00' and  cast(CreatedAt as time)< '14:30'
  then 0 
  when DATENAME(DW,createdAtDate) <> 'Friday' and cast(CreatedAt as time)> '13:00' and  cast(CreatedAt as time)< '14:00'
  then 0 else 0 end as BreakTimeCheck,
  CreatedAt startTime,null as EndTime,CreatedAtDate,count(PieceID) as ScannedPcs
,CutJobID,CutNo,ProductionOrderID,ProductionOrderCode,StyleTemplateID,Size,color, 
WorkerCode,WorkerID,WorkerDescription,LineID,LineCode,LineDescription,smv,2 as flag
,OperationID,OperationDescription,OperationSequence ,SaleOrderCode,SaleOrderID,OperationCode
FROM dbo.PieceWiseScanDN
where CreatedAtDate=cast(GETDATE() as date)  and OperationDescription<> 'Out From Cutting'
group by CreatedAt ,CreatedAtDate
,CutJobID,CutNo,ProductionOrderID,ProductionOrderCode,StyleTemplateID,Size,color,
WorkerCode,WorkerID,WorkerDescription,LineID,LineCode,LineDescription,smv,OperationID,OperationDescription,OperationSequence,SaleOrderCode
,SaleOrderID,OperationCode
 ) op


) p1 ) tab2
 
 )TAB3
 
 

  

GO
/****** Object:  Table [report].[vwWrokerEfficiencyReportNotTodayTBL]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [report].[vwWrokerEfficiencyReportNotTodayTBL](
	[DaysOfDate] [nvarchar](30) NULL,
	[StayMins] [float] NULL,
	[Identifier] [int] NOT NULL,
	[earnedMins] [float] NULL,
	[RowNumber] [bigint] NULL,
	[BreakTimeCheck] [int] NOT NULL,
	[startTime] [datetime] NULL,
	[CreatedAtDate] [date] NULL,
	[ScannedPcs] [int] NULL,
	[CutJobID] [int] NULL,
	[CutNo] [varchar](32) NULL,
	[ProductionOrderID] [int] NULL,
	[ProductionOrderCode] [varchar](100) NULL,
	[StyleTemplateID] [int] NULL,
	[Size] [varchar](32) NULL,
	[Color] [varchar](64) NULL,
	[WorkerCode] [varchar](64) NULL,
	[WorkerDescription] [varchar](64) NULL,
	[WorkerID] [int] NULL,
	[LineCode] [varchar](64) NULL,
	[LineID] [int] NULL,
	[LineDescription] [varchar](64) NULL,
	[SMV] [float] NULL,
	[flag] [int] NOT NULL,
	[OperationID] [int] NULL,
	[OperationDescription] [varchar](64) NULL,
	[OperationSequence] [int] NULL,
	[SaleOrderCode] [varchar](100) NULL,
	[SaleOrderID] [int] NULL,
	[OperationCode] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  View [report].[vwWorkerEfficiencyReport]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [report].[vwWorkerEfficiencyReport] as 

select * from    REPORT.vwWrokerEfficiencyReportNotTodayTBL
union all
 SELECT * FROM report.vwWrokerEfficiencyReportToday
GO
/****** Object:  View [dbo].[vw_LineWise_Induction_Production]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_LineWise_Induction_Production] 
AS
SELECT COALESCE(T.LineID,T1.LineID) AS LineID,COALESCE(T.LineCode,T1.LineCode) AS LineCode,
COALESCE(T.LineDescription,T1.LineDescription) AS LineDescription,COALESCE(T.Induction,0) AS Induction,
COALESCE(T1.Production,0) AS Production FROM
(
SELECT COUNT(0) AS Induction,LineID,LineCode,LineDescription,CreatedAtDate AS InductionDate FROM
(
SELECT PieceID,LineID,LineCode,LineDescription,CreatedAtDate FROM [Data].[PieceWiseScanDN] WHERE CreatedAtDate = CAST(GETDATE() AS DATE) AND IsFirst=1
) T 
GROUP BY LineID,LineCode,LineDescription,CreatedAtDate
) T
FULL JOIN
(

SELECT T.*,l.LineCode,l.LineDescription FROM
(
SELECT COUNT(PieceID) AS Production,LineID,CreatedAt AS ProductionDate FROM Data.EndLineSession 
WHERE CreatedAt=CAST(GETDATE() AS DATE) AND Status=1
GROUP BY LineID,CreatedAt
) T INNER JOIN Essentials.Line l ON l.LineID=T.LineID

/*
SELECT COUNT(0) AS Production,LineID,LineCode,LineDescription,CreatedAtDate AS ProductionDate FROM
(
SELECT PieceID,LineID,LineCode,LineDescription,CreatedAtDate FROM [Data].[PieceWiseScanDN] WHERE IsLast=1
) T 
GROUP BY LineID,LineCode,LineDescription,CreatedAtDate
*/

) T1 ON T1.LineID=T.LineID AND T1.ProductionDate = T.InductionDate


GO
/****** Object:  View [dbo].[EndlineSessionDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[EndlineSessionDN] AS
SELECT *, case when Status=1 then 'Clear' when Status=2 then 'Defected' when status=3 then 'Rejected' end as BundleStatus
  FROM  report.[EndLineSessionDN]

GO
/****** Object:  View [dbo].[EndlineDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[EndlineDN] AS
SELECT *, case when Status=1 then 'Clear' when Status=2 then 'Defected' when status=3 then 'Rejected' end as BundleStatus
  FROM  report.[EndLineDN]

GO
/****** Object:  View [dbo].[AuditFormSessionDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [dbo].[AuditFormSessionDN] as

select * from report.AuditFormDN
GO
/****** Object:  View [dbo].[AuditFormDN]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[AuditFormDN] As
SELECT * FROM report.AuditFormSessionDN
GO
/****** Object:  View [report].[cutreport]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [report].[cutreport] as 
select t1.BundleID,cast(t1.CreatedAt as Date) CreatedAtDate,t1.PieceNumber
,t2.BundleCode,t2.CutJobID,t2.Color,t3.CutNo,t3.FabricCode,t3.NetWeight,t3.OColorCode
,t3.SaleOrderCode,t3.TFamilyCode,t3.WeighmentDate,t3.ShiftCode
from Essentials.PieceWiseCutReport t1
left join Essentials.CutReport t2 on t1.BundleID=t2.BundleID
left join Essentials.CutJob t3 on t2.CutJobID=t3.CutJobID
 
GO
/****** Object:  View [dbo].[vw_DateDim]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_DateDim] AS
WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, '2022-05-01', CAST(Getdate() as date))
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, '2022-05-01') FROM seq
)
SELECT Cast(d as date) D FROM d
--ORDER BY d
--OPTION (MAXRECURSION 0);
GO
/****** Object:  Table [Data].[CheckListResponseLog]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[CheckListResponseLog](
	[CheckListResponseLogID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AuditFormSessionID] [int] NOT NULL,
	[CheckListDescription] [varchar](64) NOT NULL,
	[Response] [varchar](6) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_CheckListResponseLogID] PRIMARY KEY CLUSTERED 
(
	[CheckListResponseLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[FloorAttendanceLineWise]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[FloorAttendanceLineWise](
	[FloorAttendanceID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LineID] [int] NOT NULL,
	[LineCode] [varchar](32) NOT NULL,
	[WorkerID] [int] NOT NULL,
	[WorkerCode] [varchar](32) NOT NULL,
	[WorkerDescription] [varchar](32) NOT NULL,
	[MachineID] [int] NOT NULL,
	[MachineCode] [varchar](32) NOT NULL,
	[MachineDescription] [varchar](32) NOT NULL,
	[OperationID] [int] NOT NULL,
	[OperationCode] [varchar](32) NOT NULL,
	[OperationDescription] [varchar](32) NOT NULL,
	[LoginTime] [datetime] NULL,
	[LoginDate] [date] NOT NULL,
 CONSTRAINT [PK_FloorAttendanceLineWise] PRIMARY KEY CLUSTERED 
(
	[FloorAttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[RejectedPieceWiseScan]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[RejectedPieceWiseScan](
	[PieceWiseScanningID] [int] NOT NULL,
	[ScanID] [bigint] NULL,
	[BundleID] [int] NOT NULL,
	[PieceID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
	[WorkerID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[PieceWiseGroupID] [int] NULL,
	[GroupID] [int] NULL,
	[ShortAddress] [varchar](64) NULL,
	[LongAddress] [varchar](64) NULL,
	[HostIP] [varchar](64) NULL,
	[RejectionType] [varchar](10) NULL,
 CONSTRAINT [PK_Rejected_PieceWiseScan] PRIMARY KEY CLUSTERED 
(
	[PieceWiseScanningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Rejected_PieceWiseScan_BundleID_PieceID_OperationID] UNIQUE NONCLUSTERED 
(
	[BundleID] ASC,
	[PieceID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[Scan]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[Scan](
	[ScanID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WorkerScanID] [bigint] NOT NULL,
	[BundleID] [int] NULL,
	[PieceID] [int] NULL,
	[OperationID] [int] NOT NULL,
	[WorkerID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[ShortAddress] [varchar](64) NULL,
	[LongAddress] [varchar](64) NULL,
	[HostIP] [varchar](64) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Scan] PRIMARY KEY CLUSTERED 
(
	[ScanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Scan_BundleID_PieceID_OperationID] UNIQUE NONCLUSTERED 
(
	[BundleID] ASC,
	[PieceID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[ThroughputTime]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[ThroughputTime](
	[ThroughputTimeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderID] [int] NOT NULL,
	[SaleOrderCode] [varchar](32) NOT NULL,
	[ProductionOrderID] [int] NOT NULL,
	[ProductionOrderCode] [varchar](32) NULL,
	[CutJobID] [int] NOT NULL,
	[CutNo] [varchar](32) NOT NULL,
	[BundleID] [int] NOT NULL,
	[BundleCode] [varchar](32) NOT NULL,
	[Size] [varchar](32) NULL,
	[Color] [varchar](64) NULL,
	[LastOperationID] [int] NOT NULL,
	[OperationCode] [varchar](32) NOT NULL,
	[OperationDescription] [varchar](32) NOT NULL,
	[MachineID] [int] NOT NULL,
	[MachineCode] [varchar](32) NOT NULL,
	[MachineDescription] [varchar](32) NOT NULL,
	[TimeLapse] [time](0) NOT NULL,
	[LineID] [int] NULL,
	[SectionID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ThroughputTime] PRIMARY KEY CLUSTERED 
(
	[ThroughputTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[WorkerOperations]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[WorkerOperations](
	[WorkerOperationsID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WorkerScanID] [bigint] NOT NULL,
	[OperationID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkerOperationsID] PRIMARY KEY CLUSTERED 
(
	[WorkerOperationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Data].[WorkInProgress]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Data].[WorkInProgress](
	[WorkInProgressID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderID] [int] NOT NULL,
	[SaleOrderCode] [varchar](32) NOT NULL,
	[ProductionOrderID] [int] NOT NULL,
	[ProductionOrderCode] [varchar](32) NOT NULL,
	[CutJobID] [int] NOT NULL,
	[CutNo] [varchar](32) NOT NULL,
	[BundleID] [int] NOT NULL,
	[BundleCode] [varchar](32) NOT NULL,
	[BundleQuantity] [int] NOT NULL,
	[Size] [varchar](32) NULL,
	[Color] [varchar](64) NULL,
	[OperationID] [int] NOT NULL,
	[OperationCode] [varchar](32) NOT NULL,
	[OperationDescription] [varchar](32) NOT NULL,
	[MachineID] [int] NOT NULL,
	[MachineCode] [varchar](32) NOT NULL,
	[MachineDescription] [varchar](32) NOT NULL,
	[LineID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[WorkerID] [int] NOT NULL,
	[WorkerCode] [varchar](64) NOT NULL,
 CONSTRAINT [PK_WorkInProgress] PRIMARY KEY CLUSTERED 
(
	[WorkInProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_HourSlot]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_HourSlot](
	[Hour] [tinyint] NOT NULL,
	[Time] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VWeightData]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VWeightData](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Type] [varchar](10) NULL,
	[RollNo] [varchar](20) NULL,
	[WeighmentDate] [smalldatetime] NULL,
	[LotNo] [varchar](26) NULL,
	[QualityCode] [varchar](25) NULL,
	[PatternCode] [varchar](30) NULL,
	[FabricCode] [varchar](20) NULL,
	[TFamilyCode] [varchar](30) NULL,
	[OColorCode] [varchar](6) NULL,
	[NetWeight] [numeric](9, 2) NULL,
	[ShiftCode] [char](20) NULL,
 CONSTRAINT [PK_VWeightData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VWeightDataAudit]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VWeightDataAudit](
	[ID] [int] NOT NULL,
	[Type] [varchar](10) NULL,
	[RollNo] [varchar](20) NULL,
	[WeighmentDate] [smalldatetime] NULL,
	[LotNo] [varchar](26) NULL,
	[QualityCode] [varchar](25) NULL,
	[PatternCode] [varchar](30) NULL,
	[FabricCode] [varchar](20) NULL,
	[TFamilyCode] [varchar](30) NULL,
	[OColorCode] [varchar](6) NULL,
	[NetWeight] [numeric](9, 2) NULL,
	[ShiftCode] [char](10) NULL,
	[CommandType] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[AllocatedMachines]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[AllocatedMachines](
	[AllocatedMachinesID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WorkerID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_AllocatedMachinesID] PRIMARY KEY CLUSTERED 
(
	[AllocatedMachinesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[AppVersion]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[AppVersion](
	[AppVersionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Version] [varchar](10) NOT NULL,
	[Address] [varchar](64) NOT NULL,
	[AppType] [varchar](24) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_AppVersion] PRIMARY KEY CLUSTERED 
(
	[AppVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Box]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Box](
	[BoxID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BoxCode] [varchar](64) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CurrentAddress] [int] NOT NULL,
	[ZoneTopic] [varchar](32) NULL,
 CONSTRAINT [PK_BoxID] PRIMARY KEY CLUSTERED 
(
	[BoxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_BoxCode] UNIQUE NONCLUSTERED 
(
	[BoxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Color]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Color] [varchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Department]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DepartmentName] [varchar](40) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Department_DepartmentName] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[DownReason]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[DownReason](
	[DownReasonID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Reason] [varchar](64) NOT NULL,
 CONSTRAINT [PK_DownReason] PRIMARY KEY CLUSTERED 
(
	[DownReasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[LineWiseColorEfficiency]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[LineWiseColorEfficiency](
	[LineID] [int] NULL,
	[LineCode] [nvarchar](16) NULL,
	[Color] [nvarchar](32) NULL,
	[EfficiencyRangeStart] [float] NULL,
	[EfficiencyRangeEnd] [float] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[MachineDownTime]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[MachineDownTime](
	[MachineDownTimeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MachineID] [int] NOT NULL,
	[DownReason] [varchar](max) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Remarks] [varchar](50) NULL,
 CONSTRAINT [PK_MachineDownTimeID] PRIMARY KEY CLUSTERED 
(
	[MachineDownTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[MachineOperations]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[MachineOperations](
	[MachineOperationsID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MachineID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_MachineOperationsID] PRIMARY KEY CLUSTERED 
(
	[MachineOperationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[MachineType]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[MachineType](
	[MachineTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MachineTypeCode] [varchar](64) NOT NULL,
	[MachineTypeDescription] [varchar](64) NOT NULL,
	[Allowance] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_MachineTypeID] PRIMARY KEY CLUSTERED 
(
	[MachineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_MachineTypeCode] UNIQUE NONCLUSTERED 
(
	[MachineTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Marker]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Marker](
	[MarkerID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MarkerCode] [varchar](64) NOT NULL,
	[ProductionOrderID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_MarkerID] PRIMARY KEY CLUSTERED 
(
	[MarkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_MarkerCodePOID] UNIQUE NONCLUSTERED 
(
	[MarkerCode] ASC,
	[ProductionOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[MarkerMapping]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[MarkerMapping](
	[MarkerMappingID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MarkerID] [int] NOT NULL,
	[Size] [varchar](32) NULL,
	[Ratio] [int] NOT NULL,
	[Inseam] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_MarkerMappingID] PRIMARY KEY CLUSTERED 
(
	[MarkerMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Module]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Module](
	[ModuleID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ModuleCode] [varchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ModuleID] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ModuleCode] UNIQUE NONCLUSTERED 
(
	[ModuleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[PanelData]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[PanelData](
	[PanelID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_PanelData] PRIMARY KEY CLUSTERED 
(
	[PanelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[ParentStyleTemplate]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[ParentStyleTemplate](
	[ParentStyleTemplateID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentStyleTemplateDescription] [varchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ParentStyleTemplate] PRIMARY KEY CLUSTERED 
(
	[ParentStyleTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ParentStyleTemplateDescription] UNIQUE NONCLUSTERED 
(
	[ParentStyleTemplateDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[ParentStyleTemplateDetail]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[ParentStyleTemplateDetail](
	[ParentStyleTemplateDetailID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentStyleTemplateID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
	[OperationSequence] [int] NOT NULL,
	[ScanType] [varchar](10) NOT NULL,
	[IsFirst] [bit] NOT NULL,
	[IsLast] [bit] NOT NULL,
	[MachineTypeID] [int] NOT NULL,
	[SMV] [float] NULL,
	[PieceRate] [float] NULL,
	[IsCritical] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ParentStyleTemplateDetail] PRIMARY KEY CLUSTERED 
(
	[ParentStyleTemplateDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ParentStyleTemplateDetail_ParentStyleTemplateID_OperationID] UNIQUE NONCLUSTERED 
(
	[ParentStyleTemplateID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[PieceWiseGroup]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[PieceWiseGroup](
	[PieceWiseGroupID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GroupID] [int] NOT NULL,
	[BundleID] [int] NOT NULL,
	[PieceID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[GroupName] [varchar](20) NULL,
 CONSTRAINT [PK_PieceWiseGroupID] PRIMARY KEY CLUSTERED 
(
	[PieceWiseGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[PrintCutReport]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[PrintCutReport](
	[CutReportPrintID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderCode] [varchar](100) NOT NULL,
	[ProductionOrderCode] [varchar](100) NOT NULL,
	[CutNo] [varchar](32) NOT NULL,
	[BundleCode] [varchar](64) NOT NULL,
	[BundelQuantity] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Size] [varchar](32) NULL,
	[Ratio] [int] NULL,
	[Inseam] [int] NULL,
 CONSTRAINT [PK_PrintCutReport] PRIMARY KEY CLUSTERED 
(
	[CutReportPrintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[ProductionOrderClient]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[ProductionOrderClient](
	[ProductionOrderClientID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductionOrderID] [int] NOT NULL,
	[Color] [varchar](64) NOT NULL,
	[Size] [varchar](32) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionOrderClient] PRIMARY KEY CLUSTERED 
(
	[ProductionOrderClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[ScanGroup]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[ScanGroup](
	[GroupID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupID] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[SectionMapping]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[SectionMapping](
	[SectionMappingID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SectionID] [int] NOT NULL,
	[MappedSectionID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_SectionMapping] PRIMARY KEY CLUSTERED 
(
	[SectionMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Shift]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Shift](
	[ShiftID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ShiftName] [varchar](32) NOT NULL,
	[StartTime] [time](0) NULL,
	[EndTime] [time](0) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Size]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Size] [varchar](32) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[StyleTemplate]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[StyleTemplate](
	[StyleTemplateID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StyleTemplateCode] [varchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[ParentStyleTemplateID] [int] NULL,
 CONSTRAINT [PK_StyleTemplateID] PRIMARY KEY CLUSTERED 
(
	[StyleTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_StyleTemplateCode_ParentStyleTemplate] UNIQUE NONCLUSTERED 
(
	[StyleTemplateCode] ASC,
	[ParentStyleTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[Tag]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[Tag](
	[TagID] [int] NOT NULL,
	[BundleID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[PieceID] [int] NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_TagID] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[TargetFeeding]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[TargetFeeding](
	[TargetFeedingID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TargetDate] [date] NOT NULL,
	[TargetShift] [varchar](10) NOT NULL,
	[LineID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[ManPower] [int] NULL,
	[PlanEfficiency] [float] NOT NULL,
	[PlanProduction] [float] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_TargetFeedingID] PRIMARY KEY CLUSTERED 
(
	[TargetFeedingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Essentials].[UserPermission]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Essentials].[UserPermission](
	[UserPermissionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_UserPermissionID] PRIMARY KEY CLUSTERED 
(
	[UserPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_UserPermission] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LineLayout].[ActiveLayout]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LineLayout].[ActiveLayout](
	[ActiveLayoutID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LayoutID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[StyleTemplateID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[DeActivatedAt] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ActiveLayout] PRIMARY KEY CLUSTERED 
(
	[ActiveLayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LineLayout].[Layout]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LineLayout].[Layout](
	[LayoutID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LayoutName] [varchar](64) NOT NULL,
	[StyleTemplateID] [int] NOT NULL,
	[Revision] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Layout] PRIMARY KEY CLUSTERED 
(
	[LayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_LayoutName_Revision] UNIQUE NONCLUSTERED 
(
	[LayoutName] ASC,
	[Revision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LineLayout].[LayoutMachineType]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LineLayout].[LayoutMachineType](
	[LayoutMachineTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LayoutID] [int] NOT NULL,
	[MachineTypeID] [int] NOT NULL,
	[NoOfMachines] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_LayoutMachineType] PRIMARY KEY CLUSTERED 
(
	[LayoutMachineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LineLayout].[LayoutOperation]    Script Date: 3/13/2024 3:11:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LineLayout].[LayoutOperation](
	[LayoutOperationID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LayoutID] [int] NOT NULL,
	[MachineID] [int] NOT NULL,
	[OperationID] [int] NULL,
	[WorkerID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_LayoutOperation] PRIMARY KEY CLUSTERED 
(
	[LayoutOperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_PieceWiseScanDN_CreatedAtDate]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_PieceWiseScanDN_CreatedAtDate] ON [Data].[PieceWiseScanDN]
(
	[CreatedAtDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PieceWiseScanDN_SaleOrderID_OperationID_BundleID]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_PieceWiseScanDN_SaleOrderID_OperationID_BundleID] ON [Data].[PieceWiseScanDN]
(
	[SaleOrderID] ASC,
	[OperationID] ASC,
	[BundleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VWeightDataAudit_ID]    Script Date: 3/13/2024 3:11:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_VWeightDataAudit_ID] ON [dbo].[VWeightDataAudit]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Data].[AuditFormFaultLog] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[AuditFormFaultLog] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[AuditFormSession] ADD  DEFAULT ((0)) FOR [FollowUp]
GO
ALTER TABLE [Data].[AuditFormSession] ADD  DEFAULT (CONVERT([date],getdate())) FOR [CreatedAtDate]
GO
ALTER TABLE [Data].[AuditFormSession] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[AuditFormSession] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[CheckListResponseLog] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[CheckListResponseLog] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[EndLineFaultLog] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[EndLineFaultLog] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[EndLineSession] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Data].[EndLineSession] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[EndLineSession] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[FloorAttendanceLineWise] ADD  DEFAULT (CONVERT([date],getdate())) FOR [LoginDate]
GO
ALTER TABLE [Data].[PieceWiseScan] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[PieceWiseScan] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[PieceWiseScan] ADD  DEFAULT (NULL) FOR [PieceWiseGroupID]
GO
ALTER TABLE [Data].[PieceWiseScan] ADD  DEFAULT (NULL) FOR [GroupID]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] ADD  CONSTRAINT [DF__RejectedP__Creat__6681C7A4]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] ADD  CONSTRAINT [DF__RejectedP__Updat__6775EBDD]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] ADD  CONSTRAINT [DF__RejectedP__Piece__686A1016]  DEFAULT (NULL) FOR [PieceWiseGroupID]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] ADD  CONSTRAINT [DF__RejectedP__Group__695E344F]  DEFAULT (NULL) FOR [GroupID]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (NULL) FOR [BundleID]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (NULL) FOR [PieceID]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (NULL) FOR [ShortAddress]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (NULL) FOR [LongAddress]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (NULL) FOR [HostIP]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[Scan] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[ThroughputTime] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[ThroughputTime] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[WorkerOperations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[WorkerOperations] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[WorkerScan] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[WorkerScan] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[WorkerScan] ADD  DEFAULT ((0)) FOR [HasExpired]
GO
ALTER TABLE [Data].[WorkerScan] ADD  DEFAULT (NULL) FOR [EndedAt]
GO
ALTER TABLE [Data].[WorkerScan] ADD  DEFAULT (NULL) FOR [Extras]
GO
ALTER TABLE [Data].[WorkInProgress] ADD  CONSTRAINT [DF__WorkInPro__Creat__062F7D27]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Data].[WorkInProgress] ADD  CONSTRAINT [DF__WorkInPro__Updat__0723A160]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[AllocatedMachines] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[AllocatedMachines] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[AppVersion] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[AppVersion] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Box] ADD  DEFAULT (getdate()) FOR [IssueDate]
GO
ALTER TABLE [Essentials].[Box] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Box] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Box] ADD  DEFAULT ((0)) FOR [CurrentAddress]
GO
ALTER TABLE [Essentials].[Color] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Color] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[CutJob] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[CutJob] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[CutReport] ADD  DEFAULT ((0)) FOR [ScannedQuantity]
GO
ALTER TABLE [Essentials].[CutReport] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[CutReport] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Department] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Department] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Fault] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Fault] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Line] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Line] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[LineWiseColorEfficiency] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[LineWiseColorEfficiency] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (NULL) FOR [MachineImageUrl]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (NULL) FOR [MachineThumbnailUrl]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (NULL) FOR [ActiveWorkerID]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (NULL) FOR [LineID]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (NULL) FOR [BoxID]
GO
ALTER TABLE [Essentials].[Machine] ADD  DEFAULT (NULL) FOR [IsMachineDown]
GO
ALTER TABLE [Essentials].[MachineDownTime] ADD  DEFAULT (NULL) FOR [DownReason]
GO
ALTER TABLE [Essentials].[MachineDownTime] ADD  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [Essentials].[MachineDownTime] ADD  DEFAULT (NULL) FOR [EndTime]
GO
ALTER TABLE [Essentials].[MachineDownTime] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[MachineDownTime] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[MachineOperations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[MachineOperations] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[MachineType] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[MachineType] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Marker] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Marker] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[MarkerMapping] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[MarkerMapping] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Module] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Module] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Operation] ADD  DEFAULT (NULL) FOR [PieceRate]
GO
ALTER TABLE [Essentials].[Operation] ADD  DEFAULT (NULL) FOR [OperationImageUrl]
GO
ALTER TABLE [Essentials].[Operation] ADD  DEFAULT (NULL) FOR [OperationThumbnailUrl]
GO
ALTER TABLE [Essentials].[Operation] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Operation] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Operation] ADD  DEFAULT (NULL) FOR [SMV]
GO
ALTER TABLE [Essentials].[PanelData] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[PanelData] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[ParentStyleTemplate] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[ParentStyleTemplate] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] ADD  DEFAULT ((0)) FOR [IsFirst]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] ADD  DEFAULT ((0)) FOR [IsLast]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] ADD  DEFAULT ((0)) FOR [IsCritical]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[PieceWiseCutReport] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[PieceWiseCutReport] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[PieceWiseGroup] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[PieceWiseGroup] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[PieceWiseGroup] ADD  DEFAULT (NULL) FOR [GroupName]
GO
ALTER TABLE [Essentials].[PrintCutReport] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[PrintCutReport] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[ProductionOrder] ADD  DEFAULT (NULL) FOR [StyleTemplateID]
GO
ALTER TABLE [Essentials].[ProductionOrder] ADD  CONSTRAINT [DF_ProductionOrder_IsFollowOperationSequence]  DEFAULT ((0)) FOR [IsFollowOperationSequence]
GO
ALTER TABLE [Essentials].[ProductionOrder] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[ProductionOrder] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[ProductionOrder] ADD  DEFAULT ((0)) FOR [IsPoClosed]
GO
ALTER TABLE [Essentials].[ProductionOrderClient] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[ProductionOrderClient] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[SaleOrder] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[SaleOrder] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[ScanGroup] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[ScanGroup] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Section] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Section] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[SectionMapping] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[SectionMapping] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Shift] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Shift] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Size] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Size] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT ((0)) FOR [IsFirst]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT ((0)) FOR [IsLast]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT (NULL) FOR [SMV]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT (NULL) FOR [PieceRate]
GO
ALTER TABLE [Essentials].[StyleBulletin] ADD  DEFAULT ((0)) FOR [IsCritical]
GO
ALTER TABLE [Essentials].[StyleTemplate] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[StyleTemplate] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Tag] ADD  CONSTRAINT [DF__Tag__BundleID__42E1EEFE]  DEFAULT (NULL) FOR [BundleID]
GO
ALTER TABLE [Essentials].[Tag] ADD  CONSTRAINT [DF__Tag__CreatedAt__43D61337]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Tag] ADD  CONSTRAINT [DF__Tag__UpdatedAt__44CA3770]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Tag] ADD  CONSTRAINT [DF__Tag__PieceID__45BE5BA9]  DEFAULT (NULL) FOR [PieceID]
GO
ALTER TABLE [Essentials].[Tag] ADD  CONSTRAINT [DF__Tag__GroupID__46B27FE2]  DEFAULT (NULL) FOR [GroupID]
GO
ALTER TABLE [Essentials].[TargetFeeding] ADD  CONSTRAINT [DF__TargetFee__Creat__6C190EBB]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[TargetFeeding] ADD  CONSTRAINT [DF__TargetFee__Updat__6D0D32F4]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[User] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[User] ADD  DEFAULT (NULL) FOR [UserImageUrl]
GO
ALTER TABLE [Essentials].[User] ADD  DEFAULT (NULL) FOR [UserThumbnailUrl]
GO
ALTER TABLE [Essentials].[UserPermission] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[UserPermission] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT (NULL) FOR [WorkerImageUrl]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT (NULL) FOR [WorkerThumbnailUrl]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT (NULL) FOR [TodayCheckin]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT (NULL) FOR [TodayProduction]
GO
ALTER TABLE [Essentials].[Worker] ADD  DEFAULT ('Operator') FOR [WorkerType]
GO
ALTER TABLE [LineLayout].[ActiveLayout] ADD  CONSTRAINT [DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [LineLayout].[ActiveLayout] ADD  CONSTRAINT [DF__ActiveLay__Creat__7FB789C2]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [LineLayout].[ActiveLayout] ADD  CONSTRAINT [DF__ActiveLay__Updat__00ABADFB]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [LineLayout].[Layout] ADD  CONSTRAINT [DF__Layout__CreatedA__6D98D987]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [LineLayout].[Layout] ADD  CONSTRAINT [DF__Layout__UpdatedA__6E8CFDC0]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [LineLayout].[LayoutMachineType] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [LineLayout].[LayoutMachineType] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [LineLayout].[LayoutOperation] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [LineLayout].[LayoutOperation] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [Data].[AuditFormFaultLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditFormFaultLog_AuditFormSession] FOREIGN KEY([AuditFormSessionID])
REFERENCES [Data].[AuditFormSession] ([AuditFormSessionID])
GO
ALTER TABLE [Data].[AuditFormFaultLog] CHECK CONSTRAINT [FK_AuditFormFaultLog_AuditFormSession]
GO
ALTER TABLE [Data].[AuditFormFaultLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditFormFaultLog_Fault] FOREIGN KEY([FaultID])
REFERENCES [Essentials].[Fault] ([FaultID])
GO
ALTER TABLE [Data].[AuditFormFaultLog] CHECK CONSTRAINT [FK_AuditFormFaultLog_Fault]
GO
ALTER TABLE [Data].[AuditFormSession]  WITH CHECK ADD  CONSTRAINT [FK_InlineSession_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[AuditFormSession] CHECK CONSTRAINT [FK_InlineSession_Line]
GO
ALTER TABLE [Data].[AuditFormSession]  WITH CHECK ADD  CONSTRAINT [FK_InlineSession_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[AuditFormSession] CHECK CONSTRAINT [FK_InlineSession_Machine]
GO
ALTER TABLE [Data].[AuditFormSession]  WITH CHECK ADD  CONSTRAINT [FK_InlineSession_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[AuditFormSession] CHECK CONSTRAINT [FK_InlineSession_Operation]
GO
ALTER TABLE [Data].[AuditFormSession]  WITH CHECK ADD  CONSTRAINT [FK_InlineSession_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Data].[AuditFormSession] CHECK CONSTRAINT [FK_InlineSession_Section]
GO
ALTER TABLE [Data].[AuditFormSession]  WITH CHECK ADD  CONSTRAINT [FK_InlineSession_User] FOREIGN KEY([UserID])
REFERENCES [Essentials].[User] ([UserID])
GO
ALTER TABLE [Data].[AuditFormSession] CHECK CONSTRAINT [FK_InlineSession_User]
GO
ALTER TABLE [Data].[AuditFormSession]  WITH CHECK ADD  CONSTRAINT [FK_InlineSession_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[AuditFormSession] CHECK CONSTRAINT [FK_InlineSession_Worker]
GO
ALTER TABLE [Data].[CheckListResponseLog]  WITH CHECK ADD  CONSTRAINT [FK_CheckListResponseLog_AuditFormSession] FOREIGN KEY([AuditFormSessionID])
REFERENCES [Data].[AuditFormSession] ([AuditFormSessionID])
GO
ALTER TABLE [Data].[CheckListResponseLog] CHECK CONSTRAINT [FK_CheckListResponseLog_AuditFormSession]
GO
ALTER TABLE [Data].[EndLineFaultLog]  WITH CHECK ADD  CONSTRAINT [FK_EndLineFaultLogNew_EndLineSessionNew] FOREIGN KEY([EndLineSessionID])
REFERENCES [Data].[EndLineSession] ([EndLineSessionID])
GO
ALTER TABLE [Data].[EndLineFaultLog] CHECK CONSTRAINT [FK_EndLineFaultLogNew_EndLineSessionNew]
GO
ALTER TABLE [Data].[EndLineFaultLog]  WITH CHECK ADD  CONSTRAINT [FK_EndLineFaultLogNew_Fault] FOREIGN KEY([FaultID])
REFERENCES [Essentials].[Fault] ([FaultID])
GO
ALTER TABLE [Data].[EndLineFaultLog] CHECK CONSTRAINT [FK_EndLineFaultLogNew_Fault]
GO
ALTER TABLE [Data].[EndLineFaultLog]  WITH CHECK ADD  CONSTRAINT [FK_EndLineFaultLogNew_PieceWiseScan] FOREIGN KEY([PieceWiseScanningID])
REFERENCES [Data].[PieceWiseScan] ([PieceWiseScanningID])
GO
ALTER TABLE [Data].[EndLineFaultLog] CHECK CONSTRAINT [FK_EndLineFaultLogNew_PieceWiseScan]
GO
ALTER TABLE [Data].[EndLineSession]  WITH CHECK ADD  CONSTRAINT [FK_EndLineSessionNew_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Data].[EndLineSession] CHECK CONSTRAINT [FK_EndLineSessionNew_CutReport]
GO
ALTER TABLE [Data].[EndLineSession]  WITH CHECK ADD  CONSTRAINT [FK_EndLineSessionNew_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[EndLineSession] CHECK CONSTRAINT [FK_EndLineSessionNew_Line]
GO
ALTER TABLE [Data].[EndLineSession]  WITH CHECK ADD  CONSTRAINT [FK_EndLineSessionNew_PieceWiseCutReport] FOREIGN KEY([PieceID])
REFERENCES [Essentials].[PieceWiseCutReport] ([PieceID])
GO
ALTER TABLE [Data].[EndLineSession] CHECK CONSTRAINT [FK_EndLineSessionNew_PieceWiseCutReport]
GO
ALTER TABLE [Data].[EndLineSession]  WITH CHECK ADD  CONSTRAINT [FK_EndLineSessionNew_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Data].[EndLineSession] CHECK CONSTRAINT [FK_EndLineSessionNew_Section]
GO
ALTER TABLE [Data].[EndLineSession]  WITH CHECK ADD  CONSTRAINT [FK_EndLineSessionNew_User] FOREIGN KEY([UserID])
REFERENCES [Essentials].[User] ([UserID])
GO
ALTER TABLE [Data].[EndLineSession] CHECK CONSTRAINT [FK_EndLineSessionNew_User]
GO
ALTER TABLE [Data].[FloorAttendanceLineWise]  WITH CHECK ADD  CONSTRAINT [FK_FloorAttendanceLineWise_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[FloorAttendanceLineWise] CHECK CONSTRAINT [FK_FloorAttendanceLineWise_Line]
GO
ALTER TABLE [Data].[FloorAttendanceLineWise]  WITH CHECK ADD  CONSTRAINT [FK_FloorAttendanceLineWise_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[FloorAttendanceLineWise] CHECK CONSTRAINT [FK_FloorAttendanceLineWise_Machine]
GO
ALTER TABLE [Data].[FloorAttendanceLineWise]  WITH CHECK ADD  CONSTRAINT [FK_FloorAttendanceLineWise_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[FloorAttendanceLineWise] CHECK CONSTRAINT [FK_FloorAttendanceLineWise_Operation]
GO
ALTER TABLE [Data].[FloorAttendanceLineWise]  WITH CHECK ADD  CONSTRAINT [FK_FloorAttendanceLineWise_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[FloorAttendanceLineWise] CHECK CONSTRAINT [FK_FloorAttendanceLineWise_Worker]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_CutReport]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_Line]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_Machine]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_Operation]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_PieceWiseCutReport] FOREIGN KEY([PieceID])
REFERENCES [Essentials].[PieceWiseCutReport] ([PieceID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_PieceWiseCutReport]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_PieceWiseGroup] FOREIGN KEY([PieceWiseGroupID])
REFERENCES [Essentials].[PieceWiseGroup] ([PieceWiseGroupID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_PieceWiseGroup]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_Scan] FOREIGN KEY([ScanID])
REFERENCES [Data].[WorkerScan] ([WorkerScanID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_Scan]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_ScanGroup] FOREIGN KEY([GroupID])
REFERENCES [Essentials].[ScanGroup] ([GroupID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_ScanGroup]
GO
ALTER TABLE [Data].[PieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseScan_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[PieceWiseScan] CHECK CONSTRAINT [FK_PieceWiseScan_Worker]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_CutReport]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_Line]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_Machine]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_Operation]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_PieceWiseCutReport] FOREIGN KEY([PieceID])
REFERENCES [Essentials].[PieceWiseCutReport] ([PieceID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_PieceWiseCutReport]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_PieceWiseGroup] FOREIGN KEY([PieceWiseGroupID])
REFERENCES [Essentials].[PieceWiseGroup] ([PieceWiseGroupID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_PieceWiseGroup]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_Scan] FOREIGN KEY([ScanID])
REFERENCES [Data].[WorkerScan] ([WorkerScanID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_Scan]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_ScanGroup] FOREIGN KEY([GroupID])
REFERENCES [Essentials].[ScanGroup] ([GroupID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_ScanGroup]
GO
ALTER TABLE [Data].[RejectedPieceWiseScan]  WITH CHECK ADD  CONSTRAINT [FK_Rejected_PieceWiseScan_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[RejectedPieceWiseScan] CHECK CONSTRAINT [FK_Rejected_PieceWiseScan_Worker]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan__PieceWiseCutReport] FOREIGN KEY([PieceID])
REFERENCES [Essentials].[PieceWiseCutReport] ([PieceID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan__PieceWiseCutReport]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan_CutReport]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan_Line]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan_Machine]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan_Operation]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan_Worker]
GO
ALTER TABLE [Data].[Scan]  WITH CHECK ADD  CONSTRAINT [FK_Scan_WorkerScan] FOREIGN KEY([WorkerScanID])
REFERENCES [Data].[WorkerScan] ([WorkerScanID])
GO
ALTER TABLE [Data].[Scan] CHECK CONSTRAINT [FK_Scan_WorkerScan]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_CutJob] FOREIGN KEY([CutJobID])
REFERENCES [Essentials].[CutJob] ([CutJobID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_CutJob]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_CutReport]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_Line]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_Machine]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_Operation] FOREIGN KEY([LastOperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_Operation]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_ProductionOrder] FOREIGN KEY([ProductionOrderID])
REFERENCES [Essentials].[ProductionOrder] ([ProductionOrderID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_ProductionOrder]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_SaleOrder] FOREIGN KEY([SaleOrderID])
REFERENCES [Essentials].[SaleOrder] ([SaleOrderID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_SaleOrder]
GO
ALTER TABLE [Data].[ThroughputTime]  WITH CHECK ADD  CONSTRAINT [FK_ThroughputTime_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Data].[ThroughputTime] CHECK CONSTRAINT [FK_ThroughputTime_Section]
GO
ALTER TABLE [Data].[WorkerOperations]  WITH CHECK ADD  CONSTRAINT [FK_WorkerOperations_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[WorkerOperations] CHECK CONSTRAINT [FK_WorkerOperations_Operation]
GO
ALTER TABLE [Data].[WorkerOperations]  WITH CHECK ADD  CONSTRAINT [FK_WorkerOperations_WorkerScan] FOREIGN KEY([WorkerScanID])
REFERENCES [Data].[WorkerScan] ([WorkerScanID])
GO
ALTER TABLE [Data].[WorkerOperations] CHECK CONSTRAINT [FK_WorkerOperations_WorkerScan]
GO
ALTER TABLE [Data].[WorkerScan]  WITH CHECK ADD  CONSTRAINT [FK_WorkerScan_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[WorkerScan] CHECK CONSTRAINT [FK_WorkerScan_Line]
GO
ALTER TABLE [Data].[WorkerScan]  WITH CHECK ADD  CONSTRAINT [FK_WorkerScan_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[WorkerScan] CHECK CONSTRAINT [FK_WorkerScan_Machine]
GO
ALTER TABLE [Data].[WorkerScan]  WITH CHECK ADD  CONSTRAINT [FK_WorkerScan_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[WorkerScan] CHECK CONSTRAINT [FK_WorkerScan_Worker]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_CutJob] FOREIGN KEY([CutJobID])
REFERENCES [Essentials].[CutJob] ([CutJobID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_CutJob]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_CutReport]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_Line]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_Machine]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_Operation]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_ProductionOrder] FOREIGN KEY([ProductionOrderID])
REFERENCES [Essentials].[ProductionOrder] ([ProductionOrderID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_ProductionOrder]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_SaleOrder] FOREIGN KEY([SaleOrderID])
REFERENCES [Essentials].[SaleOrder] ([SaleOrderID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_SaleOrder]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_Section]
GO
ALTER TABLE [Data].[WorkInProgress]  WITH CHECK ADD  CONSTRAINT [FK_WorkInProgress_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Data].[WorkInProgress] CHECK CONSTRAINT [FK_WorkInProgress_Worker]
GO
ALTER TABLE [Essentials].[AllocatedMachines]  WITH CHECK ADD  CONSTRAINT [FK_AllocatedMachines_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Essentials].[AllocatedMachines] CHECK CONSTRAINT [FK_AllocatedMachines_Machine]
GO
ALTER TABLE [Essentials].[AllocatedMachines]  WITH CHECK ADD  CONSTRAINT [FK_AllocatedMachines_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Essentials].[AllocatedMachines] CHECK CONSTRAINT [FK_AllocatedMachines_Worker]
GO
ALTER TABLE [Essentials].[CutJob]  WITH CHECK ADD  CONSTRAINT [FK_CutJob_Marker] FOREIGN KEY([MarkerID])
REFERENCES [Essentials].[Marker] ([MarkerID])
GO
ALTER TABLE [Essentials].[CutJob] CHECK CONSTRAINT [FK_CutJob_Marker]
GO
ALTER TABLE [Essentials].[CutJob]  WITH CHECK ADD  CONSTRAINT [FK_CutJob_ProductionOrder] FOREIGN KEY([ProductionOrderID])
REFERENCES [Essentials].[ProductionOrder] ([ProductionOrderID])
GO
ALTER TABLE [Essentials].[CutJob] CHECK CONSTRAINT [FK_CutJob_ProductionOrder]
GO
ALTER TABLE [Essentials].[CutJob]  WITH CHECK ADD  CONSTRAINT [FK_CutJob_StyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[StyleTemplate] ([StyleTemplateID])
GO
ALTER TABLE [Essentials].[CutJob] CHECK CONSTRAINT [FK_CutJob_StyleTemplate]
GO
ALTER TABLE [Essentials].[CutReport]  WITH CHECK ADD  CONSTRAINT [FK_CutReport_CutJob] FOREIGN KEY([CutJobID])
REFERENCES [Essentials].[CutJob] ([CutJobID])
GO
ALTER TABLE [Essentials].[CutReport] CHECK CONSTRAINT [FK_CutReport_CutJob]
GO
ALTER TABLE [Essentials].[CutReport]  WITH CHECK ADD  CONSTRAINT [FK_CutReport_StyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[StyleTemplate] ([StyleTemplateID])
GO
ALTER TABLE [Essentials].[CutReport] CHECK CONSTRAINT [FK_CutReport_StyleTemplate]
GO
ALTER TABLE [Essentials].[Fault]  WITH CHECK ADD  CONSTRAINT [FK_Fault_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Essentials].[Fault] CHECK CONSTRAINT [FK_Fault_Section]
GO
ALTER TABLE [Essentials].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_ActiveWorker] FOREIGN KEY([ActiveWorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [Essentials].[Machine] CHECK CONSTRAINT [FK_Machine_ActiveWorker]
GO
ALTER TABLE [Essentials].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_Box] FOREIGN KEY([BoxID])
REFERENCES [Essentials].[Box] ([BoxID])
GO
ALTER TABLE [Essentials].[Machine] CHECK CONSTRAINT [FK_Machine_Box]
GO
ALTER TABLE [Essentials].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Essentials].[Machine] CHECK CONSTRAINT [FK_Machine_Line]
GO
ALTER TABLE [Essentials].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_MachineType] FOREIGN KEY([MachineTypeID])
REFERENCES [Essentials].[MachineType] ([MachineTypeID])
GO
ALTER TABLE [Essentials].[Machine] CHECK CONSTRAINT [FK_Machine_MachineType]
GO
ALTER TABLE [Essentials].[MachineDownTime]  WITH CHECK ADD  CONSTRAINT [FK_MachineDownTime] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Essentials].[MachineDownTime] CHECK CONSTRAINT [FK_MachineDownTime]
GO
ALTER TABLE [Essentials].[MachineOperations]  WITH CHECK ADD  CONSTRAINT [FK_MachineOperations_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [Essentials].[MachineOperations] CHECK CONSTRAINT [FK_MachineOperations_Machine]
GO
ALTER TABLE [Essentials].[MachineOperations]  WITH CHECK ADD  CONSTRAINT [FK_MachineOperations_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Essentials].[MachineOperations] CHECK CONSTRAINT [FK_MachineOperations_Operation]
GO
ALTER TABLE [Essentials].[Marker]  WITH CHECK ADD  CONSTRAINT [FK_Marker_ProductionOrder] FOREIGN KEY([ProductionOrderID])
REFERENCES [Essentials].[ProductionOrder] ([ProductionOrderID])
GO
ALTER TABLE [Essentials].[Marker] CHECK CONSTRAINT [FK_Marker_ProductionOrder]
GO
ALTER TABLE [Essentials].[MarkerMapping]  WITH CHECK ADD  CONSTRAINT [FK_MarkerMappingID_Marker] FOREIGN KEY([MarkerID])
REFERENCES [Essentials].[Marker] ([MarkerID])
GO
ALTER TABLE [Essentials].[MarkerMapping] CHECK CONSTRAINT [FK_MarkerMappingID_Marker]
GO
ALTER TABLE [Essentials].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Department] FOREIGN KEY([DepartmentID])
REFERENCES [Essentials].[Department] ([DepartmentID])
GO
ALTER TABLE [Essentials].[Operation] CHECK CONSTRAINT [FK_Operation_Department]
GO
ALTER TABLE [Essentials].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Essentials].[Operation] CHECK CONSTRAINT [FK_Operation_Section]
GO
ALTER TABLE [Essentials].[PanelData]  WITH CHECK ADD  CONSTRAINT [FK_PanelData_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Essentials].[PanelData] CHECK CONSTRAINT [FK_PanelData_Line]
GO
ALTER TABLE [Essentials].[PanelData]  WITH CHECK ADD  CONSTRAINT [FK_PanelData_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Essentials].[PanelData] CHECK CONSTRAINT [FK_PanelData_Section]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail]  WITH CHECK ADD  CONSTRAINT [FK_ParentStyleTemplateDetail_MachineType] FOREIGN KEY([MachineTypeID])
REFERENCES [Essentials].[MachineType] ([MachineTypeID])
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] CHECK CONSTRAINT [FK_ParentStyleTemplateDetail_MachineType]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail]  WITH CHECK ADD  CONSTRAINT [FK_ParentStyleTemplateDetail_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] CHECK CONSTRAINT [FK_ParentStyleTemplateDetail_Operation]
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail]  WITH CHECK ADD  CONSTRAINT [FK_ParentStyleTemplateDetail_StyleTemplate] FOREIGN KEY([ParentStyleTemplateID])
REFERENCES [Essentials].[ParentStyleTemplate] ([ParentStyleTemplateID])
GO
ALTER TABLE [Essentials].[ParentStyleTemplateDetail] CHECK CONSTRAINT [FK_ParentStyleTemplateDetail_StyleTemplate]
GO
ALTER TABLE [Essentials].[PieceWiseCutReport]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseCutReport_CutReport] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Essentials].[PieceWiseCutReport] CHECK CONSTRAINT [FK_PieceWiseCutReport_CutReport]
GO
ALTER TABLE [Essentials].[PieceWiseCutReport]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseCutReport_StyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[StyleTemplate] ([StyleTemplateID])
GO
ALTER TABLE [Essentials].[PieceWiseCutReport] CHECK CONSTRAINT [FK_PieceWiseCutReport_StyleTemplate]
GO
ALTER TABLE [Essentials].[PieceWiseGroup]  WITH CHECK ADD  CONSTRAINT [FK_CutReport_PieceWiseGroup] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Essentials].[PieceWiseGroup] CHECK CONSTRAINT [FK_CutReport_PieceWiseGroup]
GO
ALTER TABLE [Essentials].[PieceWiseGroup]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseCutReport_PieceWiseGroup] FOREIGN KEY([PieceID])
REFERENCES [Essentials].[PieceWiseCutReport] ([PieceID])
GO
ALTER TABLE [Essentials].[PieceWiseGroup] CHECK CONSTRAINT [FK_PieceWiseCutReport_PieceWiseGroup]
GO
ALTER TABLE [Essentials].[PieceWiseGroup]  WITH CHECK ADD  CONSTRAINT [FK_PieceWiseGroup_Group] FOREIGN KEY([GroupID])
REFERENCES [Essentials].[ScanGroup] ([GroupID])
GO
ALTER TABLE [Essentials].[PieceWiseGroup] CHECK CONSTRAINT [FK_PieceWiseGroup_Group]
GO
ALTER TABLE [Essentials].[ProductionOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrder_ParentStyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[ParentStyleTemplate] ([ParentStyleTemplateID])
GO
ALTER TABLE [Essentials].[ProductionOrder] CHECK CONSTRAINT [FK_ProductionOrder_ParentStyleTemplate]
GO
ALTER TABLE [Essentials].[ProductionOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrder_SaleOrder] FOREIGN KEY([SaleOrderID])
REFERENCES [Essentials].[SaleOrder] ([SaleOrderID])
GO
ALTER TABLE [Essentials].[ProductionOrder] CHECK CONSTRAINT [FK_ProductionOrder_SaleOrder]
GO
ALTER TABLE [Essentials].[ProductionOrderClient]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrderClient_ProductionOrder] FOREIGN KEY([ProductionOrderID])
REFERENCES [Essentials].[ProductionOrder] ([ProductionOrderID])
GO
ALTER TABLE [Essentials].[ProductionOrderClient] CHECK CONSTRAINT [FK_ProductionOrderClient_ProductionOrder]
GO
ALTER TABLE [Essentials].[SectionMapping]  WITH CHECK ADD  CONSTRAINT [FK_SectionMapping_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Essentials].[SectionMapping] CHECK CONSTRAINT [FK_SectionMapping_Section]
GO
ALTER TABLE [Essentials].[StyleBulletin]  WITH CHECK ADD  CONSTRAINT [FK_StyleBulletin_MachineType] FOREIGN KEY([MachineTypeID])
REFERENCES [Essentials].[MachineType] ([MachineTypeID])
GO
ALTER TABLE [Essentials].[StyleBulletin] CHECK CONSTRAINT [FK_StyleBulletin_MachineType]
GO
ALTER TABLE [Essentials].[StyleBulletin]  WITH CHECK ADD  CONSTRAINT [FK_StyleBulletin_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [Essentials].[StyleBulletin] CHECK CONSTRAINT [FK_StyleBulletin_Operation]
GO
ALTER TABLE [Essentials].[StyleBulletin]  WITH CHECK ADD  CONSTRAINT [FK_StyleBulletin_StyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[StyleTemplate] ([StyleTemplateID])
GO
ALTER TABLE [Essentials].[StyleBulletin] CHECK CONSTRAINT [FK_StyleBulletin_StyleTemplate]
GO
ALTER TABLE [Essentials].[StyleTemplate]  WITH CHECK ADD  CONSTRAINT [FK_StyleTemplate_ParentStyleTemplate] FOREIGN KEY([ParentStyleTemplateID])
REFERENCES [Essentials].[ParentStyleTemplate] ([ParentStyleTemplateID])
GO
ALTER TABLE [Essentials].[StyleTemplate] CHECK CONSTRAINT [FK_StyleTemplate_ParentStyleTemplate]
GO
ALTER TABLE [Essentials].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Bundle] FOREIGN KEY([BundleID])
REFERENCES [Essentials].[CutReport] ([BundleID])
GO
ALTER TABLE [Essentials].[Tag] CHECK CONSTRAINT [FK_Tag_Bundle]
GO
ALTER TABLE [Essentials].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Group] FOREIGN KEY([GroupID])
REFERENCES [Essentials].[ScanGroup] ([GroupID])
GO
ALTER TABLE [Essentials].[Tag] CHECK CONSTRAINT [FK_Tag_Group]
GO
ALTER TABLE [Essentials].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Piece] FOREIGN KEY([PieceID])
REFERENCES [Essentials].[PieceWiseCutReport] ([PieceID])
GO
ALTER TABLE [Essentials].[Tag] CHECK CONSTRAINT [FK_Tag_Piece]
GO
ALTER TABLE [Essentials].[TargetFeeding]  WITH CHECK ADD  CONSTRAINT [FK_TargetFeeding_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Essentials].[TargetFeeding] CHECK CONSTRAINT [FK_TargetFeeding_Line]
GO
ALTER TABLE [Essentials].[TargetFeeding]  WITH CHECK ADD  CONSTRAINT [FK_TargetFeeding_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Essentials].[TargetFeeding] CHECK CONSTRAINT [FK_TargetFeeding_Section]
GO
ALTER TABLE [Essentials].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [Essentials].[User] CHECK CONSTRAINT [FK_User_Line]
GO
ALTER TABLE [Essentials].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Section] FOREIGN KEY([SectionID])
REFERENCES [Essentials].[Section] ([SectionID])
GO
ALTER TABLE [Essentials].[User] CHECK CONSTRAINT [FK_User_Section]
GO
ALTER TABLE [Essentials].[UserPermission]  WITH CHECK ADD  CONSTRAINT [FK_UserPermission_Module] FOREIGN KEY([ModuleID])
REFERENCES [Essentials].[Module] ([ModuleID])
GO
ALTER TABLE [Essentials].[UserPermission] CHECK CONSTRAINT [FK_UserPermission_Module]
GO
ALTER TABLE [Essentials].[UserPermission]  WITH CHECK ADD  CONSTRAINT [FK_UserPermission_User] FOREIGN KEY([UserID])
REFERENCES [Essentials].[User] ([UserID])
GO
ALTER TABLE [Essentials].[UserPermission] CHECK CONSTRAINT [FK_UserPermission_User]
GO
ALTER TABLE [LineLayout].[ActiveLayout]  WITH CHECK ADD  CONSTRAINT [FK_ActiveLayout_Layout] FOREIGN KEY([LayoutID])
REFERENCES [LineLayout].[Layout] ([LayoutID])
GO
ALTER TABLE [LineLayout].[ActiveLayout] CHECK CONSTRAINT [FK_ActiveLayout_Layout]
GO
ALTER TABLE [LineLayout].[ActiveLayout]  WITH CHECK ADD  CONSTRAINT [FK_ActiveLayout_Line] FOREIGN KEY([LineID])
REFERENCES [Essentials].[Line] ([LineID])
GO
ALTER TABLE [LineLayout].[ActiveLayout] CHECK CONSTRAINT [FK_ActiveLayout_Line]
GO
ALTER TABLE [LineLayout].[ActiveLayout]  WITH CHECK ADD  CONSTRAINT [FK_ActiveLayout_StyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[StyleTemplate] ([StyleTemplateID])
GO
ALTER TABLE [LineLayout].[ActiveLayout] CHECK CONSTRAINT [FK_ActiveLayout_StyleTemplate]
GO
ALTER TABLE [LineLayout].[Layout]  WITH CHECK ADD  CONSTRAINT [FK_Layout_StyleTemplate] FOREIGN KEY([StyleTemplateID])
REFERENCES [Essentials].[StyleTemplate] ([StyleTemplateID])
GO
ALTER TABLE [LineLayout].[Layout] CHECK CONSTRAINT [FK_Layout_StyleTemplate]
GO
ALTER TABLE [LineLayout].[LayoutMachineType]  WITH CHECK ADD  CONSTRAINT [FK_LayoutMachineType_Layout] FOREIGN KEY([LayoutID])
REFERENCES [LineLayout].[Layout] ([LayoutID])
GO
ALTER TABLE [LineLayout].[LayoutMachineType] CHECK CONSTRAINT [FK_LayoutMachineType_Layout]
GO
ALTER TABLE [LineLayout].[LayoutMachineType]  WITH CHECK ADD  CONSTRAINT [FK_LayoutMachineType_MachineType] FOREIGN KEY([MachineTypeID])
REFERENCES [Essentials].[MachineType] ([MachineTypeID])
GO
ALTER TABLE [LineLayout].[LayoutMachineType] CHECK CONSTRAINT [FK_LayoutMachineType_MachineType]
GO
ALTER TABLE [LineLayout].[LayoutOperation]  WITH CHECK ADD  CONSTRAINT [FK_LayoutOperation_Layout] FOREIGN KEY([LayoutID])
REFERENCES [LineLayout].[Layout] ([LayoutID])
GO
ALTER TABLE [LineLayout].[LayoutOperation] CHECK CONSTRAINT [FK_LayoutOperation_Layout]
GO
ALTER TABLE [LineLayout].[LayoutOperation]  WITH CHECK ADD  CONSTRAINT [FK_LayoutOperation_Machine] FOREIGN KEY([MachineID])
REFERENCES [Essentials].[Machine] ([MachineID])
GO
ALTER TABLE [LineLayout].[LayoutOperation] CHECK CONSTRAINT [FK_LayoutOperation_Machine]
GO
ALTER TABLE [LineLayout].[LayoutOperation]  WITH CHECK ADD  CONSTRAINT [FK_LayoutOperation_Operation] FOREIGN KEY([OperationID])
REFERENCES [Essentials].[Operation] ([OperationID])
GO
ALTER TABLE [LineLayout].[LayoutOperation] CHECK CONSTRAINT [FK_LayoutOperation_Operation]
GO
ALTER TABLE [LineLayout].[LayoutOperation]  WITH CHECK ADD  CONSTRAINT [FK_LayoutOperation_Worker] FOREIGN KEY([WorkerID])
REFERENCES [Essentials].[Worker] ([WorkerID])
GO
ALTER TABLE [LineLayout].[LayoutOperation] CHECK CONSTRAINT [FK_LayoutOperation_Worker]
GO
ALTER TABLE [Data].[EndLineSession]  WITH CHECK ADD  CONSTRAINT [CK_EndLineSessionNew_Status] CHECK  (([Status]=(8) OR [Status]=(7) OR [Status]=(6) OR [Status]=(5) OR [Status]=(4) OR [Status]=(3) OR [Status]=(2) OR [Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [Data].[EndLineSession] CHECK CONSTRAINT [CK_EndLineSessionNew_Status]
GO
ALTER TABLE [Essentials].[Operation]  WITH CHECK ADD  CONSTRAINT [CK_Operation_OperationType] CHECK  (([OperationType]='Machine' OR [OperationType]='Manual'))
GO
ALTER TABLE [Essentials].[Operation] CHECK CONSTRAINT [CK_Operation_OperationType]
GO
ALTER TABLE [Essentials].[TargetFeeding]  WITH CHECK ADD  CONSTRAINT [CK_TargetFeeding_TargetShift] CHECK  (([TargetShift]='Night' OR [TargetShift]='Evening' OR [TargetShift]='Morning'))
GO
ALTER TABLE [Essentials].[TargetFeeding] CHECK CONSTRAINT [CK_TargetFeeding_TargetShift]
GO
/****** Object:  StoredProcedure [Data].[uspInsertWorkerScan]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Data].[uspInsertWorkerScan](@worker_id INT,@machine_id INT,@line_id INT,@extras VARCHAR(1024),@message VARCHAR(1024) OUT,@code INT OUT ,
@latest_worker_scan_id INT OUT)
AS
BEGIN
	SET NOCOUNT ON;
    BEGIN TRY

    BEGIN TRAN
			UPDATE [Data].[WorkerScan]
			SET EndedAt = GETDATE(),HasExpired = 1
			WHERE (MachineID = @machine_id OR WorkerID = @worker_id) AND EndedAt IS NULL;
		      
	        INSERT INTO [Data].[WorkerScan](WorkerID, MachineID, LineID, Extras)
            VALUES(@worker_id, @machine_id, @line_id,@extras);

	        SELECT @latest_worker_scan_id = SCOPE_IDENTITY();

            INSERT INTO [Data].[WorkerOperations](WorkerScanID,OperationID)
	        SELECT @latest_worker_scan_id, OperationID FROM [Essentials].[MachineOperations]
	        WHERE MachineID = @machine_id;

    COMMIT TRAN
        SET @message = 'Success';
	    SET @code = 0;
    
  
  END TRY
  BEGIN CATCH

        SET @message = ERROR_MESSAGE();
	    SET @code = ERROR_NUMBER();
      ROLLBACK;
  
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[IntegrateWeightData]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IntegrateWeightData]
AS
BEGIN

    SET NOCOUNT ON;
	
	
	select (QualityCode+LotNo) as  SaleOrderCode,* into #SO from dbo.VWeightData

    -- Insert data into SaleOrder table
    INSERT INTO Essentials.SaleOrder (SaleOrderCode,Customer,OrderQuantity)
    SELECT  distinct SaleOrderCode,'CS',0
    FROM #SO w
	where w.SaleOrderCode not in 
	(select SaleOrderCode from Essentials.SaleOrder s) and w.SaleOrderCode is not null;

    -- Insert data into ProductionOrder table
   INSERT INTO Essentials.ProductionOrder (ProductionOrderCode, SaleOrderID)
   SELECT distinct ss.SaleOrderCode,s.SaleOrderID from Essentials.SaleOrder s
   join #SO ss on ss.SaleOrderCode=s.SaleOrderCode
   where ss.SaleOrderCode not in 
   (select ProductionOrderCode from Essentials.ProductionOrder)

   

    -- Insert data into ProductionOrderClient table
    INSERT INTO Essentials.ProductionOrderClient (ProductionOrderID, Color, Size)
	 SELECT distinct s.ProductionOrderID,ss.OColorCode,'Size'
	 From Essentials.ProductionOrder s
	join #SO ss on ss.SaleOrderCode=s.ProductionOrderCode
	where s.ProductionOrderID not in 
	 (select ProductionOrderID From Essentials.ProductionOrderClient o)


   
   
    -- Insert data into CutJob table
    INSERT INTO Essentials.CutJob (CutNo, ProductionOrderID, Plies, WeighmentDate, SaleOrderCode, FabricCode, TFamilyCode, OColorCode, NetWeight, ShiftCode)
    SELECT DISTINCT wd.RollNo, po.ProductionOrderID, CAST(ROUND(RAND() * 4, 0) + 1 AS INT), wd.WeighmentDate, wd.SaleOrderCode, wd.FabricCode, wd.TFamilyCode, wd.OColorCode, wd.NetWeight, wd.ShiftCode
    FROM #SO wd
    JOIN Essentials.ProductionOrder po ON wd.SaleOrderCode = po.ProductionOrderCode
	where  not exists
	(select 1 from Essentials.CutJob c where c.SaleOrderCode=wd.SaleOrderCode and wd.RollNo=c.CutNo )

	

	Drop table #SO
END
GO
/****** Object:  StoredProcedure [dbo].[uspFullBackup]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[uspFullBackup]
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @name NVARCHAR(128);
  DECLARE @path NVARCHAR(260);
  DECLARE @fileName NVARCHAR(260);
  DECLARE @backupType VARCHAR(10);
  
  DECLARE db_cursor CURSOR FOR
    SELECT name
    FROM master.sys.databases
    WHERE name NOT IN ('master','model','msdb','tempdb') AND state = 0; -- Exclude system databases and offline databases
  
  OPEN db_cursor;
  
  FETCH NEXT FROM db_cursor INTO @name;
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @fileName = @name + '_' + REPLACE(CONVERT(VARCHAR(10), GETDATE(), 120),'-','_') + '_' + REPLACE(CONVERT(VARCHAR(5),GETDATE(),108),':','_') + '.bak';
    SET @path = '/var/opt/sqlserver/backup/' + @fileName;
    SET @backupType = 'FULL';
    
    BACKUP DATABASE @name
    TO DISK = @path
    WITH FORMAT, INIT, SKIP, NOREWIND, NOUNLOAD, NAME = @name, COMPRESSION , STATS = 10;
    
    FETCH NEXT FROM db_cursor INTO @name;
  END;
  
  CLOSE db_cursor;
  DEALLOCATE db_cursor;
END;
GO
/****** Object:  StoredProcedure [Essentials].[uspSetMachineDown]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Essentials].[uspSetMachineDown](@machine_id INT,@down_reason VARCHAR(MAX), @message VARCHAR(1024) OUT,@code INT OUT)
AS
BEGIN
	SET NOCOUNT ON;
    BEGIN TRY

		BEGIN TRAN

			INSERT INTO [Essentials].[MachineDownTime](MachineID,DownReason)
			VALUES(@machine_id,@down_reason);
        
			UPDATE [Essentials].[Machine]
			SET IsMachineDown =1,ActiveWorkerID = NULL
			WHERE MachineID = @machine_id;

		COMMIT TRAN
	  
			SET @message =  'Success';
			SET @code = 0;
    
	END TRY

	BEGIN CATCH

		SET @message = ERROR_MESSAGE();
		SET @code = ERROR_NUMBER();
		ROLLBACK;

	END CATCH



END
GO
/****** Object:  StoredProcedure [Essentials].[uspSetMachineWorker]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Essentials].[uspSetMachineWorker](@worker_id INT,@machine_id INT, @message VARCHAR(1024) OUT,@code INT OUT)
AS
BEGIN
	SET NOCOUNT ON;
    BEGIN TRY

		BEGIN TRAN

			UPDATE [Essentials].[Machine] SET ActiveWorkerID = NULL,UpdatedAt = GETDATE() WHERE ActiveWorkerID = @worker_id; 
			UPDATE [Essentials].[Machine] SET ActiveWorkerID = @worker_id,UpdatedAt = GETDATE() WHERE MachineID = @machine_id;
      
		COMMIT TRAN
	  
			SET @message =  'Success';
			SET @code = 0;
    END TRY

    BEGIN CATCH
        SET @message = ERROR_MESSAGE();
	    SET @code = ERROR_NUMBER();
        ROLLBACK;
    END CATCH


END
GO
/****** Object:  StoredProcedure [Essentials].[uspSetMahineUp]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Essentials].[uspSetMahineUp](@machine_id INT, @message VARCHAR(1024) OUT,@code INT OUT)
AS
BEGIN
	SET NOCOUNT ON;
    BEGIN TRY

		BEGIN TRAN
			UPDATE [Essentials].[MachineDownTime]
			SET EndTime = GETDATE()
			WHERE MachineID = @machine_id AND EndTime IS NULL;
        
			UPDATE [Essentials].[Machine] 
			SET IsMachineDown = 0
			WHERE MachineID = @machine_id;

		COMMIT TRAN
	  
			SET @message =  'Success';
			SET @code = 0;
	END TRY

	BEGIN CATCH

		SET @message = ERROR_MESSAGE();
		SET @code = ERROR_NUMBER();
		ROLLBACK;

  END CATCH



END
GO
/****** Object:  StoredProcedure [Essentials].[uspUpdateWorkerTodayProduction]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [Essentials].[uspUpdateWorkerTodayProduction](@worker_id INT,@production_pieces INT, @total_pieces INT OUT,@message VARCHAR(1024) OUT,@code INT OUT)
AS
BEGIN
	SET NOCOUNT ON;
    BEGIN TRY

		BEGIN TRAN

			UPDATE [Essentials].[Worker]
		    SET TodayProduction = (ISNULL(TodayProduction, 0) + @production_pieces),UpdatedAt = GETDATE()
		    WHERE WorkerID = @worker_id;     
      
		COMMIT TRAN
      	
		SELECT @total_pieces=TodayProduction 
	    FROM [Essentials].[Worker]
	    WHERE WorkerID = @worker_id;
	    
        SET @message =  'Success';
	    SET @code = 0;
    
    END TRY

    BEGIN CATCH
        
        SET @message = ERROR_MESSAGE();
	    SET @code = ERROR_NUMBER();
        ROLLBACK;
        
    END CATCH


END
GO
/****** Object:  Trigger [Data].[TR_InsertIntoPieceWiseScanDN]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Data].[TR_InsertIntoPieceWiseScanDN]
ON [Data].[PieceWiseScan]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @PieceWiseScanningID INT,@ScanID BIGINT,@BundleID INT,@PieceID INT,@OperationID INT,@WorkerID INT,@LineID INT,@MachineID INT,
    @CreatedAt DATETIME,@UpdatedAt DATETIME,@PieceWiseGroupID INT,@GroupID INT,@ShortAddress VARCHAR(64),@LongAddress VARCHAR(64),
    @HostIP VARCHAR(64),@RWcount INT,@i INT = 0,@message VARCHAR(1024),@code INT;

    SELECT PieceWiseScanningID ,ScanID,BundleID,PieceID,OperationID,WorkerID,LineID,MachineID,CreatedAt,UpdatedAt,
    PieceWiseGroupID,GroupID,ShortAddress,LongAddress,HostIP INTO #PieceWiseScan FROM INSERTED;

    DECLARE InsertIntoPwsDN CURSOR FOR
    SELECT PieceWiseScanningID ,ScanID,BundleID,PieceID,OperationID,WorkerID,LineID,MachineID,CreatedAt,UpdatedAt,
    PieceWiseGroupID,GroupID,ShortAddress,LongAddress,HostIP FROM #PieceWiseScan

    OPEN InsertIntoPwsDN
    FETCH NEXT FROM InsertIntoPwsDN INTO @PieceWiseScanningID ,@ScanID,@BundleID,@PieceID,@OperationID,@WorkerID,@LineID,@MachineID,@CreatedAt,@UpdatedAt,
    @PieceWiseGroupID,@GroupID,@ShortAddress,@LongAddress,@HostIP;

    WHILE @@FETCH_STATUS=0
        BEGIN

            BEGIN TRY

                INSERT INTO [Data].[PieceWiseScanDN](PieceWiseScanningID,ScanID,SaleOrderID,SaleOrderCode,Customer,OrderQuantity,ProductionOrderID,ProductionOrderCode,CutJobID,CutNo,MarkerID,Plies,WeighmentDate,
                FabricCode,TFamilyCode,OColorCode,NetWeight,ShiftCode,BundleID,BundleCode,BundleQuantity,ScannedQuantity,RemainingQuantity,Size,Color,PieceID,PieceNumber,OperationID,OperationCode,OperationName,
                OperationDescription,OperationType,SectionID,DepartmentID,DepartmentName,WorkerID,WorkerCode,WorkerDescription,TodayCheckin,TodayProduction,LineID,LineCode,LineDescription,MachineID,MachineCode,
                MachineDescription,MachineTypeID,BoxID,IsMachineDown,StyleTemplateID,IsFirst,IsLast,PieceRate,OperationSequence,SMV,PieceWiseGroupID,GroupID,ShortAddress,LongAddress,HostIP,CreatedAt,UpdatedAt)
                SELECT PieceWiseScanningID,ScanID,SaleOrderID,SaleOrderCode,Customer,OrderQuantity,ProductionOrderID,ProductionOrderCode,CutJobID,CutNo,MarkerID,Plies,WeighmentDate,FabricCode,TFamilyCode,OColorCode,
                NetWeight,ShiftCode,BundleID,BundleCode,BundleQuantity,ScannedQuantity,RemainingQuantity,Size,Color,PieceID,PieceNumber,OperationID,OperationCode,OperationName,OperationDescription,OperationType,
                SectionID,DepartmentID,DepartmentName,WorkerID,WorkerCode,WorkerDescription,TodayCheckin,TodayProduction,LineID,LineCode,LineDescription,MachineID,MachineCode,MachineDescription,MachineTypeID,BoxID,
                IsMachineDown,StyleTemplateID,IsFirst,IsLast,PieceRate,OperationSequence,SMV,PieceWiseGroupID,GroupID,ShortAddress,LongAddress,HostIP,CreatedAt,UpdatedAt
                FROM
                (
                SELECT T6.*,stb.IsFirst,stb.IsLast,stb.PieceRate,stb.OperationSequence,stb.SMV FROM
                (
                SELECT T5.*,D.DepartmentName FROM
                (
                SELECT T4.*,m.MachineCode,m.MachineDescription,m.MachineTypeID,m.BoxID,m.IsMachineDown FROM 
                (
                SELECT T3.*,l.LineCode,l.LineDescription FROM 
                (
                SELECT T2.*,w.WorkerCode,w.WorkerDescription,w.TodayCheckin,w.TodayProduction FROM
                (
                SELECT T1.*,op.OperationCode,op.OperationName,op.OperationDescription,op.OperationType,op.SectionID,op.DepartmentID FROM 
                (
                SELECT T.*,pwcr.PieceNumber,pwcr.StyleTemplateID FROM
                (
                SELECT pws.*,cr.BundleCode,cr.BundleQuantity,cr.ScannedQuantity,cr.RemainingQuantity,cr.Size,cr.Color AS Color,cj.CutJobID,cj.CutNo,cj.MarkerID,cj.Plies,cj.WeighmentDate,cj.FabricCode,cj.TFamilyCode,
                cj.OColorCode,cj.NetWeight,cj.ShiftCode,p.ProductionOrderID,p.ProductionOrderCode,so.SaleOrderID,so.SaleOrderCode,so.Customer,so.OrderQuantity FROM
                (
                SELECT @PieceWiseScanningID AS PieceWiseScanningID,@ScanID AS ScanID,@BundleID AS BundleID,@PieceID AS PieceID,@OperationID AS OperationID,@WorkerID AS WorkerID,@LineID AS LineID,@MachineID AS MachineID,
                @CreatedAt AS CreatedAt,@UpdatedAt AS UpdatedAt,@PieceWiseGroupID AS PieceWiseGroupID,@GroupID AS GroupID,@ShortAddress AS ShortAddress,@LongAddress AS LongAddress,@HostIP AS HostIP
                ) pws
                INNER JOIN [Essentials].[CutReport] cr ON cr.BundleID=pws.BundleID
                INNER JOIN [Essentials].[CutJob] cj ON cj.CutJobID=cr.CutJobID
                INNER JOIN [Essentials].[ProductionOrder] p ON p.ProductionOrderID=cj.ProductionOrderID
                INNER JOIN [Essentials].[SaleOrder] so ON so.SaleOrderID=P.SaleOrderID
                ) T  INNER JOIN [Essentials].[PieceWiseCutReport] pwcr ON pwcr.PieceID = T.PieceID
                ) T1 INNER JOIN [Essentials].[Operation] op on op.OperationID=T1.OperationID
                ) T2 LEFT JOIN  [Essentials].[Worker] w ON w.WorkerID = T2.WorkerID
                ) T3 LEFT JOIN  [Essentials].[Line] l on l.LineID=T3.LineID
                ) T4 LEFT JOIN  [Essentials].[Machine] m on m.MachineID = T4.MachineID
                ) T5 LEFT JOIN [Essentials].[Department] d on d.DepartmentID = T5.DepartmentID
                ) T6 LEFT JOIN [Essentials].[StyleBulletin] stb on stb.StyleTemplateID=T6.StyleTemplateID AND stb.OperationID=T6.OperationID 
                ) T7 WHERE NOT EXISTS (SELECT * FROM Data.PieceWiseScanDN T WHERE T.PieceWiseScanningID=T7.PieceWiseScanningID)


                
                SET @message = 'Success';
                SET @code = 0;

            END TRY
            BEGIN CATCH

            SET @message = ERROR_MESSAGE();
            SET @code = ERROR_NUMBER();

            END CATCH



            FETCH NEXT FROM InsertIntoPwsDN INTO @PieceWiseScanningID ,@ScanID,@BundleID,@PieceID,@OperationID,@WorkerID,@LineID,@MachineID,@CreatedAt,@UpdatedAt,
            @PieceWiseGroupID,@GroupID,@ShortAddress,@LongAddress,@HostIP;

        END


    CLOSE InsertIntoPwsDN
    DEALLOCATE InsertIntoPwsDN

    DROP TABLE #PieceWiseScan

END
GO
ALTER TABLE [Data].[PieceWiseScan] ENABLE TRIGGER [TR_InsertIntoPieceWiseScanDN]
GO
/****** Object:  Trigger [dbo].[trg_VWeightData_delete]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_VWeightData_delete]
ON [dbo].[VWeightData]
AFTER DELETE
AS
BEGIN
   INSERT INTO VWeightDataAudit (ID,Type, RollNo, WeighmentDate, LotNo, QualityCode, PatternCode, FabricCode, TFamilyCode, OColorCode, NetWeight, ShiftCode, CommandType)
   SELECT d.ID,d.Type, d.RollNo, d.WeighmentDate, d.LotNo, d.QualityCode, d.PatternCode, d.FabricCode, d.TFamilyCode, d.OColorCode, d.NetWeight, d.ShiftCode, 'Deleted'
   FROM deleted d;
END;
GO
ALTER TABLE [dbo].[VWeightData] ENABLE TRIGGER [trg_VWeightData_delete]
GO
/****** Object:  Trigger [dbo].[trg_VWeightData_insert]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_VWeightData_insert]
ON [dbo].[VWeightData]
AFTER INSERT
AS
BEGIN
   INSERT INTO VWeightDataAudit (ID,Type, RollNo, WeighmentDate, LotNo, QualityCode, PatternCode, FabricCode, TFamilyCode, OColorCode, NetWeight, ShiftCode, CommandType)
   SELECT i.ID,i.Type, i.RollNo, i.WeighmentDate, i.LotNo, i.QualityCode, i.PatternCode, i.FabricCode, i.TFamilyCode, i.OColorCode, i.NetWeight, i.ShiftCode, 'Inserted'
   FROM inserted i;
END;
GO
ALTER TABLE [dbo].[VWeightData] ENABLE TRIGGER [trg_VWeightData_insert]
GO
/****** Object:  Trigger [dbo].[trg_VWeightData_update]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_VWeightData_update]
ON [dbo].[VWeightData]
AFTER UPDATE
AS
BEGIN
   INSERT INTO VWeightDataAudit (ID,Type, RollNo, WeighmentDate, LotNo, QualityCode, PatternCode, FabricCode, TFamilyCode, OColorCode, NetWeight, ShiftCode, CommandType)
   SELECT i.ID,i.Type, i.RollNo, i.WeighmentDate, i.LotNo, i.QualityCode, i.PatternCode, i.FabricCode, i.TFamilyCode, i.OColorCode, i.NetWeight, i.ShiftCode, 'Updated'
   FROM inserted i;
END;
GO
ALTER TABLE [dbo].[VWeightData] ENABLE TRIGGER [trg_VWeightData_update]
GO
/****** Object:  Trigger [Essentials].[TR_Machine_Update_AllocatedMachines]    Script Date: 3/13/2024 3:11:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Essentials].[TR_Machine_Update_AllocatedMachines]
        ON [Essentials].[AllocatedMachines]
AFTER UPDATE,DELETE
AS
BEGIN
       SET NOCOUNT ON;
       DECLARE @WorkerID INT;
	DECLARE @MachineID INT;
	WITH cte1 AS(
              SELECT
                     d.WorkerID AS DeletedID,
		       i.WorkerID AS InsertedID,
		       d.MachineID AS DeletedMID,
		       i.MachineID AS INSERTEDMID
              FROM Deleted d
              FULL OUTER HASH JOIN Inserted i ON i.WorkerID = d.WorkerID AND d.MachineID = i.MachineID
              ) 
			SELECT 
		       @WorkerID =  COALESCE(InsertedID,DeletedID),
		       @MachineID =  COALESCE(InsertedMID,DeletedMID) FROM cte1;
		 

       UPDATE [Essentials].[Machine] 
       SET ActiveWorkerID = NULL,UpdatedAt = GETDATE() 
       WHERE ActiveWorkerID = @WorkerID AND MachineID = @MachineID;
 END;
GO
ALTER TABLE [Essentials].[AllocatedMachines] ENABLE TRIGGER [TR_Machine_Update_AllocatedMachines]
GO
/****** Object:  Trigger [Essentials].[TR_Insert_CutPieces]    Script Date: 3/13/2024 3:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Essentials].[TR_Insert_CutPieces]
ON [Essentials].[CutReport]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ID INT;
	DECLARE @QUANTITY INT;
	DECLARE @STID INT;
	DECLARE @PN INT;
	SET @PN = 1;
	SELECT @ID = BundleID FROM inserted;
	SELECT @QUANTITY = BundleQuantity FROM inserted;
	SELECT @STID = StyleTemplateID FROM inserted;
	WHILE (@PN<=@QUANTITY)
    BEGIN
        INSERT INTO [Essentials].[PieceWiseCutReport](BundleID,PieceNumber,StyleTemplateID)
        VALUES (@ID,@PN,@STID);
		SET @PN = @PN+1;
    END

END
GO
ALTER TABLE [Essentials].[CutReport] ENABLE TRIGGER [TR_Insert_CutPieces]
GO
/****** Object:  Trigger [Essentials].[TR_update_CutPieces]    Script Date: 3/13/2024 3:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  TRIGGER [Essentials].[TR_update_CutPieces]
ON [Essentials].[CutReport]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ID INT,@QUANTITY INT,@STID INT,@PN INT= 1;	
    SELECT @ID = BundleID,@QUANTITY = BundleQuantity,@STID = StyleTemplateID  FROM inserted;

    IF UPDATE(BundleQuantity)
    BEGIN

        DELETE FROM [Essentials].[PieceWiseCutReport]
        WHERE BundleID = @ID;
        
        WHILE (@PN<=@QUANTITY)
        BEGIN
            INSERT INTO [Essentials].[PieceWiseCutReport](BundleID,PieceNumber,StyleTemplateID)
            VALUES (@ID,@PN,@STID);
            SET @PN = @PN+1;
        END
    END
END
GO
ALTER TABLE [Essentials].[CutReport] ENABLE TRIGGER [TR_update_CutPieces]
GO
/****** Object:  Trigger [Essentials].[TR_UpdateMachine_MachineOperations]    Script Date: 3/13/2024 3:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [Essentials].[TR_UpdateMachine_MachineOperations]
	ON [Essentials].[MachineOperations]
AFTER UPDATE,DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @MachineID INT;
	WITH cte AS(
		SELECT 
	       	d.MachineID AS DeletedID,
			i.MachineID AS InsertedID
		FROM 
		Deleted d
		FULL OUTER HASH JOIN Inserted i ON d.MachineID = i.MachineID
		)
		SELECT	@MachineID = COALESCE(DeletedID,InsertedID) FROM cte;

	UPDATE [Essentials].[Machine] 
       SET ActiveWorkerID = NULL,UpdatedAt = GETDATE() 
       WHERE MachineID = @MachineID;
END;
GO
ALTER TABLE [Essentials].[MachineOperations] ENABLE TRIGGER [TR_UpdateMachine_MachineOperations]
GO
/****** Object:  Trigger [Essentials].[Tr_Insert_stb]    Script Date: 3/13/2024 3:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [Essentials].[Tr_Insert_stb]
ON [Essentials].[StyleBulletin]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @StyleTemplateID INT;

	SELECT DISTINCT StyleTemplateID INTO #StyleB FROM INSERTED;


	DECLARE stb CURSOR FOR 
	SELECT StyleTemplateID		 
	FROM #StyleB 

	OPEN stb  
	FETCH NEXT FROM stb INTO @StyleTemplateID;  

	WHILE @@FETCH_STATUS = 0  
		BEGIN  

			IF NOT EXISTS(SELECT * FROM [Essentials].[StyleBulletin] WHERE StyleTemplateID=@StyleTemplateID AND OperationID LIKE '%-%')
			BEGIN
				INSERT INTO [Essentials].[StyleBulletin](StyleTemplateID,OperationID,OperationSequence,ScanType,MachineTypeID,SMV,PieceRate)
				VALUES (@StyleTemplateID,-1,-1,'Bundle',1,0,0),(@StyleTemplateID,-2,-2,'Bundle',1,0,0);
			END

			FETCH NEXT FROM stb INTO @StyleTemplateID; 

		END 

	CLOSE stb  
	DEALLOCATE stb
	DROP TABLE #StyleB;

END
GO
ALTER TABLE [Essentials].[StyleBulletin] ENABLE TRIGGER [Tr_Insert_stb]
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
         Begin Table = "WorkerScan (Data)"
            Begin Extent = 
               Top = 12
               Left = 76
               Bottom = 259
               Right = 367
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Yesterday_FirstLogin_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Yesterday_FirstLogin_vw'
GO
USE [master]
GO
ALTER DATABASE [SooperWizer] SET  READ_WRITE 
GO
