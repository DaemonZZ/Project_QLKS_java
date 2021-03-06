package the.DTO;

import the.Model.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class DatabaseConnection {
    protected Connection conn;

    public Connection getConn() {
        return conn;
    }
    /*
     * Đổi Tên instance và tên CSDL trước khi sử dụng
     *
     * */


    public DatabaseConnection() {
        try {

            String dbURL = "jdbc:sqlserver://localhost\\Thang;user=sa;password=123;database=QuanLyKS";

            conn = DriverManager.getConnection(dbURL);
            if (conn != null) {
                System.out.println("Connected");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * Lấy Danh sách nhân viên
     */
    public ArrayList<NhanVien> getListNV() {
        String sql = "select * from NhanVien";
        ArrayList<NhanVien> list = new ArrayList<NhanVien>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                NhanVien a = new NhanVien();
                a.setiD(rs.getInt(1));
                a.setHoTen(rs.getString(2) != null ? rs.getString(2) : "");
                a.setSoDT(rs.getString(3) != null ? rs.getString(3) : "");
                a.setTaiKhoan(rs.getString(4) != null ? rs.getString(4) : "");
                a.setMatKhau(rs.getString(5));
                a.setLoai(rs.getInt(6));
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<NhanVien> getListNV(String ten, int bp) {
        String Strten = " Hoten like N'%" + ten + "%' ";
        String Strbp = " Loai = " + bp;
        String sql = "select * from NhanVien where ";
        if (ten != "" && bp != 0) sql = sql + Strten + " and " + Strbp;
        else if (ten != "") sql = sql + Strten;
        else if (bp != 0) sql = sql + Strbp;
        ArrayList<NhanVien> list = new ArrayList<NhanVien>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                NhanVien a = new NhanVien();
                a.setiD(rs.getInt(1));
                a.setHoTen(rs.getString(2) != null ? rs.getString(2) : "");
                a.setSoDT(rs.getString(3) != null ? rs.getString(3) : "");
                a.setTaiKhoan(rs.getString(4) != null ? rs.getString(4) : "");
                a.setMatKhau(rs.getString(5));
                a.setLoai(rs.getInt(6));
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /*
     * Lấy thông tin NV từ Id
     */
    public NhanVien getNV(int id) {
        NhanVien nv = new NhanVien();
        String sql = "select ID_NV,HoTen,TaiKhoan,Loai from nhanVien where id_nv =" + id;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                nv = new NhanVien(rs.getInt(1), rs.getNString(2), rs.getNString(3), rs.getInt(4));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return nv;
    }

    public boolean xoaNV(int id) {
        String sql = "delete from NhanVien where ID_NV='" + id + "'";
        boolean b = false;
        try {
            Statement st = conn.createStatement();
            b = (st.executeUpdate(sql) > 0);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return b;
    }

    public boolean themNV(NhanVien n) {
        boolean b = false;
        String sql = "insert into NhanVien(ID_NV,HoTen,DienThoai,TaiKhoan,MatKhau,Loai) values(?,?,?,?,?,?)";
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement(sql);
            st.setInt(1, n.getiD());
            st.setNString(2, n.getHoTen());
            st.setNString(3, n.getSoDT());
            st.setNString(4, n.getTaiKhoan());
            st.setNString(5, n.getMatKhau());
            st.setInt(6, n.getLoai());
            b = (st.executeUpdate() > 0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return b;
    }

    public boolean suaNV(NhanVien n) {
        boolean b = false;
        String sql = "update NhanVien set Hoten=?, DienThoai=?, TaiKhoan=?,MatKhau=?,Loai=? where ID_NV=?";
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement(sql);
            st.setInt(6, n.getiD());
            st.setNString(1, n.getHoTen());
            st.setNString(2, n.getSoDT());
            st.setNString(3, n.getTaiKhoan());
            st.setNString(4, n.getMatKhau());
            st.setInt(5, n.getLoai());
            b = (st.executeUpdate() > 0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return b;
    }

    /*
     * Lấy danh sách phòng
     */
    public ArrayList<Phong> getListPhong() {
        String sql = "select * from Phong";
        ArrayList<Phong> list = new ArrayList<Phong>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Phong a = new Phong();
                a.setMaPhong(rs.getNString(1));
                a.setTang(rs.getInt(2));
                a.setLoai(rs.getInt(3));
                a.setDonGia(rs.getFloat(4));
                a.setTrangThai(rs.getInt(5));
                a.setPhone(rs.getNString(6));
                a.setSoGiuong(rs.getInt(7));
                a.setSoNguoi(rs.getInt(8));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public float getGia(String maPhong) {
        ArrayList<Phong> list = getListPhong();
        float gia = 0;
        for (Phong p : list
        ) {
            if (p.getMaPhong().equals(maPhong)) {
                gia = p.getDonGia();
            }
        }
        return gia;
    }

    public ArrayList<QuanLyPhong> getlistAllQLP() {
        ArrayList<QuanLyPhong> list = new ArrayList<>();
        String sql = "select * from QuanLyPhong";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                QuanLyPhong q = new QuanLyPhong();
                q.setId(rs.getInt(1));
                q.setId_Dk(rs.getInt(2));
                q.setId_KH(rs.getInt(3));
                q.setMaPhong(rs.getNString(4));
                if (rs.getDate(5) != null) q.setCI(rs.getDate(5).toLocalDate());
                if (rs.getDate(6) != null) q.setCO(rs.getDate(6).toLocalDate());
                q.setGia(rs.getFloat(7));
                q.setGhiChu(rs.getNString(8));
                q.setTrangThai(rs.getInt(9));
                list.add(q);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    // Lấy thông tin phòng hiện tại
    //Bao gồm những phòng đang còn ở
    public ArrayList<QuanLyPhong> getCurrentRoomInfo() {
        String sql = "select ID_QL,QuanLyPhong.ID_DK,HoTen,QuanLyPhong.MaPhong,CheckIN,CheckOut,Gia,GhiChu,QuanLyPhong.TrangThai,Phong.TrangThai,QuanlyPhong.ID_KH "
                + "from KhachHang inner join QuanLyPhong on KhachHang.ID_KH = QuanLyPhong.ID_KH "
                + "inner join Phong on QuanLyPhong.MaPhong = Phong.MaPhong where Phong.TrangThai in (4,5) and Gia=0";
        ArrayList<QuanLyPhong> list = new ArrayList<QuanLyPhong>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt(10) == 4 || rs.getInt(10) == 5) {
                    QuanLyPhong a = new QuanLyPhong();
                    a.setId(rs.getInt(1));
                    a.setId_Dk(rs.getInt(2));
                    a.setHoTen(rs.getNString(3));
                    a.setMaPhong(rs.getString(4));
                    a.setCI(rs.getDate(5).toLocalDate());
                    if (rs.getDate(6) != null) a.setCO(rs.getDate(6).toLocalDate());
                    a.setGia(rs.getFloat(7));
                    a.setGhiChu(rs.getString(8));
                    a.setTrangThai(rs.getInt(9));
                    a.setId_KH(rs.getInt(11));
                    list.add(a);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addQLPhong(QuanLyPhong q) {
        boolean b = false;
        String sql = "insert into QuanLyPhong(ID_QL,ID_DK,ID_KH,MaPhong,CheckIn,Checkout,Gia,GhiChu,TrangThai)" +
                "  values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement p = conn.prepareStatement(sql);
            LocalDate d = q.getCI();

            p.setInt(1, q.getId());
            p.setInt(2, q.getId_Dk());
            p.setInt(3, q.getId_KH());
            p.setNString(4, q.getMaPhong());
            p.setDate(5, Date.valueOf(d));
            p.setDate(6, null);
            p.setFloat(7, q.getGia());
            p.setNString(8, q.getGhiChu());
            p.setInt(9, q.getTrangThai());

            b = p.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    /*
      // Đặt trạng thái phòng
     */
    public void setStt(String phong, int stt) {
        String sql = "update phong set TrangThai = ? where Maphong = ?";
        try {
            PreparedStatement p = conn.prepareStatement(sql);
            p.setInt(1, stt);
            p.setNString(2, phong);
            p.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    public int nextId_QL() {
        String sql = "select max(ID_QL) from QuanLyPhong";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }
    //Chung tu

    public ArrayList<ChungTu> getlistCT() {
        ArrayList<ChungTu> list = new ArrayList<>();
        String sql = "select * from ChungTu ";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                ChungTu c = new ChungTu();
                c.setSoCT(rs.getInt(1));
                if (rs.getDate(2) != null) c.setNgayCT(rs.getDate(2).toLocalDate());
                c.setLoai(rs.getInt(3));
                c.setId_KH(rs.getInt(4));
                c.setId_NV(rs.getInt(5));
                c.setNoiDung(rs.getNString(6));
                c.setGiam(rs.getFloat(7));
                c.setVAT(rs.getFloat(8));
                c.setSoHD(rs.getNString(9));
                c.setId_QL(rs.getInt(10));

                list.add(c);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public boolean addCT(ChungTu c) {
        boolean b = false;
        String sql = "insert into ChungTu(SoCT,Loai,ID_KH,ID_NV,NoiDung,Giam,VAT,SoHoaDon,ID_Ql) " +
                "values(?,?,?,?,?,?,?,?,?)";
        //NgayCT se duoc them khi thanh toan
        try {
            PreparedStatement p = conn.prepareStatement(sql);
            p.setInt(1, c.getSoCT());
            p.setInt(2, c.getLoai());
            p.setInt(3, c.getId_KH());
            p.setInt(4, c.getId_NV());
            p.setNString(5, c.getNoiDung());
            p.setFloat(6, c.getGiam());
            p.setFloat(7, c.getVAT());
            p.setNString(8, c.getSoHD());
            p.setInt(9, c.getId_QL());

            b = p.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    public void editCT(ChungTu c) {
        String sql = "update Chungtu set ngayct = ?, loai = ?, id_kh=?, id_nv=?, NoiDung=?, Giam =?,vat=?,sohoadon=?,id_ql=? where SoCT=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            if (c.getNgayCT() != null) st.setDate(1, Date.valueOf(c.getNgayCT()));
            else st.setDate(1, null);
            st.setInt(2, c.getLoai());
            st.setInt(3, c.getId_KH());
            st.setInt(4, c.getId_NV());
            st.setNString(5, c.getNoiDung());
            st.setFloat(6, c.getGiam());
            st.setFloat(7, c.getVAT());
            st.setNString(8, c.getSoHD());
            st.setInt(9, c.getId_QL());
            st.setInt(10, c.getSoCT());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int nextCT() {
        String sql = "select max(SoCT) from ChungTu";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public ArrayList<DongChungTu> getListDongChungTu() {
        String sql = "select Id,DongChungtu.SoCT,DongChungTu.ID_DV,TenDV,SoLuong,DongChungTU.DonGia,DongChungTu.GhiChu from DongChungTu join DichVu "
                + "on DichVu.ID_DV=DongChungTu.ID_DV "
                + "join ChungTu on ChungTu.SoCT=DongChungTu.SoCT ";

        ArrayList<DongChungTu> list = new ArrayList<DongChungTu>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                DongChungTu s = new DongChungTu();
                s.setId(rs.getInt(1));
                s.setSoCT(rs.getInt(2));
                s.setId_DV(rs.getInt(3));
                s.setTenDV(rs.getNString(4));
                s.setSoLuong(rs.getInt(5));
                s.setDonGia(rs.getFloat(6));
                s.setGhiChu(rs.getNString(7));

                //System.out.println(sql);
                list.add(s);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int nextDongCT() {
        String sql = "select max(ID) from DongChungTu";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    // Thêm dịch vụ phòng mặc định cho new checkin
    public boolean addDefaultRoomService(int soCT, float gia, String maPhong) {
        int id = nextDongCT();
        String sql = "insert into DongChungTu values(?,?,11,1,?,'',?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, soCT);
            st.setFloat(3, gia);
            st.setNString(4, maPhong);
            return (st.executeUpdate() > 0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }


    public ArrayList<KhachHang> getListKH() {
        String sql = "select * from KhachHang";
        ArrayList<KhachHang> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                KhachHang k = new KhachHang();
                k.setId(rs.getInt(1));
                k.setHoTen(rs.getNString(2));
                k.setGioiTinh(rs.getInt(3));
                k.setDonVi(rs.getNString(4));
                k.setcMND(rs.getNString(5));
                k.setNgayCap(rs.getNString(6));
                k.setNoiCap(rs.getNString(7));
                k.setLoai(rs.getInt(8));
                k.setQuocTich(rs.getNString(9));
                k.setIdDoan(rs.getInt(10));
                list.add(k);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    // Lấy mã khách hàng kế tiếp

    public int nextKH() {
        String sql = "select max(ID_KH) from KhachHang";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    //Thêm Khách hàng mới
    public boolean addNewKH(KhachHang k) {
        boolean b = false;
        String sql = "insert into KhachHang(ID_KH,HoTen,GioiTinh,DonVi,CMND,NgayCap,NoiCap,Loai,QuocTich,Id_Doan)" +
                "  values(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement p = conn.prepareStatement(sql);
            p.setInt(1, k.getId());
            p.setNString(2, k.getHoTen());
            p.setInt(3, k.getGioiTinh());
            p.setNString(4, k.getDonVi());
            p.setNString(5, k.getcMND());
            p.setNString(6, k.getNgayCap());
            p.setNString(7, k.getNoiCap());
            p.setInt(8, k.getLoai());
            p.setNString(9, k.getQuocTich());
            p.setInt(10, k.getIdDoan());

            b = p.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    //Sửa thông tin khách hàng
    public boolean editKH(KhachHang k) {
        boolean b = false;
        String sql = "Update KhachHang set Hoten=?, Gioitinh=?, DonVi =?,CMND=?,NgayCap=?, Noicap=?, Loai=?, QuocTich =?, id_doan=? where id_kh = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setNString(1, k.getHoTen());
            st.setInt(2, k.getGioiTinh());
            st.setNString(3, k.getDonVi());
            st.setNString(4, k.getcMND());
            st.setNString(5, k.getNgayCap());
            st.setNString(6, k.getNoiCap());
            st.setInt(7, k.getLoai());
            st.setNString(8, k.getQuocTich());
            st.setInt(9, k.getIdDoan());
            st.setInt(10, k.getId());
            b = st.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    //Xóa khách hàng
    public boolean delKH(int id) {
        boolean b = false;
        String sql = "Delete from KhachHang where id_kh=" + id;
        try {
            Statement st = conn.createStatement();
            b = st.executeUpdate(sql) > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    //Tìm kiếm theo id
    public KhachHang khachHang(int id) {
        KhachHang k = new KhachHang();
        String sql = "select * from KhachHang where ID_KH=" + id;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                k.setId(id);
                k.setHoTen(rs.getNString(2));
                k.setGioiTinh(rs.getInt(3));
                if (rs.getNString(4) != null) k.setDonVi(rs.getNString(4));
                if (rs.getNString(5) != null) k.setcMND(rs.getNString(5));
                if (rs.getNString(6) != null) k.setNgayCap(rs.getNString(6));
                if (rs.getNString(7) != null) k.setNoiCap(rs.getNString(7));
                k.setLoai(rs.getInt(8));
                if (rs.getNString(9) != null) k.setQuocTich(rs.getNString(9));
                k.setIdDoan(rs.getInt(10));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return k;
    }

    public int getSoTang() {
        String sql = "select max(Tang) from Phong";
        int count = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public ArrayList<LoaiPhong> getListLoaiPhong() {
        String sql = "select * from LoaiPhong";
        ArrayList<LoaiPhong> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                LoaiPhong l = new LoaiPhong();
                l.setId(rs.getInt(1));
                l.setTenLoai(rs.getNString(2));
                list.add(l);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public ArrayList<DichVu> getListDichVu() {
        String sql = "select * from DichVu where loai = 3";
        ArrayList<DichVu> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                DichVu dv = new DichVu();
                dv.setiD(rs.getInt(1));
                dv.setTenDV(rs.getNString(2));
                if (rs.getNString(3) != null) dv.setDonViTinh(rs.getNString(3));
                dv.setDonGIa(rs.getFloat(4));
                if (rs.getNString(5) != null) dv.setGhiChu(rs.getNString(5));
                dv.setLoai(rs.getInt(6));
                dv.setsLDK(rs.getFloat(7));
                list.add(dv);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    public ArrayList<DichVu> getListTenTB() {
        String sql = "select * from DichVu where loai = 0";
        ArrayList<DichVu> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                DichVu dv = new DichVu();
                dv.setiD(rs.getInt(1));
                dv.setTenDV(rs.getNString(2));
                if (rs.getNString(3) != null) dv.setDonViTinh(rs.getNString(3));
                dv.setDonGIa(rs.getFloat(4));
                if (rs.getNString(5) != null) dv.setGhiChu(rs.getNString(5));
                dv.setLoai(rs.getInt(6));
                dv.setsLDK(rs.getFloat(7));
                list.add(dv);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    /*
        Checkout?
        Set Trang thai: da co
        Hoan thanh thong tin bang QuanLyPhong(Checkout),DongChungTu,ChungTu
     */
    public boolean setGiaCheckout(int current_idQL, float sum) {
        boolean b = false;
        String sql = "update QuanLyPhong set Gia = " + sum + " where ID_QL = " + current_idQL;
        try {
            Statement st = conn.createStatement();
            b = (st.executeUpdate(sql) > 0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    public boolean setNgayCheckout(int current_idQL) {
        boolean b = false;
        String sql = "update QuanLyPhong set CheckOut = getdate() where ID_QL=" + current_idQL;
        try {
            Statement st = conn.createStatement();
            b = (st.executeUpdate(sql) > 0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return b;
    }

    public ArrayList<Lich> getlistLich() {
        String sql = "select * from LichLamViec where Ngay>(getdate()-2)";
        ArrayList<Lich> list = new ArrayList<Lich>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Lich l = new Lich();
                l.setId(rs.getInt(1));
                l.setNgay(rs.getDate(2).toLocalDate());
                l.setId_NV(rs.getInt(3));
                l.setId_Ca(rs.getInt(4));
                l.setTangCa(rs.getInt(5));
                l.setGhiChu(rs.getNString(6));
                list.add(l);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    public void addLich(Lich lich) {
        String sql = "insert into LichLamViec values(?,?,?,4,0,'')";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, nextIdLich());
            st.setDate(2, Date.valueOf(lich.getNgay()));
            st.setInt(3, lich.getId_NV());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int nextIdLich() {
        String sql = "select max(ID_Lich) from LichLamViec";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public CaLamViec getCaLamViec(int id) {
        CaLamViec ca = new CaLamViec();
        String sql = "select * from CaLamViec where ID_Ca =" + id;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                ca.setiD(rs.getInt(1));
                ca.setTenCa(rs.getNString(2));
                ca.setTu(rs.getTime(3).toLocalTime());
                ca.setDen(rs.getTime(4).toLocalTime());
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ca;
    }

    public static void main(String[] args) {
        new DatabaseConnection();
    }

    public void updateLich(Lich lich) {
        String sql = "update LichLamViec set ID_Ca = ? , TangCa = ? , GhiChu = ? where Id_Lich = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, lich.getId_Ca());
            st.setInt(2, lich.getTangCa());
            st.setNString(3, lich.getGhiChu());
            st.setInt(4, lich.getId());
            int a = st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public ArrayList<CaLamViec> getListCaLam() {
        String sql = "select * from CaLamViec";
        ArrayList<CaLamViec> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                CaLamViec ca = new CaLamViec();
                ca.setiD(rs.getInt(1));
                ca.setTenCa(rs.getNString(2));
                ca.setTu(rs.getTime(3).toLocalTime());
                ca.setDen(rs.getTime(4).toLocalTime());
                list.add(ca);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public boolean editRoominfo(QuanLyPhong n) {
        String sql = "update QuanLyPhong set ID_DK = ? , ID_KH=?, MaPhong=?, Checkin=?, Checkout=?, Gia=?, GhiChu=?, TrangThai=? where id_ql = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(9, n.getId());
            st.setInt(1, n.getId_Dk());
            st.setInt(2, n.getId_KH());
            st.setNString(3, n.getMaPhong());
            st.setDate(4, Date.valueOf(n.getCI()));
            if (n.getCO() != null) st.setDate(5, Date.valueOf(n.getCO()));
            else st.setDate(5, null);
            st.setFloat(6, n.getGia());
            st.setNString(7, n.getGhiChu());
            st.setInt(8, n.getTrangThai());
            return st.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean editPhong(Phong p) {
        String sql = "update Phong set tang = ?, id_loai = ?, dongia = ?, trangthai=?, Phone = ?,Giuong = ?, Nguoi=? where MaPhong = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, p.getTang());
            st.setInt(2, p.getLoai());
            st.setFloat(3, p.getDonGia());
            st.setInt(4, p.getTrangThai());
            st.setNString(5, p.getPhone());
            st.setInt(6, p.getSoGiuong());
            st.setInt(7, p.getSoNguoi());
            st.setNString(8, p.getMaPhong());
            return st.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public int nextNV() {
        String sql = "select max(ID_NV) from NhanVien";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public ArrayList<ChamCong> getlistChamCong() {
        String sql = "select * from ChamCong";
        ArrayList<ChamCong> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                ChamCong c = new ChamCong();
                c.setId(rs.getInt(1));
                c.setId_lich(rs.getInt(2));
                if (rs.getTime(3) != null) c.setVao(rs.getTime(3).toLocalTime());
                if (rs.getTime(4) != null) c.setRa(rs.getTime(4).toLocalTime());
                list.add(c);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public int nextChamCong() {
        String sql = "select max(ID) from ChamCong";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public int nextDV() {
        String sql = "select max(ID_DV) from DichVu";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public void addChamCong(ChamCong c) {
        String sql = "insert into ChamCong(ID,ID_LICH,Vao) values (?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, nextChamCong());
            st.setInt(2, c.getId_lich());
            st.setTime(3, Time.valueOf(c.getVao()));
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void editChamCong(ChamCong c) {
        String sql = "update ChamCong set Ra = ? where Id = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setTime(1, Time.valueOf(c.getRa()));
            st.setInt(2, c.getId());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int addDongCT(DongChungTu d) {
        String sql = "insert into DongChungTu values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, nextDongCT());
            st.setInt(2, d.getSoCT());
            st.setInt(3, d.getId_DV());
            st.setFloat(4, d.getSoLuong());
            st.setFloat(5, d.getDonGia());
            st.setNString(6, d.getGhiChu());
            st.setNString(7, d.getMaPhong());
            return st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return -1;
    }

    public void editDongCT(DongChungTu d) {
        String sql = "Update DongChungTu set SoCT = ?, ID_DV=?, Soluong = ?, DonGia=?, GhiChu=?,MaPhong = ? where id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, d.getSoCT());
            st.setInt(2, d.getId_DV());
            st.setFloat(3, d.getSoLuong());
            st.setFloat(4, d.getDonGia());
            st.setNString(5, d.getGhiChu());
            st.setNString(6, d.getMaPhong());
            st.setInt(7, d.getId());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void delQLP(int item) {
        String sql = "Delete from QuanLyPhong  where id_ql=" + item;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delPhong(String item) {
        String sql = "Delete from Phong where MaPhong='" + item + "'";
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delLich(Lich item) {
        String sql = "Delete from LichLamViec where id_lich=" + item.getId();
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delChamCong(ChamCong item) {
        String sql = "Delete from ChamCong where id=" + item.getId();
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delDCT(int item) {
        String sql = "Delete from DongChungTu where id=" + item;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delCT(Integer id) {
        String sql = "Delete from ChungTu where soct=" + id;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    public void delDV(Integer id) {
        String sql = "Delete from DichVu where id=" + id;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void addDV(DichVu c) {
        String sql = "insert into DichVu values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, c.getiD());
            st.setNString(2, c.getTenDV());
            st.setNString(3, c.getDonViTinh());
            st.setFloat(4, c.getDonGIa());
            st.setNString(5, c.getGhiChu());
            st.setInt(6, c.getLoai());
            st.setFloat(7, c.getsLDK());
            st.setFloat(8, c.getgTDK());

            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void editDV(DichVu c) {
        String sql = "Update DichVu set TenDV = ?, DVT=?, DonGia=?, Ghichu=?, Loai = ?,SLDK = ?,GTDK=? where id_dv = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);

            st.setNString(1, c.getTenDV());
            st.setNString(2, c.getDonViTinh());
            st.setFloat(3, c.getDonGIa());
            st.setNString(4, c.getGhiChu());
            st.setInt(5, c.getLoai());
            st.setFloat(6, c.getsLDK());
            st.setFloat(7, c.getgTDK());
            st.setInt(8, c.getiD());

            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ArrayList<Doan> getListDoan() {
        String sql = "select * from Doan";
        ArrayList<Doan> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Doan d = new Doan();
                d.setId(rs.getInt(1));
                d.setTenDoan(rs.getNString(2));
                list.add(d);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public int nextDoan() {
        String sql = "select max(ID) from Doan";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public ArrayList<DangKy> getListDangKi() {
        ArrayList<DangKy> list = new ArrayList<>();
        String sql = "select * from Dangky";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                DangKy d = new DangKy();
                d.setId(rs.getInt(1));
                d.setSoPhong(rs.getInt(2));
                if (rs.getDate(3) != null) d.setNgayDat(rs.getDate(3).toLocalDate());
                if (rs.getDate(4) != null) d.setTuNgay(rs.getDate(4).toLocalDate());
                if (rs.getDate(5) != null) d.setToiNgay(rs.getDate(5).toLocalDate());
                d.setSoKhach(rs.getInt(6));
                d.setNam(rs.getInt(7));
                d.setNu(rs.getInt(8));
                d.setTreEm(rs.getInt(9));
                d.setId_kh(rs.getInt(10));
                d.setId_nv(rs.getInt(11));
                d.setCoc(rs.getFloat(12));

                list.add(d);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public int nextID_DK() {
        String sql = "select max(ID_DK) from DangKy";
        int next = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                next = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return next + 1;
    }

    public void addDangKy(DangKy d) {
        String sql = "insert into DangKy values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, d.getId());
            st.setInt(2, d.getSoPhong());
            st.setDate(3, Date.valueOf(d.getNgayDat()));
            st.setDate(4, Date.valueOf(d.getTuNgay()));
            st.setDate(5, Date.valueOf(d.getToiNgay()));
            st.setInt(6, d.getSoKhach());
            st.setInt(7, d.getNam());
            st.setInt(8, d.getNu());
            st.setInt(9, d.getTreEm());
            st.setInt(10, d.getId_kh());
            st.setInt(11, d.getId_nv());
            st.setFloat(12, d.getCoc());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void editDangKy(DangKy d) {
        String sql = "update DangKy set SoPhong=?, NgayDat=?, TuNgay=?, Denngay=?, SoKhach=?, Nam=?, Nu=?, TreEm=?, ID_KH=?,ID_NV=?, TienCoc=? where ID_DK = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(12, d.getId());
            st.setInt(1, d.getSoPhong());
            st.setDate(2, Date.valueOf(d.getNgayDat()));
            st.setDate(3, Date.valueOf(d.getTuNgay()));
            st.setDate(4, Date.valueOf(d.getToiNgay()));
            st.setInt(5, d.getSoKhach());
            st.setInt(6, d.getNam());
            st.setInt(7, d.getNu());
            st.setInt(8, d.getTreEm());
            st.setInt(9, d.getId_kh());
            st.setInt(10, d.getId_nv());
            st.setFloat(11, d.getCoc());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delDangKy(int id) {
        String sql = "Delete from DangKy where ID_DK = " + id;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    public void delDoan(Integer id) {
        String sql = "Delete from Doan where ID = " + id;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void addDoan(Doan d) {
        String sql = "insert into Doan values (?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, d.getId());
            st.setNString(2, d.getTenDoan());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void editDoan(Doan d) {
        String sql = "update doan set TenDoan=? where id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(2, d.getId());
            st.setNString(1, d.getTenDoan());
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public ArrayList<ThietBi> getListTBP(){
        String sql = "select * from thietbiphong";
        ArrayList<ThietBi> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()){
                ThietBi tb = new ThietBi();
                tb.setId(rs.getInt(1));
                tb.setMaPhong(rs.getInt(2));
                tb.setId_dv(rs.getInt(3));
                tb.setSoluong(rs.getInt(4));
                if(rs.getNString(5)!=null) tb.setTrangthai(rs.getNString(5));
                if(rs.getNString(6)!=null) tb.setSerialNo(rs.getNString(6));
                list.add(tb);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public ArrayList<DichVu> getListHangHoa() {
        String sql = "select * from DichVu where loai = 2";
        ArrayList<DichVu> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                DichVu dv = new DichVu();
                dv.setiD(rs.getInt(1));
                dv.setTenDV(rs.getNString(2));
                if (rs.getNString(3) != null) dv.setDonViTinh(rs.getNString(3));
                dv.setDonGIa(rs.getFloat(4));
                if (rs.getNString(5) != null) dv.setGhiChu(rs.getNString(5));
                dv.setLoai(rs.getInt(6));
                dv.setsLDK(rs.getFloat(7));
                list.add(dv);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
