USE [Цінники]
GO
/****** Object:  Table [dbo].[Електротовари]    Script Date: 28.02.2025 23:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Електротовари](
	[id] [int] NULL,
	[product_type] [nvarchar](50) NULL,
	[order_code] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[price] [float] NULL,
	[discount] [float] NULL,
	[quantity] [int] NULL,
	[packing_unit] [nvarchar](10) NULL,
	[min_order_quantity] [int] NULL,
	[producer] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[date_of_delivery] [date] NULL,
	[warranty_end_date] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Електротовари] ADD  CONSTRAINT [DF_Електротовари_discount]  DEFAULT ((0)) FOR [discount]
GO
