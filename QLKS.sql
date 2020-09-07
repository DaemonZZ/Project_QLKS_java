USE [QuanLyKS]
GO
/****** Object:  Table [dbo].[ChungTu]    Script Date: 9/7/2020 9:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungTu](
	[SoCT] [nvarchar](7) NOT NULL,
	[NgayCT] [datetime] NULL,
	[Loai] [tinyint] NULL,
	[ID_KH] [int] NULL,
	[ID_NV] [int] NULL,
	[NoiDung] [nvarchar](255) NULL,
	[Giam] [float] NULL,
	[VAT] [float] NULL,
	[SoHoaDon] [nvarchar](20) NULL,
	[ID_QL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dangky]    Script Date: 9/7/2020 9:21:31 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID_DK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 9/7/2020 9:21:31 PM ******/
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
/****** Object:  Table [dbo].[DongChungTu]    Script Date: 9/7/2020 9:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongChungTu](
	[ID] [int] NOT NULL,
	[SoCT] [nvarchar](7) NULL,
	[ID_DV] [int] NULL,
	[SoLuong] [float] NULL,
	[DonGia] [float] NULL,
	[GhiChu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/7/2020 9:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [tinyint] NULL,
	[DonVi] [nvarchar](10) NULL,
	[CMND] [nvarchar](12) NULL,
	[NgayCap] [date] NULL,
	[NoiCap] [nvarchar](50) NULL,
	[Loai] [tinyint] NULL,
	[QuocTich] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_KH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 9/7/2020 9:21:31 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/7/2020 9:21:31 PM ******/
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
/****** Object:  Table [dbo].[Phong]    Script Date: 9/7/2020 9:21:31 PM ******/
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
/****** Object:  Table [dbo].[QuanLyPhong]    Script Date: 9/7/2020 9:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLyPhong](
	[ID_QL] [int] NOT NULL,
	[ID_DK] [int] NULL,
	[ID_KH] [int] NULL,
	[MaPhong] [nvarchar](10) NULL,
	[CheckIn] [date] NULL,
	[CheckOut] [date] NULL,
	[Gia] [float] NULL,
	[PhuThu] [float] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_QL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuDungDichVu]    Script Date: 9/7/2020 9:21:31 PM ******/
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
/****** Object:  Table [dbo].[ThietBiPhong]    Script Date: 9/7/2020 9:21:31 PM ******/
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
ALTER TABLE [dbo].[Dangky]  WITH CHECK ADD  CONSTRAINT [FK_Dangky_KhachHang] FOREIGN KEY([ID_KH])
REFERENCES [dbo].[KhachHang] ([ID_KH])
GO
ALTER TABLE [dbo].[Dangky] CHECK CONSTRAINT [FK_Dangky_KhachHang]
GO
ALTER TABLE [dbo].[Dangky]  WITH CHECK ADD  CONSTRAINT [FK_Dangky_NhanVien] FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NhanVien] ([ID_NV])
GO
ALTER TABLE [dbo].[Dangky] CHECK CONSTRAINT [FK_Dangky_NhanVien]
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
