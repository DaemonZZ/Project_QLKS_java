package the.hotel;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JLabel;
import javax.swing.JTabbedPane;
import javax.swing.JLayeredPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JTable;

import java.awt.Font;
import java.awt.Color;

public class MainForm extends JFrame {
	public static MainForm m;
	private JTextField textField;
	private JTextField textField_1;
	private JTable table;
	private JTextField txtTenKH;
	private JTextField txtCI;
	private JTextField txtCO;
	private JTextField txtPhong;
	private JButton btn001,btn101,btn102,btn103,btn104,btn105,btn106,btn107,btn108,btn109,btn110,btn111,btn112,btn201,btn202,btn203,btn204,btn205,
					btn206,btn207,btn208,btn209,btn210,btn211,btn212,btn301,btn302,btn303,btn304,btn305,btn306,btn307,btn308,btn309,btn310,btn311,btn312;
	public MainForm(int accessRight) {
		m=this;
		getContentPane().setFont(new Font("Tahoma", Font.BOLD, 11));
		setTitle("Quản lý Khách Sạn");
		setSize(1120, 665);
		getContentPane().setLayout(null);
		JMenuBar menuBar = new JMenuBar();
		menuBar.setBounds(0, 0, 1102, 22);
		getContentPane().add(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenu mnQuanLy = new JMenu("Quản Lý");
		menuBar.add(mnQuanLy);
		
		JMenu mnThongKe = new JMenu("Thống Kê");
		menuBar.add(mnThongKe);
		
		JMenu mnBaoCao = new JMenu("Báo Cáo");
		menuBar.add(mnBaoCao);
		
		JMenu mnTienIch = new JMenu("Tiện Ích");
		menuBar.add(mnTienIch);
		
		JMenu mnAbout = new JMenu("About");
		menuBar.add(mnAbout);
		
		JButton btnDangXuat = new JButton("Đăng Xuất");
		btnDangXuat.setBounds(10, 33, 65, 65);
		btnDangXuat.setToolTipText("Đăng Xuất");
		getContentPane().add(btnDangXuat);
		
		JButton btnNewJButton_1 = new JButton("New JButton");
		btnNewJButton_1.setBounds(85, 33, 65, 65);
		getContentPane().add(btnNewJButton_1);
		
		JButton btnNewJButton_2 = new JButton("New JButton");
		btnNewJButton_2.setBounds(160, 33, 65, 65);
		getContentPane().add(btnNewJButton_2);
		
		JButton btnNewJButton_3 = new JButton("New JButton");
		btnNewJButton_3.setBounds(235, 33, 65, 65);
		getContentPane().add(btnNewJButton_3);
		
		JButton btnNewJButton_4 = new JButton("New JButton");
		btnNewJButton_4.setBounds(310, 33, 65, 65);
		getContentPane().add(btnNewJButton_4);
		
		JButton btnNewJButton_5 = new JButton("New JButton");
		btnNewJButton_5.setBounds(385, 33, 65, 65);
		getContentPane().add(btnNewJButton_5);
		
		JButton btnClose = new JButton("Đóng");
		btnClose.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		btnClose.setBounds(460, 33, 65, 65);
		getContentPane().add(btnClose);
		
		JLabel lblNewLabel = new JLabel("Sơ Đồ");
		lblNewLabel.setBounds(37, 107, 46, 14);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 13));
		getContentPane().add(lblNewLabel);
		
		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		tabbedPane.setBounds(10, 132, 677, 457);
		getContentPane().add(tabbedPane);
		
		JLayeredPane layeredPane_3 = new JLayeredPane();
		tabbedPane.addTab("Sảnh", null, layeredPane_3, null);
		
		 btn001 = new JButton("001");
		btn001.setBounds(291, 11, 342, 388);
		layeredPane_3.add(btn001);
		
		JLayeredPane layeredPane = new JLayeredPane();
		tabbedPane.addTab("Tầng 1", null, layeredPane, null);
		
		 btn101 = new JButton("101");
		btn101.setBounds(10, 75, 89, 76);
		layeredPane.add(btn101);
		
		 btn102 = new JButton("102");
		btn102.setBounds(109, 75, 89, 76);
		layeredPane.add(btn102);
		
		 btn103 = new JButton("103");
		btn103.setBounds(211, 75, 89, 76);
		layeredPane.add(btn103);
		
		 btn104 = new JButton("104");
		btn104.setBounds(310, 75, 57, 76);
		layeredPane.add(btn104);
		
		 btn105 = new JButton("105");
		btn105.setBounds(473, 75, 57, 76);
		layeredPane.add(btn105);
		
		 btn106 = new JButton("106");
		btn106.setBounds(540, 75, 57, 76);
		layeredPane.add(btn106);
		
		 btn112 = new JButton("112");
		btn112.setBounds(10, 222, 162, 76);
		layeredPane.add(btn112);
		
		 btn111 = new JButton("111");
		btn111.setBounds(182, 222, 57, 76);
		layeredPane.add(btn111);
		
		 btn110 = new JButton("110");
		btn110.setBounds(249, 222, 57, 76);
		layeredPane.add(btn110);
		
		 btn109 = new JButton("109");
		 btn109.setForeground(Color.RED);
		btn109.setBounds(316, 222, 89, 76);
		layeredPane.add(btn109);
		
		 btn108 = new JButton("108");
		 btn108.setForeground(Color.RED);
		btn108.setBounds(415, 222, 89, 76);
		layeredPane.add(btn108);
		
		 btn107 = new JButton("107");
		 btn107.setForeground(Color.RED);
		btn107.setBounds(514, 222, 57, 76);
		layeredPane.add(btn107);
		
		JLabel lblNewLabel_4 = new JLabel("Thang máy");
		lblNewLabel_4.setBounds(389, 83, 63, 61);
		layeredPane.add(lblNewLabel_4);
		
		JLabel lblNewLabel_4_1 = new JLabel("Thang bộ");
		lblNewLabel_4_1.setBounds(581, 253, 57, 14);
		layeredPane.add(lblNewLabel_4_1);
		
		JLayeredPane layeredPane_1 = new JLayeredPane();
		tabbedPane.addTab("Tầng2", null, layeredPane_1, null);
		
		 btn201 = new JButton("201");
		btn201.setBounds(10, 105, 89, 76);
		layeredPane_1.add(btn201);
		
		 btn202 = new JButton("202");
		btn202.setBounds(109, 105, 89, 76);
		layeredPane_1.add(btn202);
		
		 btn203 = new JButton("203");
		btn203.setBounds(211, 105, 89, 76);
		layeredPane_1.add(btn203);
		
		 btn204 = new JButton("204");
		btn204.setBounds(310, 105, 57, 76);
		layeredPane_1.add(btn204);
		
		 btn205 = new JButton("205");
		btn205.setBounds(473, 105, 57, 76);
		layeredPane_1.add(btn205);
		
		 btn206 = new JButton("206");
		btn206.setBounds(540, 105, 57, 76);
		layeredPane_1.add(btn206);
		
		 btn207 = new JButton("207");
		 btn207.setForeground(Color.RED);
		btn207.setBounds(514, 252, 57, 76);
		layeredPane_1.add(btn207);
		
		 btn208 = new JButton("208");
		 btn208.setForeground(Color.RED);
		btn208.setBounds(415, 252, 89, 76);
		layeredPane_1.add(btn208);
		
		 btn209 = new JButton("209");
		 btn209.setForeground(Color.RED);
		btn209.setBounds(316, 252, 89, 76);
		layeredPane_1.add(btn209);
		
		 btn210 = new JButton("210");
		btn210.setBounds(249, 252, 57, 76);
		layeredPane_1.add(btn210);
		
		 btn211 = new JButton("211");
		btn211.setBounds(182, 252, 57, 76);
		layeredPane_1.add(btn211);
		
		 btn212 = new JButton("212");
		 btn212.setForeground(Color.RED);
		btn212.setBounds(10, 252, 162, 76);
		layeredPane_1.add(btn212);
		
		JLabel lblNewLabel_4_2 = new JLabel("Thang máy");
		lblNewLabel_4_2.setBounds(390, 118, 63, 61);
		layeredPane_1.add(lblNewLabel_4_2);
		
		JLabel lblNewLabel_4_1_1 = new JLabel("Thang bộ");
		lblNewLabel_4_1_1.setBounds(582, 288, 57, 14);
		layeredPane_1.add(lblNewLabel_4_1_1);
		
		JLayeredPane layeredPane_2 = new JLayeredPane();
		tabbedPane.addTab("Tầng 3", null, layeredPane_2, null);
		
		 btn301 = new JButton("301");
		btn301.setBounds(10, 101, 89, 76);
		layeredPane_2.add(btn301);
		
		 btn302 = new JButton("302");
		btn302.setBounds(109, 101, 89, 76);
		layeredPane_2.add(btn302);
		
		 btn303 = new JButton("303");
		btn303.setBounds(211, 101, 89, 76);
		layeredPane_2.add(btn303);
		
		 btn304 = new JButton("304");
		btn304.setBounds(310, 101, 57, 76);
		layeredPane_2.add(btn304);
		
		 btn305 = new JButton("305");
		btn305.setBounds(473, 101, 57, 76);
		layeredPane_2.add(btn305);
		
		 btn306 = new JButton("306");
		btn306.setBounds(540, 101, 57, 76);
		layeredPane_2.add(btn306);
		
		 btn307 = new JButton("307");
		 btn307.setForeground(Color.RED);
		btn307.setBounds(514, 248, 57, 76);
		layeredPane_2.add(btn307);
		
		 btn308 = new JButton("308");
		 btn308.setForeground(Color.RED);
		btn308.setBounds(415, 248, 89, 76);
		layeredPane_2.add(btn308);
		
		 btn309 = new JButton("309");
		 btn309.setForeground(Color.RED);
		btn309.setBounds(316, 248, 89, 76);
		layeredPane_2.add(btn309);
		
		 btn310 = new JButton("310");
		btn310.setBounds(249, 248, 57, 76);
		layeredPane_2.add(btn310);
		
		 btn311 = new JButton("311");
		btn311.setBounds(182, 248, 57, 76);
		layeredPane_2.add(btn311);
		
		 btn312 = new JButton("312");
		btn312.setBounds(10, 248, 162, 76);
		layeredPane_2.add(btn312);
		
		JLabel lblNewLabel_4_3 = new JLabel("Thang máy");
		lblNewLabel_4_3.setBounds(389, 110, 63, 61);
		layeredPane_2.add(lblNewLabel_4_3);
		
		JLabel lblNewLabel_4_1_2 = new JLabel("Thang bộ");
		lblNewLabel_4_1_2.setBounds(581, 280, 57, 14);
		layeredPane_2.add(lblNewLabel_4_1_2);
		
		JPanel panel = new JPanel();
		panel.setBounds(697, 33, 379, 132);
		getContentPane().add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel_3 = new JLabel("Tên KH");
		lblNewLabel_3.setBounds(24, 11, 46, 14);
		panel.add(lblNewLabel_3);
		
		JLabel lblNewLabel_3_1 = new JLabel("Check In");
		lblNewLabel_3_1.setBounds(24, 49, 46, 14);
		panel.add(lblNewLabel_3_1);
		
		JLabel lblNewLabel_3_2 = new JLabel("Check out");
		lblNewLabel_3_2.setBounds(24, 89, 57, 14);
		panel.add(lblNewLabel_3_2);
		
		JLabel lblNewLabel_3_3 = new JLabel("Phòng");
		lblNewLabel_3_3.setBounds(243, 11, 46, 14);
		panel.add(lblNewLabel_3_3);
		
		txtTenKH = new JTextField();
		txtTenKH.setEnabled(false);
		txtTenKH.setBounds(80, 8, 153, 20);
		panel.add(txtTenKH);
		txtTenKH.setColumns(10);
		
		txtCI = new JTextField();
		txtCI.setEnabled(false);
		txtCI.setColumns(10);
		txtCI.setBounds(80, 46, 153, 20);
		panel.add(txtCI);
		
		txtCO = new JTextField();
		txtCO.setEnabled(false);
		txtCO.setColumns(10);
		txtCO.setBounds(80, 86, 153, 20);
		panel.add(txtCO);
		
		txtPhong = new JTextField();
		txtPhong.setEnabled(false);
		txtPhong.setColumns(10);
		txtPhong.setBounds(301, 8, 57, 20);
		panel.add(txtPhong);
		
		JButton btnChinhSua = new JButton("Chỉnh Sửa");
		btnChinhSua.setBounds(253, 45, 101, 76);
		panel.add(btnChinhSua);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(697, 187, 379, 328);
		getContentPane().add(scrollPane);
		
		table = new JTable();
		scrollPane.setViewportView(table);
		
		JButton btnTraPhong = new JButton("Trả phòng");
		btnTraPhong.setBounds(697, 523, 104, 23);
		getContentPane().add(btnTraPhong);
		
		JButton btnInHD = new JButton("In HĐ");
		btnInHD.setBounds(811, 523, 74, 23);
		btnInHD.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		getContentPane().add(btnInHD);
		
		JButton btnThemDV = new JButton("Thêm DV");
		btnThemDV.setBounds(895, 523, 89, 23);
		getContentPane().add(btnThemDV);
		
		JButton btnXoaDV = new JButton("Xóa DV");
		btnXoaDV.setBounds(994, 523, 82, 23);
		getContentPane().add(btnXoaDV);
		
		JLabel lblNewLabel_1 = new JLabel("Tổng phòng");
		lblNewLabel_1.setBounds(796, 557, 66, 14);
		getContentPane().add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("Tổng đoàn");
		lblNewLabel_2.setBounds(796, 582, 66, 14);
		getContentPane().add(lblNewLabel_2);
		
		textField = new JTextField();
		textField.setEnabled(false);
		textField.setBounds(872, 554, 204, 20);
		getContentPane().add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setEnabled(false);
		textField_1.setBounds(872, 579, 204, 20);
		textField_1.setColumns(10);
		getContentPane().add(textField_1);
		
		this.addWindowListener(new WindowAdapter() {

			@Override
			public void windowClosing(WindowEvent e) {
				// TODO Auto-generated method stub
				System.exit(0);
			}
			
		});
		
		setResizable(false);
		setLocationRelativeTo(null);
		setVisible(true);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new MainForm(0);
	}
}