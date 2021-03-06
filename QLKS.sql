USE [QuanLyKS]
GO
/****** Object:  Table [dbo].[CaLamViec]    Script Date: 02/11/2020 9:05:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLamViec](
	[ID_Ca] [int] NOT NULL,
	[TenCa] [nvarchar](15) NOT NULL,
	[BatDau] [time](0) NOT NULL,
	[KetThuc] [time](0) NOT NULL,
 CONSTRAINT [PK_CaLamViec] PRIMARY KEY CLUSTERED 
(
	[ID_Ca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCong](
	[ID] [int] NOT NULL,
	[ID_NV] [int] NOT NULL,
	[ID_Lich] [int] NULL,
	[Vao] [time](7) NULL,
	[Ra] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChungTu]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungTu](
	[SoCT] [int] NOT NULL,
	[NgayCT] [datetime] NULL,
	[Loai] [tinyint] NULL,
	[ID_KH] [int] NULL,
	[ID_NV] [int] NULL,
	[NoiDung] [nvarchar](255) NULL,
	[Giam] [float] NULL,
	[VAT] [float] NULL,
	[SoHoaDon] [nvarchar](20) NULL,
	[ID_QL] [int] NULL,
 CONSTRAINT [PK__ChungTu__BC3D1CA91C5EC4F2] PRIMARY KEY CLUSTERED 
(
	[SoCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dangky]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dangky](
	[ID_DK] [int] NOT NULL,
	[SoPhong] [int] NULL,
	[NgayDat] [date] NULL,
	[TuNgay] [date] NULL,
	[DenNgay] [date] NULL,
	[SoKhach] [int] NULL,
	[Nam] [int] NULL,
	[TreEm] [int] NULL,
	[ID_KH] [int] NULL,
	[ID_NV] [int] NULL,
	[Tiencoc] [float] NULL,
 CONSTRAINT [PK__Dangky__8B6237A58035875B] PRIMARY KEY CLUSTERED 
(
	[ID_DK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[ID_DV] [int] NOT NULL,
	[TenDV] [nvarchar](50) NULL,
	[DVT] [nvarchar](7) NULL,
	[DonGia] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[Loai] [tinyint] NULL,
	[SLDK] [float] NULL,
	[GTDK] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doan]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doan](
	[ID] [tinyint] NOT NULL,
	[TenDoan] [nvarchar](50) NULL,
 CONSTRAINT [PK_Doan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongChungTu]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongChungTu](
	[ID] [int] NOT NULL,
	[SoCT] [int] NULL,
	[ID_DV] [int] NULL,
	[SoLuong] [float] NULL,
	[DonGia] [float] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[MaPhong] [nvarchar](10) NULL,
 CONSTRAINT [PK__DongChun__3214EC279E207F54] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [tinyint] NULL,
	[DonVi] [nvarchar](50) NULL,
	[CMND] [nvarchar](12) NULL,
	[NgayCap] [nvarchar](50) NULL,
	[NoiCap] [nvarchar](50) NULL,
	[Loai] [tinyint] NULL,
	[QuocTich] [nvarchar](20) NULL,
	[ID_Doan] [tinyint] NULL,
 CONSTRAINT [PK__KhachHan__8B62EC89A801B812] PRIMARY KEY CLUSTERED 
(
	[ID_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichLamViec]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLamViec](
	[Id_Lich] [int] NOT NULL,
	[Ngay] [date] NOT NULL,
	[Id_NV] [int] NULL,
	[ID_Ca] [int] NULL,
	[TangCa] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_LichLamViec] PRIMARY KEY CLUSTERED 
(
	[Id_Lich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[ID_Loai] [int] NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID_NV] [int] NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[TaiKhoan] [nvarchar](12) NULL,
	[MatKhau] [nvarchar](12) NULL,
	[Loai] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [nvarchar](10) NOT NULL,
	[Tang] [tinyint] NULL,
	[ID_Loai] [int] NULL,
	[Dongia] [float] NULL,
	[TrangThai] [tinyint] NULL,
	[Phone] [nvarchar](5) NULL,
	[Giuong] [tinyint] NULL,
	[Nguoi] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanLyPhong]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLyPhong](
	[ID_QL] [int] NOT NULL,
	[ID_DK] [int] NULL,
	[ID_KH] [int] NULL,
	[MaPhong] [nvarchar](10) NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[Gia] [float] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [tinyint] NULL,
 CONSTRAINT [PK__QuanLyPh__8B63B9C9349B19E1] PRIMARY KEY CLUSTERED 
(
	[ID_QL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuDungDichVu]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuDungDichVu](
	[ID_SD] [int] NOT NULL,
	[ID_QL] [int] NULL,
	[ID_DV] [int] NULL,
	[ID_NV] [int] NULL,
	[Soluong] [float] NULL,
	[DonGia] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThietBiPhong]    Script Date: 02/11/2020 9:05:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThietBiPhong](
	[ID_TB] [int] NOT NULL,
	[MaPhong] [nvarchar](10) NULL,
	[ID_DV] [int] NULL,
	[Soluong] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[SerialNO] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CaLamViec] ([ID_Ca], [TenCa], [BatDau], [KetThuc]) VALUES (0, N'Ca hành chính', CAST(N'08:00:00' AS Time), CAST(N'16:30:00' AS Time))
INSERT [dbo].[CaLamViec] ([ID_Ca], [TenCa], [BatDau], [KetThuc]) VALUES (1, N'Ca 1', CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[CaLamViec] ([ID_Ca], [TenCa], [BatDau], [KetThuc]) VALUES (2, N'Ca 2', CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[CaLamViec] ([ID_Ca], [TenCa], [BatDau], [KetThuc]) VALUES (3, N'Ca 3', CAST(N'23:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[CaLamViec] ([ID_Ca], [TenCa], [BatDau], [KetThuc]) VALUES (4, N'Off', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (1, CAST(N'2020-10-15T00:00:00.000' AS DateTime), 3, 1, 3, NULL, NULL, 0, N'23154632', 1)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (2, CAST(N'2020-10-13T00:00:00.000' AS DateTime), 3, 2, 3, NULL, NULL, 0, N'32153215', 2)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (3, CAST(N'2020-10-16T00:00:00.000' AS DateTime), 3, 3, 3, N'Trả phòng', NULL, 0, N'32155666', 3)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (4, NULL, 3, 5, 0, N'abc', 0, 0, N'', 8)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (5, NULL, 3, 6, 0, N'helllo', 0, 0, N'', 9)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (6, NULL, 3, 7, 0, N'Thang', 0, 0, N'', 10)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (7, NULL, 3, 8, 0, N'Nguyễn Hoàng Anh', 0, 0, N'', 11)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (8, NULL, 3, 9, 0, N'Thang', 0, 0, N'', 12)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (9, NULL, 3, 10, 0, N'jkdhasgf', 0, 0, N'', 13)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (10, NULL, 3, 11, 0, N'Hạhsdg', 0, 0, N'', 14)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (11, NULL, 3, 12, 0, N'ikhsdg', 0, 0, N'', 15)
INSERT [dbo].[ChungTu] ([SoCT], [NgayCT], [Loai], [ID_KH], [ID_NV], [NoiDung], [Giam], [VAT], [SoHoaDon], [ID_QL]) VALUES (12, NULL, 3, 13, 0, N'KhachTestDVPhong', 0, 0, N'', 16)
INSERT [dbo].[Dangky] ([ID_DK], [SoPhong], [NgayDat], [TuNgay], [DenNgay], [SoKhach], [Nam], [TreEm], [ID_KH], [ID_NV], [Tiencoc]) VALUES (0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Dangky] ([ID_DK], [SoPhong], [NgayDat], [TuNgay], [DenNgay], [SoKhach], [Nam], [TreEm], [ID_KH], [ID_NV], [Tiencoc]) VALUES (1, 3, CAST(N'2020-10-08' AS Date), CAST(N'2020-10-08' AS Date), CAST(N'2020-10-13' AS Date), 4, 3, 1, 1, 3, 750000)
INSERT [dbo].[Dangky] ([ID_DK], [SoPhong], [NgayDat], [TuNgay], [DenNgay], [SoKhach], [Nam], [TreEm], [ID_KH], [ID_NV], [Tiencoc]) VALUES (2, 2, CAST(N'2020-10-08' AS Date), CAST(N'2020-10-12' AS Date), CAST(N'2020-10-14' AS Date), 3, 1, NULL, 2, 3, 250000)
INSERT [dbo].[Dangky] ([ID_DK], [SoPhong], [NgayDat], [TuNgay], [DenNgay], [SoKhach], [Nam], [TreEm], [ID_KH], [ID_NV], [Tiencoc]) VALUES (3, 1, CAST(N'2020-10-07' AS Date), CAST(N'2020-10-08' AS Date), CAST(N'2020-10-09' AS Date), 1, 1, NULL, 3, 2, NULL)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (1, N'Cafe', N'Ly', 20000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (2, N'Mỳ gói', N'Tô', 15000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (3, N'Bia Tiger', N'Lon', 20000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (4, N'Bia Ken', N'Lon', 30000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (5, N'StrongBow', N'Lon', 40000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (6, N'CoCa', N'Lon', 15000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (7, N'Giặt ủi', N'bộ', 30000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (8, N'Thuê xe máy', N'ngày', 200000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (9, N'Thuê xe đạp', N'ngày', 100000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (10, N'Thuê oto', N'ngày', 500000, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (11, N'Phòng ở', N'ngày', NULL, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (12, N'TV', N'Cái', 12000000, NULL, 0, 10, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (13, N'Tủ lạnh', N'Cái', 5500000, NULL, 0, 10, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (14, N'Máy lạnh', N'Cái', 1600000, NULL, 0, 10, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (15, N'Khác', N'dv', NULL, NULL, 3, 0, 0)
INSERT [dbo].[DichVu] ([ID_DV], [TenDV], [DVT], [DonGia], [GhiChu], [Loai], [SLDK], [GTDK]) VALUES (16, N'Phụ thu', N'dv', NULL, NULL, 3, 0, 0)
INSERT [dbo].[Doan] ([ID], [TenDoan]) VALUES (0, NULL)
INSERT [dbo].[Doan] ([ID], [TenDoan]) VALUES (1, N'aBC')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (1, 1, 1, 5, 15000, NULL, N'101')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (2, 1, 5, 2, 30000, NULL, N'101')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (3, 1, 4, 5, 25000, NULL, N'101')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (4, 2, 5, 4, 30000, NULL, N'102')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (5, 2, 2, 6, 20000, NULL, N'102')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (6, 2, 5, 3, 30000, NULL, N'102')
INSERT [dbo].[DongChungTu] ([ID], [SoCT], [ID_DV], [SoLuong], [DonGia], [GhiChu], [MaPhong]) VALUES (7, 12, 11, 1, 900000, N'', N'108')
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (1, N'Lê Minh Hằng', 0, NULL, N'25369658345', N'12/1/2008', N'Công An Gia Lâm', 0, N'Việt Nam', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (2, N'Hoàng Minh Huy', 1, NULL, N'15613156662', N'16/2/2009', N'Công An Khánh Hòa', 1, N'Việt Nam', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (3, N'Alexandre Grahambell', 1, N'Tele.Co', N'21341523241', N'15/3/1867', NULL, 1, N'France', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (4, N'abc', 0, N'123', N'123', N'123', N'123', 0, N'123', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (5, N'abc', 0, N'jahg', N'6857', N'jkhgv', N'897', 0, N'ghfv', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (6, N'helllo', 0, N'utaguj', N'jfvsadj', N'jkhva', N'sdkhjgk', 0, N'fveaskj', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (7, N'Thang', 0, N'sjdhg', N'dsjhgv', N'fdgvjkh', N'jhafvsj', 0, N'djshfgv', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (8, N'Nguyễn Hoàng Anh', 0, N'Cần Thơ', N'7645382', N'15/8/2005', N'CA CT', 0, N'Việt NNam', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (9, N'Thang', 0, N'sdjhfg', N'jhdfvsj', N'jksdhg', N'igifguisdf', 1, N'jhdgsj', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (10, N'jkdhasgf', 0, N'sdjhv', N'ùyvd', N'iygdf', N'jyffdsf', 0, N'jhvdf', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (11, N'Hạhsdg', 0, N'khjgdvbslk', N'klhbfd', N'kfjbd', N'kljbdsk', 0, N'jhvbfkj', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (12, N'ikhsdg', 0, N'hjvbjkv', N'hvjhv', N'jvjk', N'vjkvjk', 0, N'jhvj', 0)
INSERT [dbo].[KhachHang] ([ID_KH], [HoTen], [GioiTinh], [DonVi], [CMND], [NgayCap], [NoiCap], [Loai], [QuocTich], [ID_Doan]) VALUES (13, N'KhachTestDVPhong', 0, N'Nao ', N'123423', N'7/7/1997', N'aloha', 0, N'Trung Quoc', 0)
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (1, CAST(N'2020-10-29' AS Date), 2, 1, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (2, CAST(N'2020-10-30' AS Date), 2, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (3, CAST(N'2020-10-31' AS Date), 2, 3, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (4, CAST(N'2020-11-01' AS Date), 2, 0, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (5, CAST(N'2020-11-02' AS Date), 2, 1, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (6, CAST(N'2020-10-28' AS Date), 3, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (7, CAST(N'2020-10-29' AS Date), 3, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (8, CAST(N'2020-10-30' AS Date), 3, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (9, CAST(N'2020-11-01' AS Date), 3, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (10, CAST(N'2020-10-29' AS Date), 4, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (11, CAST(N'2020-10-30' AS Date), 4, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (12, CAST(N'2020-11-03' AS Date), 2, 1, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (13, CAST(N'2020-11-04' AS Date), 2, 2, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (14, CAST(N'2020-11-05' AS Date), 2, 2, 4, N'trfd')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (15, CAST(N'2020-11-06' AS Date), 2, 3, 2, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (16, CAST(N'2020-11-07' AS Date), 2, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (17, CAST(N'2020-10-31' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (18, CAST(N'2020-11-02' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (19, CAST(N'2020-11-03' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (20, CAST(N'2020-11-04' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (21, CAST(N'2020-11-05' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (22, CAST(N'2020-11-06' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (23, CAST(N'2020-11-07' AS Date), 3, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (24, CAST(N'2020-10-31' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (25, CAST(N'2020-11-01' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (26, CAST(N'2020-11-02' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (27, CAST(N'2020-11-03' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (28, CAST(N'2020-11-04' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (29, CAST(N'2020-11-05' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (30, CAST(N'2020-11-06' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (31, CAST(N'2020-11-07' AS Date), 4, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (32, CAST(N'2020-10-31' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (33, CAST(N'2020-11-01' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (34, CAST(N'2020-11-02' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (35, CAST(N'2020-11-03' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (36, CAST(N'2020-11-04' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (37, CAST(N'2020-11-05' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (38, CAST(N'2020-11-06' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (39, CAST(N'2020-11-07' AS Date), 5, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (40, CAST(N'2020-10-31' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (41, CAST(N'2020-11-01' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (42, CAST(N'2020-11-02' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (43, CAST(N'2020-11-03' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (44, CAST(N'2020-11-04' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (45, CAST(N'2020-11-05' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (46, CAST(N'2020-11-06' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (47, CAST(N'2020-11-07' AS Date), 6, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (48, CAST(N'2020-10-31' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (49, CAST(N'2020-11-01' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (50, CAST(N'2020-11-02' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (51, CAST(N'2020-11-03' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (52, CAST(N'2020-11-04' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (53, CAST(N'2020-11-05' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (54, CAST(N'2020-11-06' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (55, CAST(N'2020-11-07' AS Date), 7, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (56, CAST(N'2020-10-31' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (57, CAST(N'2020-11-01' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (58, CAST(N'2020-11-02' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (59, CAST(N'2020-11-03' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (60, CAST(N'2020-11-04' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (61, CAST(N'2020-11-05' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (62, CAST(N'2020-11-06' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (63, CAST(N'2020-11-07' AS Date), 8, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (64, CAST(N'2020-10-31' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (65, CAST(N'2020-11-01' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (66, CAST(N'2020-11-02' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (67, CAST(N'2020-11-03' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (68, CAST(N'2020-11-04' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (69, CAST(N'2020-11-05' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (70, CAST(N'2020-11-06' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (71, CAST(N'2020-11-07' AS Date), 9, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (72, CAST(N'2020-10-31' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (73, CAST(N'2020-11-01' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (74, CAST(N'2020-11-02' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (75, CAST(N'2020-11-03' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (76, CAST(N'2020-11-04' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (77, CAST(N'2020-11-05' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (78, CAST(N'2020-11-06' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LichLamViec] ([Id_Lich], [Ngay], [Id_NV], [ID_Ca], [TangCa], [GhiChu]) VALUES (79, CAST(N'2020-11-07' AS Date), 10, 4, 0, N'')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (1, N'Double')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (2, N'Tripple')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (3, N'Family')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (4, N'Double-VIP')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (5, N'Tripple-VIP')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (6, N'Family-VIP')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (7, N'Working')
INSERT [dbo].[LoaiPhong] ([ID_Loai], [TenLoai]) VALUES (8, N'Hall')
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (0, N'123', N'123', N'123', N'hjdgzf', 0)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (1, N'Đỗ Ngọc Thắng', N'01693366935', N'Thắng', N'admin', 0)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (2, N'Nguyễn Thị Thu Hiền', N'09023586954', N'N.T.T.Hiền', N'123', 1)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (3, N'Hoàng Lê Bảo Quốc', N'09355558865', N'H.L.B.Quốc', N'123', 1)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (4, N'Nguyễn Ngọc Bảo Trâm', N'01212252535', N'N.N.B.Trâm', N'123', 1)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (5, N'Lê  Xuân Hưng', N'0977256256', N'L.X.Hưng', N'456', 2)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (6, N'Lê Hoàng Vương', N'0399665852', N'L.H.Vương', N'456', 4)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (7, N'Hoàng Hồng Trang', N'0152425523', N'H.H.Trang', N'456', 3)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (8, N'Nguyễn Thị Mỹ Duyên', N'0123456785', N'N.T.M.Duyên', N'456', 3)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (9, N'Lê Hồng Kiều', N'0915015325', N'L.H.Kiều', N'456', 2)
INSERT [dbo].[NhanVien] ([ID_NV], [Hoten], [DienThoai], [TaiKhoan], [MatKhau], [Loai]) VALUES (10, N'Nguyễn Ngọc Long', N'09225254524', N'N.N.Long', N'456', 4)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'001', 0, 8, 5500000, 0, N'001', NULL, NULL)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'101', 1, 2, 700000, 4, N'101', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'102', 1, 2, 700000, 5, N'102', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'103', 1, 2, 700000, 5, N'103', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'104', 1, 1, 550000, 4, N'104', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'105', 1, 1, 550000, 4, N'105', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'106', 1, 1, 550000, 4, N'106', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'107', 1, 4, 650000, 0, N'107', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'108', 1, 5, 900000, 1, N'108', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'109', 1, 5, 900000, 3, N'109', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'110', 1, 1, 550000, 4, N'110', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'111', 1, 1, 550000, 0, N'111', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'112', 1, 3, 1000000, 0, N'112', 3, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'201', 2, 2, 700000, 4, N'201', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'202', 2, 2, 700000, 0, N'202', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'203', 2, 2, 700000, 4, N'203', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'204', 2, 1, 550000, 4, N'204', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'205', 2, 1, 550000, 4, N'205', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'206', 2, 1, 550000, 4, N'206', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'207', 2, 4, 650000, 4, N'207', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'208', 2, 5, 900000, 0, N'208', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'209', 2, 5, 900000, 0, N'209', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'210', 2, 1, 550000, 0, N'210', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'211', 2, 1, 550000, 4, N'211', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'212', 2, 6, 1300000, 0, N'212', 3, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'301', 3, 2, 700000, 0, N'301', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'302', 3, 2, 700000, 0, N'302', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'303', 3, 2, 700000, 0, N'303', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'304', 3, 1, 550000, 0, N'304', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'305', 3, 1, 550000, 0, N'305', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'306', 3, 1, 550000, 0, N'306', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'307', 3, 4, 650000, 0, N'307', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'308', 3, 5, 900000, 0, N'308', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'309', 3, 5, 900000, 0, N'309', 2, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'310', 3, 1, 550000, 0, N'310', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'311', 3, 1, 550000, 0, N'311', 1, 0)
INSERT [dbo].[Phong] ([MaPhong], [Tang], [ID_Loai], [Dongia], [TrangThai], [Phone], [Giuong], [Nguoi]) VALUES (N'312', 3, 3, 1000000, 0, N'312', 1, 0)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (1, 1, 1, N'101', CAST(N'2020-10-08T00:00:00.000' AS DateTime), CAST(N'2020-10-13T00:00:00.000' AS DateTime), 0, NULL, 4)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (2, 1, 1, N'102', CAST(N'2020-10-08T00:00:00.000' AS DateTime), CAST(N'2020-10-13T00:00:00.000' AS DateTime), 0, NULL, 4)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (3, 1, 1, N'103', CAST(N'2020-10-08T00:00:00.000' AS DateTime), CAST(N'2020-10-13T00:00:00.000' AS DateTime), 0, NULL, 4)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (4, 2, 2, N'105', CAST(N'2020-10-09T00:00:00.000' AS DateTime), CAST(N'2020-10-12T00:00:00.000' AS DateTime), 0, NULL, 4)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (5, 3, 5, N'101', CAST(N'2020-10-19T00:00:00.000' AS DateTime), CAST(N'2020-10-21T00:00:00.000' AS DateTime), 100000, NULL, 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (6, 3, 1, N'106', CAST(N'2020-10-19T00:00:00.000' AS DateTime), CAST(N'2020-10-21T00:00:00.000' AS DateTime), 0, NULL, 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (7, 0, 4, N'103', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 100000, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (8, 0, 5, N'103', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 100000, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (9, 0, 6, N'108', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 500, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (10, 0, 7, N'109', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 0, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (11, 0, 8, N'211', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 0, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (12, 0, 9, N'206', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 0, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (13, 0, 10, N'201', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 700000, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (14, 0, 11, N'205', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 550000, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (15, 0, 12, N'204', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, 550000, N'', 1)
INSERT [dbo].[QuanLyPhong] ([ID_QL], [ID_DK], [ID_KH], [MaPhong], [CheckIn], [CheckOut], [Gia], [GhiChu], [TrangThai]) VALUES (16, 0, 13, N'108', CAST(N'2020-10-25T00:00:00.000' AS DateTime), CAST(N'2020-10-30T07:58:18.143' AS DateTime), 4950000, N'', 1)
INSERT [dbo].[SuDungDichVu] ([ID_SD], [ID_QL], [ID_DV], [ID_NV], [Soluong], [DonGia], [GhiChu]) VALUES (1, 1, 6, 3, 5, 15000, NULL)
INSERT [dbo].[SuDungDichVu] ([ID_SD], [ID_QL], [ID_DV], [ID_NV], [Soluong], [DonGia], [GhiChu]) VALUES (2, 1, 5, 2, 4, 30000, NULL)
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (1, N'101', 12, 1, N'good', N'123456')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (2, N'101', 13, 1, N'good', N'123445')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (3, N'101', 14, 1, N'good', N'123558')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (4, N'102', 12, 1, NULL, N'25356')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (5, N'102', 13, 1, NULL, N'564666')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (6, N'102', 14, 1, NULL, N'546985')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (7, N'103', 12, 1, N'bảo trì', N'546489')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (8, N'103', 13, 1, NULL, NULL)
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (9, N'103', 14, 1, N'good', N'5431231')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (10, N'104', 13, 1, NULL, N'3214588')
INSERT [dbo].[ThietBiPhong] ([ID_TB], [MaPhong], [ID_DV], [Soluong], [TrangThai], [SerialNO]) VALUES (11, N'104', 12, 1, NULL, N'3241853')
ALTER TABLE [dbo].[DichVu] ADD  CONSTRAINT [DF_DichVu_SLDK]  DEFAULT ((0)) FOR [SLDK]
GO
ALTER TABLE [dbo].[DichVu] ADD  CONSTRAINT [DF_DichVu_GTDK]  DEFAULT ((0)) FOR [GTDK]
GO
ALTER TABLE [dbo].[LichLamViec] ADD  CONSTRAINT [DF_LichLamViec_TangCa]  DEFAULT ((0)) FOR [TangCa]
GO
ALTER TABLE [dbo].[LichLamViec] ADD  CONSTRAINT [DF_LichLamViec_GhiChu]  DEFAULT ('') FOR [GhiChu]
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_LichLamViec] FOREIGN KEY([ID_Lich])
REFERENCES [dbo].[LichLamViec] ([Id_Lich])
GO
ALTER TABLE [dbo].[ChamCong] CHECK CONSTRAINT [FK_ChamCong_LichLamViec]
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_NhanVien] FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NhanVien] ([ID_NV])
GO
ALTER TABLE [dbo].[ChamCong] CHECK CONSTRAINT [FK_ChamCong_NhanVien]
GO
ALTER TABLE [dbo].[ChungTu]  WITH CHECK ADD  CONSTRAINT [FK_ChungTu_KhachHang] FOREIGN KEY([ID_KH])
REFERENCES [dbo].[KhachHang] ([ID_KH])
GO
ALTER TABLE [dbo].[ChungTu] CHECK CONSTRAINT [FK_ChungTu_KhachHang]
GO
ALTER TABLE [dbo].[ChungTu]  WITH CHECK ADD  CONSTRAINT [FK_ChungTu_NhanVien] FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NhanVien] ([ID_NV])
GO
ALTER TABLE [dbo].[ChungTu] CHECK CONSTRAINT [FK_ChungTu_NhanVien]
GO
ALTER TABLE [dbo].[ChungTu]  WITH CHECK ADD  CONSTRAINT [FK_ChungTu_QuanLyPhong] FOREIGN KEY([ID_QL])
REFERENCES [dbo].[QuanLyPhong] ([ID_QL])
GO
ALTER TABLE [dbo].[ChungTu] CHECK CONSTRAINT [FK_ChungTu_QuanLyPhong]
GO
ALTER TABLE [dbo].[DongChungTu]  WITH CHECK ADD  CONSTRAINT [FK_DongChungTu_ChungTu] FOREIGN KEY([SoCT])
REFERENCES [dbo].[ChungTu] ([SoCT])
GO
ALTER TABLE [dbo].[DongChungTu] CHECK CONSTRAINT [FK_DongChungTu_ChungTu]
GO
ALTER TABLE [dbo].[DongChungTu]  WITH CHECK ADD  CONSTRAINT [FK_DongChungTu_DichVu] FOREIGN KEY([ID_DV])
REFERENCES [dbo].[DichVu] ([ID_DV])
GO
ALTER TABLE [dbo].[DongChungTu] CHECK CONSTRAINT [FK_DongChungTu_DichVu]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Doan] FOREIGN KEY([ID_Doan])
REFERENCES [dbo].[Doan] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_Doan]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_CaLamViec] FOREIGN KEY([ID_Ca])
REFERENCES [dbo].[CaLamViec] ([ID_Ca])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_CaLamViec]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_NhanVien] FOREIGN KEY([Id_NV])
REFERENCES [dbo].[NhanVien] ([ID_NV])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_NhanVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([ID_Loai])
REFERENCES [dbo].[LoaiPhong] ([ID_Loai])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[QuanLyPhong]  WITH CHECK ADD  CONSTRAINT [FK_QuanLyPhong_Dangky] FOREIGN KEY([ID_DK])
REFERENCES [dbo].[Dangky] ([ID_DK])
GO
ALTER TABLE [dbo].[QuanLyPhong] CHECK CONSTRAINT [FK_QuanLyPhong_Dangky]
GO
ALTER TABLE [dbo].[QuanLyPhong]  WITH CHECK ADD  CONSTRAINT [FK_QuanLyPhong_KhachHang] FOREIGN KEY([ID_KH])
REFERENCES [dbo].[KhachHang] ([ID_KH])
GO
ALTER TABLE [dbo].[QuanLyPhong] CHECK CONSTRAINT [FK_QuanLyPhong_KhachHang]
GO
ALTER TABLE [dbo].[QuanLyPhong]  WITH CHECK ADD  CONSTRAINT [FK_QuanLyPhong_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[QuanLyPhong] CHECK CONSTRAINT [FK_QuanLyPhong_Phong]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_SuDungDichVu_DichVu] FOREIGN KEY([ID_DV])
REFERENCES [dbo].[DichVu] ([ID_DV])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_SuDungDichVu_DichVu]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_SuDungDichVu_NhanVien] FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NhanVien] ([ID_NV])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_SuDungDichVu_NhanVien]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_SuDungDichVu_QuanLyPhong] FOREIGN KEY([ID_QL])
REFERENCES [dbo].[QuanLyPhong] ([ID_QL])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_SuDungDichVu_QuanLyPhong]
GO
ALTER TABLE [dbo].[ThietBiPhong]  WITH CHECK ADD  CONSTRAINT [FK_ThietBiPhong_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[ThietBiPhong] CHECK CONSTRAINT [FK_ThietBiPhong_Phong]
GO
