package dao.impl;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;

import javax.sql.*;

import dao.MessageDao;


import util.BaseDao;

import entity.Message;

import entity.*;
public class MessageDaoImpl implements MessageDao {
	     Connection        conn  = null;   // ���ݿ�����
	     PreparedStatement pstmt = null;   // ����PreparedStatement����
	     ResultSet         rs    = null;   // �������������
	   
	    /**
	     * ����һ������
	     * @param message
	     * @return
	     */
	
	public int save(Message message){
		int result = 0;
        String sql = "insert into MESSAGE(message,author,postTime) values(?,?,?)";
        try {
            conn   = BaseDao.getConn();              // ��ȡ���ݿ�����
            pstmt  = conn.prepareStatement(sql);  // ��ȡPreparedStatement����
            pstmt.setString(1, message.getMessage());
            pstmt.setString(2, message.getAuthor());
            pstmt.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            result = pstmt.executeUpdate();       // ִ��sql
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	BaseDao.closeAll(conn, pstmt, rs);
        }
        return result;
		
	}

	public List listByPage(int page){
		 List list = new ArrayList();
	        int rowBegin = 0;                        // ��ʼ��������ʾÿҳ��һ����¼�����ݿ��е�����
	        if( page > 1 ) {
	            rowBegin =5*(page-1);            // ��ҳ��ȡ�ÿ�ʼ��������ÿҳ������ʾ5������
	        }
	        String sql = "select  *  from MESSAGE order by id limit "+rowBegin+", 5";
	        try {
	            conn  = BaseDao.getConn();              // ��ȡ���ݿ�����
	            pstmt = conn.prepareStatement(sql);  // ��ȡPreparedStatement����
	            rs    = pstmt.executeQuery();        // ִ��sqlȡ�ò�ѯ�����
	            while(rs.next()) {
	                Message message = new Message();
	                message.setId(rs.getInt("id"));
	                message.setMessage(rs.getString("message"));
	                message.setAuthor(rs.getString("author"));
	                message.setPostTime(rs.getString("postTime"));
	                list.add(message);
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally{
	        	BaseDao.closeAll(conn, pstmt, rs);
	        }
	        return list;
	}
public int delMessage(int id){
	String sql="delete from MESSAGE where id=?";
	int row=0;
	try {
        conn  = BaseDao.getConn();              // ��ȡ���ݿ�����
        pstmt = conn.prepareStatement(sql);  // ��ȡPreparedStatement����
        pstmt.setInt(1, id);
        row=pstmt.executeUpdate();
	} catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally{
    	BaseDao.closeAll(conn, pstmt, rs);
    }
    return row;
}
public int getCount(){
	String sql="select count(*) from MESSAGE";
	int count=0;
	try {
        conn  = BaseDao.getConn();              // ��ȡ���ݿ�����
        pstmt = conn.prepareStatement(sql);  // ��ȡPreparedStatement����
        rs    = pstmt.executeQuery();        // ִ��sqlȡ�ò�ѯ�����
        if(rs.next()) {
            count=rs.getInt(1);
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally{
    	BaseDao.closeAll(conn, pstmt, rs);
    }
    return count;
}
}
