package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{

	private static Connection conn = null;
	
	public static Connection getConn()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(System.getenv("DB_URL"), System.getenv("DB_USER"), System.getenv("DB_PASS"));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
}
