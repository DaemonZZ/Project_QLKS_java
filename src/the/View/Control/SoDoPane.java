package the.View.Control;import java.awt.*;import java.awt.event.*;import java.time.format.DateTimeFormatter;import java.util.ArrayList;import java.util.HashMap;import java.util.Map;import javax.swing.*;import javax.swing.table.DefaultTableModel;import the.DTO.DataStorage;import the.Model.DongChungTu;import the.Model.Phong;import the.Model.QuanLyPhong;import the.DTO.DatabaseConnection;import the.View.MainForm;import the.View.ProfileDialog;import the.View.RoomButton;public class SoDoPane extends JLayeredPane {	private ArrayList<Phong> listPhong = DataStorage.loader.getListPhong();	private final JComboBox cbLoai;	private final JComboBox ttCb;	private final JPanel panel_1;	public static SoDoPane s;	private final JPopupMenu roomPop;	private  ArrayList<QuanLyPhong> currentRoomInfo = DataStorage.loader.getCurrentRoomInfo();	public ItemListener cbChanged = new ItemListener() {				@Override		public void itemStateChanged(ItemEvent e) {			ArrayList<Phong> Filter =filtRoom(cbLoai.getSelectedIndex(),ttCb.getSelectedIndex());			panel_1.removeAll();			panel_1.repaint();			for (Phong phong : Filter) {				RoomButton btn = new RoomButton(phong.getMaPhong(), phong.getTrangThai(), phong.getLoai(), phong.getDonGia(), 0);				btn.setPreferredSize(new Dimension(130,130));				btn.addMouseListener(roomSelection);				panel_1.add(btn);				addPopup(btn,roomPop);			}		}			};	public ArrayList<Phong> filtRoom(int iLoai, int iTT) {		ArrayList<Phong> rs = new ArrayList<Phong>();		if(iLoai==8 && iTT==6) rs = listPhong;		if(iLoai == 8 && iTT != 6) {			for (Phong phong : listPhong) {				if(phong.getTrangThai()==iTT) rs.add(phong);			}		}		if(iLoai != 8 && iTT == 6) {			for (Phong phong : listPhong) {				if(phong.getLoai()==iLoai+1) rs.add(phong);			}		}		if(iLoai != 8 && iTT != 6) {			for (Phong phong : listPhong) {				if(phong.getLoai()==iLoai+1 && phong.getTrangThai()==iTT) rs.add(phong);			}					}		return rs;	}	public SoDoPane() {		s=this;		setLayout(new BorderLayout());		JMenuBar menuBar_Sodo = new JMenuBar();		menuBar_Sodo.setBackground(Color.WHITE);		add(menuBar_Sodo,BorderLayout.NORTH);				JButton btnDK = new JButton("Đăng kí phòng");		menuBar_Sodo.add(btnDK);				JButton btnProfile = new JButton("Hồ sơ Phòng");		menuBar_Sodo.add(btnProfile);		btnProfile.addActionListener(new ActionListener() {			@Override			public void actionPerformed(ActionEvent e) {				MainForm.m.setEnabled(false);				String selected = MainForm.m.getSelectedRoom();				if(selected!=""){					new ProfileDialog(selected,0);				}				else{					new ProfileDialog();				}			}		});				JButton btnNhom = new JButton("Nhóm");		menuBar_Sodo.add(btnNhom);				JButton btnDat = new JButton("Check in");		menuBar_Sodo.add(btnDat);		btnDat.addActionListener(new ActionListener() {						@Override			public void actionPerformed(ActionEvent e) {				String phong = MainForm.m.getSelectedRoom();				boolean b = false;				for (Phong item : listPhong) {					if(phong.equals(item.getMaPhong())&&item.getTrangThai()!=0) {						b=true;					}				}				if(b) {					JOptionPane.showMessageDialog(getComponent(1), "Phòng chưa sẵn sàng");				}				else if(phong!="") {					new OrderDialog(phong);					MainForm.m.setEnabled(false);				}				else {					JOptionPane.showMessageDialog(getComponent(1), "Chọn phòng trước");				}			}		});				JPanel filterPanel = new JPanel();		filterPanel.setBackground(Color.WHITE);		FlowLayout flowLayout = (FlowLayout) filterPanel.getLayout();		flowLayout.setAlignment(FlowLayout.RIGHT);		flowLayout.setHgap(10);		menuBar_Sodo.add(filterPanel);				JLabel lblNewLabel = new JLabel("Lọc: ");		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 12));		lblNewLabel.setForeground(Color.RED);		filterPanel.add(lblNewLabel);				cbLoai = new JComboBox();		cbLoai.setModel(new DefaultComboBoxModel(new String[] {"Double", "Triple", "Family", "Double - VIP", "Triple - VIP", "Family - VIP", "Working", "Hall", "Tất cả"}));		cbLoai.setSelectedIndex(8);		filterPanel.add(cbLoai);		cbLoai.addItemListener(cbChanged);				ttCb = new JComboBox(new String[] {"Trống","Dơ","Đã Đặt","Bảo Trì","Đang Sử Dụng","Nhóm"});		ttCb.setModel(new DefaultComboBoxModel(new String[] {"Trống", "Dơ", "Đã Đặt", "Bảo Trì", "Đang Sử Dụng", "Nhóm", "Tất cả"}));		ttCb.setSelectedIndex(6);		filterPanel.add(ttCb);		ttCb.addItemListener(cbChanged);				JScrollPane scrollPaneSoDo = new JScrollPane();		add(scrollPaneSoDo,BorderLayout.CENTER);		scrollPaneSoDo.getVerticalScrollBar().setUnitIncrement(20);				 panel_1 = new JPanel();		panel_1.setBackground(Color.WHITE);		scrollPaneSoDo.setViewportView(panel_1);		panel_1.setPreferredSize(new Dimension(130*5+25,(listPhong.size()+1)*130/5+listPhong.size()+100));		panel_1.setLayout(new FlowLayout(FlowLayout.LEFT,5,5));		roomPop = new JPopupMenu();		JMenu mnTrangThai = new JMenu("Trạng thái");		JMenuItem mniGhiChu = new JMenuItem("Ghi Chú");		roomPop.add(mnTrangThai);		roomPop.add(mniGhiChu);		HashMap<Integer,JMenuItem> tt = new HashMap<>();		tt.put(0,new JMenuItem("Trống"));		tt.put(1,new JMenuItem("Dơ"));		tt.put(2,new JMenuItem("Đặt trước"));		tt.put(3,new JMenuItem("Bảo trì"));		tt.put(4,new JMenuItem("Đang sử dụng"));		tt.put(5,new JMenuItem("Đoàn"));		for (JMenuItem item: tt.values()			 ) {			mnTrangThai.add(item);			item.addActionListener(new ActionListener() {				@Override				public void actionPerformed(ActionEvent e) {					DataStorage.loader.setSttPhong(MainForm.m.getSelectedRoom(),getKey(tt,item));					reloadRoomList();				}			});		}				for (Phong phong : listPhong) {			RoomButton btn = new RoomButton(phong.getMaPhong(), phong.getTrangThai(), phong.getLoai(), phong.getDonGia(), 0);			btn.setPreferredSize(new Dimension(130,130));			btn.addMouseListener(roomSelection);			panel_1.add(btn);			addPopup(btn,roomPop);		}				setVisible(true);	}	public void reloadRoomList(){		listPhong = DataStorage.loader.getListPhong();		panel_1.removeAll();		panel_1.repaint();		for (Phong phong : listPhong) {			RoomButton btn = new RoomButton(phong.getMaPhong(), phong.getTrangThai(), phong.getLoai(), phong.getDonGia(), 0);			btn.setPreferredSize(new Dimension(130,130));			btn.addMouseListener(roomSelection);			panel_1.add(btn);			addPopup(btn,roomPop);		}	}	/**	 * Event btn chọn phòng	 * Hiển thị thông tin KH lên CustomInfoPanel	 * Hiển thị bảng dịch vụ phòng đó	 * Hiển thị tổng vào txtSum của SumPanel	 */	public  MouseListener roomSelection = new MouseListener() {		@Override		public void mouseReleased(MouseEvent e) {			// TODO Auto-generated method stub			MainForm.m.setSelectedRoom(((RoomButton)e.getComponent()).getMaPhong());		}		@Override		public void mousePressed(MouseEvent e) {			// TODO Auto-generated method stub			MainForm.m.setSelectedRoom(((RoomButton)e.getComponent()).getMaPhong());		}		@Override		public void mouseExited(MouseEvent e) {			// TODO Auto-generated method stub		}		@Override		public void mouseEntered(MouseEvent e) {			// TODO Auto-generated method stub			RoomButton btn =(RoomButton) e.getComponent();			currentRoomInfo =DataStorage.loader.getCurrentRoomInfo();			for (QuanLyPhong ql : currentRoomInfo) {				if(ql.getMaPhong().equals(btn.getMaPhong())) {					ArrayList<DongChungTu> listDongChungTu = DataStorage.loader.getListDongCT(ql.getId());					float sum=0;					for (DongChungTu item : listDongChungTu) {						sum+=(item.getDonGia()*item.getSoLuong());					}					btn.setSum(sum);					btn.setToolTipText("Tổng tiền: "+sum+"đ");				}			}		}		@Override		public void mouseClicked(MouseEvent e) {			// TODO Auto-generated method stub			reloadTable();			MainForm.m.setSelectedRoom(((RoomButton)e.getComponent()).getMaPhong());		}	};	public void reloadTable(){		currentRoomInfo =DataStorage.loader.getCurrentRoomInfo();		MainForm.m.setSum(0);		MainForm.m.getTable().setModel(new DefaultTableModel());		CustomerInfoPanel.t.getTxtPhong().setText(MainForm.m.getSelectedRoom());		CustomerInfoPanel.t.getTxtTenKH().setText("");		CustomerInfoPanel.t.getTxtCI().setText("");		CustomerInfoPanel.t.getTxtCO().setText("");		for (QuanLyPhong ql : currentRoomInfo) {			//System.out.println(ql.getId());			if(ql.getMaPhong().equals(MainForm.m.getSelectedRoom())) {				CustomerInfoPanel.t.getTxtTenKH().setText(ql.getHoTen());				CustomerInfoPanel.t.getTxtCI().setText(ql.getCI().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));				CustomerInfoPanel.t.getTxtCO().setText(ql.getCO()+"");				MainForm.m.getTable().setModel(MainForm.m.getRoomInfoModel(ql.getId()));				MainForm.m.setQl(ql);				break;			}			MainForm.m.setQl(null);		}		SumPanel.s.getTxtSum().setText(MainForm.m.getSum()+"");		//System.out.println(MainForm.m.getQl().getId());	}	private  void addPopup(Component component, final JPopupMenu popup) {		component.addMouseListener(new MouseAdapter() {			public void mousePressed(MouseEvent e) {				if (e.isPopupTrigger()) {					showMenu(e);				}				currentRoomInfo =DataStorage.loader.getCurrentRoomInfo();				MainForm.m.setSum(0);				MainForm.m.getTable().setModel(new DefaultTableModel());				MainForm.m.setSelectedRoom(((RoomButton)e.getComponent()).getMaPhong());				CustomerInfoPanel.t.getTxtPhong().setText(MainForm.m.getSelectedRoom());				CustomerInfoPanel.t.getTxtTenKH().setText("");				CustomerInfoPanel.t.getTxtCI().setText("");				CustomerInfoPanel.t.getTxtCO().setText("");				for (QuanLyPhong ql : currentRoomInfo) {					if(ql.getMaPhong().equals(MainForm.m.getSelectedRoom())) {						CustomerInfoPanel.t.getTxtTenKH().setText(ql.getHoTen());						CustomerInfoPanel.t.getTxtCI().setText(ql.getCI().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));						CustomerInfoPanel.t.getTxtCO().setText(ql.getCO()+"");						MainForm.m.getTable().setModel(MainForm.m.getRoomInfoModel(ql.getId()));					}				}				SumPanel.s.getTxtSum().setText(MainForm.m.getSum()+"");			}			public void mouseReleased(MouseEvent e) {				if (e.isPopupTrigger()) {					showMenu(e);				}			}			private void showMenu(MouseEvent e) {				popup.show(e.getComponent(), e.getX(), e.getY());			}		});	}	public  <K, V> K getKey(Map<K, V> map, V value) {		for (Map.Entry<K, V> entry : map.entrySet()) {			if (value.equals(entry.getValue())) {				return entry.getKey();			}		}		return null;	}}