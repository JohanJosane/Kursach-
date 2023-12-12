USE [CopsBase]
GO
/****** Object:  Table [dbo].[CarAccident]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarAccident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarAccident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProgram]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProgram](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cops]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[PostCops] [nvarchar](50) NOT NULL,
	[NumberPhone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[NumberPhone] [nvarchar](50) NOT NULL,
	[DateOfBirthday] [date] NOT NULL,
	[ResidentialAddress] [nvarchar](50) NOT NULL,
	[DriversLicense] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protocol]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protocol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IncidentAmount] [nvarchar](50) NOT NULL,
	[DateOfPayment] [date] NOT NULL,
	[CopsId] [int] NOT NULL,
	[OwnerId] [int] NOT NULL,
 CONSTRAINT [PK_Protocol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTS]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PTS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[RegistrNumber] [nvarchar](50) NOT NULL,
	[NumberVIN] [nvarchar](50) NOT NULL,
	[CarBrand] [nvarchar](50) NOT NULL,
	[CarModel] [nvarchar](50) NOT NULL,
	[HP] [nvarchar](50) NOT NULL,
	[TipTS] [nvarchar](50) NOT NULL,
	[ColorCar] [nvarchar](50) NOT NULL,
	[Weight] [nvarchar](50) NOT NULL,
	[YearOfIssue] [date] NOT NULL,
 CONSTRAINT [PK_PTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02.12.2023 21:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarAccident] ON 

INSERT [dbo].[CarAccident] ([Id], [Date], [Place]) VALUES (2, CAST(N'2023-08-05' AS Date), N'Москва')
INSERT [dbo].[CarAccident] ([Id], [Date], [Place]) VALUES (3, CAST(N'0001-01-01' AS Date), N'Лос Анжелес ')
SET IDENTITY_INSERT [dbo].[CarAccident] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientProgram] ON 

INSERT [dbo].[ClientProgram] ([Id], [Login], [Password], [RoleId]) VALUES (1, N'21232F297A57A5A743894A0E4A801FC3', N'21232F297A57A5A743894A0E4A801FC3', 1)
INSERT [dbo].[ClientProgram] ([Id], [Login], [Password], [RoleId]) VALUES (2, N'48674A035E1123D29602391831C6E319', N'B3575F222F7B768C25160B879699118B', 2)
INSERT [dbo].[ClientProgram] ([Id], [Login], [Password], [RoleId]) VALUES (3, N'CE94897FA38AED6E353B4BA99078A859', N'0745064918B49693CCA64D6B6A13D28A', 2)
INSERT [dbo].[ClientProgram] ([Id], [Login], [Password], [RoleId]) VALUES (4, N'C4CA4238A0B923820DCC509A6F75849B', N'C4CA4238A0B923820DCC509A6F75849B', 1)
INSERT [dbo].[ClientProgram] ([Id], [Login], [Password], [RoleId]) VALUES (5, N'C81E728D9D4C2F636F067F89CC14862C', N'C81E728D9D4C2F636F067F89CC14862C', 2)
SET IDENTITY_INSERT [dbo].[ClientProgram] OFF
GO
SET IDENTITY_INSERT [dbo].[Cops] ON 

INSERT [dbo].[Cops] ([Id], [FIO], [PostCops], [NumberPhone]) VALUES (1, N'Френк Тенпенни', N'Officer', N'+63442375533')
INSERT [dbo].[Cops] ([Id], [FIO], [PostCops], [NumberPhone]) VALUES (2, N'Эдди Пуласки', N'Officer', N'+69453762285')
INSERT [dbo].[Cops] ([Id], [FIO], [PostCops], [NumberPhone]) VALUES (3, N' Натан Кросс', N'Sergeant', N'+38730982787')
INSERT [dbo].[Cops] ([Id], [FIO], [PostCops], [NumberPhone]) VALUES (4, N'Леон Кеннеди', N'Officer', N'+9776654545')
SET IDENTITY_INSERT [dbo].[Cops] OFF
GO
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([Id], [FIO], [NumberPhone], [DateOfBirthday], [ResidentialAddress], [DriversLicense]) VALUES (1, N'Сухих Максим Андреевич', N'+79127563784', CAST(N'2004-08-01' AS Date), N'Ломоносова 6', N'87 65 789652')
INSERT [dbo].[Owner] ([Id], [FIO], [NumberPhone], [DateOfBirthday], [ResidentialAddress], [DriversLicense]) VALUES (2, N'Родин Олег Альбертович', N'+79127592605', CAST(N'2004-06-15' AS Date), N'Ленина 34', N'93 09 234985')
INSERT [dbo].[Owner] ([Id], [FIO], [NumberPhone], [DateOfBirthday], [ResidentialAddress], [DriversLicense]) VALUES (3, N'Жуков Алексей Николаевич', N'+79047638294', CAST(N'2004-09-12' AS Date), N'Дончука 4', N'34 87 763085')
INSERT [dbo].[Owner] ([Id], [FIO], [NumberPhone], [DateOfBirthday], [ResidentialAddress], [DriversLicense]) VALUES (4, N'Ималиев Радик Алмазовчи', N'+79127593456', CAST(N'2004-01-27' AS Date), N'Ленина 54', N'98 45 075496')
INSERT [dbo].[Owner] ([Id], [FIO], [NumberPhone], [DateOfBirthday], [ResidentialAddress], [DriversLicense]) VALUES (5, N'Оскретков Данил Васильевич', N'+79120743874', CAST(N'0001-04-10' AS Date), N'Далеко', N'87 43 873450')
SET IDENTITY_INSERT [dbo].[Owner] OFF
GO
SET IDENTITY_INSERT [dbo].[Protocol] ON 

INSERT [dbo].[Protocol] ([Id], [IncidentAmount], [DateOfPayment], [CopsId], [OwnerId]) VALUES (1, N'3000000р', CAST(N'2022-12-30' AS Date), 1, 3)
INSERT [dbo].[Protocol] ([Id], [IncidentAmount], [DateOfPayment], [CopsId], [OwnerId]) VALUES (2, N'50000р', CAST(N'2023-10-20' AS Date), 3, 4)
SET IDENTITY_INSERT [dbo].[Protocol] OFF
GO
SET IDENTITY_INSERT [dbo].[PTS] ON 

INSERT [dbo].[PTS] ([Id], [OwnerId], [RegistrNumber], [NumberVIN], [CarBrand], [CarModel], [HP], [TipTS], [ColorCar], [Weight], [YearOfIssue]) VALUES (1, 1, N'Т228ХС', N'896D5FBZ8X7V5H5JU', N'Lamborgini', N'Galardo', N'1600', N'B', N'Yellow', N'1500', CAST(N'2002-01-01' AS Date))
INSERT [dbo].[PTS] ([Id], [OwnerId], [RegistrNumber], [NumberVIN], [CarBrand], [CarModel], [HP], [TipTS], [ColorCar], [Weight], [YearOfIssue]) VALUES (2, 2, N'П137РО', N'97D6G97SD7WDFV5H7', N'Tesla ', N'Model X', N'1800', N'B', N'White', N'2000', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[PTS] ([Id], [OwnerId], [RegistrNumber], [NumberVIN], [CarBrand], [CarModel], [HP], [TipTS], [ColorCar], [Weight], [YearOfIssue]) VALUES (3, 5, N'Р947ПО', N'JHG34KJ3HV53JH5V3HJ5V', N'Chevrolet', N'Lanos', N'120', N'B', N'Blue', N'1300', CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[PTS] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[ClientProgram]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[ClientProgram] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Protocol]  WITH CHECK ADD  CONSTRAINT [FK_Protocol_Cops] FOREIGN KEY([CopsId])
REFERENCES [dbo].[Cops] ([Id])
GO
ALTER TABLE [dbo].[Protocol] CHECK CONSTRAINT [FK_Protocol_Cops]
GO
ALTER TABLE [dbo].[Protocol]  WITH CHECK ADD  CONSTRAINT [FK_Protocol_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owner] ([Id])
GO
ALTER TABLE [dbo].[Protocol] CHECK CONSTRAINT [FK_Protocol_Owner]
GO
ALTER TABLE [dbo].[PTS]  WITH CHECK ADD  CONSTRAINT [FK_PTS_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owner] ([Id])
GO
ALTER TABLE [dbo].[PTS] CHECK CONSTRAINT [FK_PTS_Owner]
GO
