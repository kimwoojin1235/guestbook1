package com.javaex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.javaex.vo.guestVo;

public class guestDao {
	// 0. import java.sql.*;
		
		// db정보
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "webdb";
	private String pw = "webdb";
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
		private void getConnection() {
			try {
				// 1. JDBC 드라이버 (Oracle) 로딩
				Class.forName(driver);
				// 2. Connection 얻어오기
				conn = DriverManager.getConnection(url, id, pw);
				System.out.println("접속 성공");
			} catch (ClassNotFoundException e) {
				System.out.println("error: 드라이버 로딩 실패 - " + e);
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
		}

		// 자원 정리
		private void close() {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
		}
		//저장
		public int guestinsert(String name, String password, String content) {
			int count = 0;
			getConnection();
			try {
				// 3. SQL문 준비 / 바인딩 / 실행
				// "INSERT INTO person VALUES (seq_person_id.nextval,?,?,?)"
				String query="";
				query +=" insert into guestbook";
				query +=" values (seq_guestbook_no.nextval, ?, ?, ?, sysdate)";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, name);
				pstmt.setString(2, password);
				pstmt.setString(3, content);
				System.out.println(query);

				count = pstmt.executeUpdate();
				// 4.결과처리
				System.out.println("[DAO]: " + count + "건이 저장되었습니다.");
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
			close();
			return 0;
		}
		//삭제
		public int guestdelete(int no) {
			int count = 0;
			getConnection();
			try {
				// 3. SQL문 준비 / 바인딩 / 실행
				String query = "DELETE FROM person WHERE person_id = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, no);
				System.out.println(query);
				count = pstmt.executeUpdate();
				// 4.결과처리
				System.out.println("[DAO]: " + count + "건이 삭제되었습니다.");
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
			close();
			return count;
		}
		//리스트
		public List<guestVo> getList() {
			
			List<guestVo> gList = new ArrayList<guestVo>();
			getConnection();
			try {
				// 3. SQL문 준비 / 바인딩 / 실행
				String query="";
				query +=" select	no,";
				query +="			name,";
				query +="			password,";
				query +="			content,";
				query +="			reg_date";
				query +=" from guestbook";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();// select
				// 4.결과처리
				while (rs.next()) {

					int no = rs.getInt("no");
					String name = rs.getString("name");
					String password = rs.getString("password");
					String content = rs.getString("content");
					String regdate = rs.getString("regdate");
					guestVo gvo01 = new guestVo(no,name,password,content,regdate);
					gList.add(gvo01);

				}

			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
			close();

			return gList;

		}
		public guestVo getgusetWriting(int no) {
			
			guestVo gbVo=null;
			
			getConnection();
			
			try {		
				// 3. SQL문 준비 / 바인딩 / 실행
				String query="";
				query +=" select	no,";
				query +="			name,";
				query +="			password,";
				query +="			content,";
				query +="			reg_date";
				query +=" from guestbook";
				query +=" where no = ?";
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, no);
				
				rs = pstmt.executeQuery();
				
				// 4.결과처리
				while(rs.next()) {
									
					gbVo = new guestVo(rs.getInt("no"), rs.getString("name"), rs.getString("password"), rs.getString("content"), rs.getString("reg_date"));

				}
			} catch (SQLException e) {
			    System.out.println("error:" + e);
			}
			
			close();
			
			return gbVo;
			
		}
}
