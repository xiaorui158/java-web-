package util;
import java.sql.*;
public class BaseDao {
	    public final static String driver = "com.mysql.jdbc.Driver";                     // ���ݿ�����
	    public final static String url    = "jdbc:mysql://localhost:3306/messageboard";   // url
	    public final static String dbName = "root";                                                               // ���ݿ��û���
	    public final static String dbPass = "1234";                                                               // ���ݿ�����
	    
	   static private Connection        conn  = null;   // ���ݿ�����
	   static private PreparedStatement pstmt = null;   // ����PreparedStatement����
	   static private ResultSet         rs    = null;   // �������������
	    /**
	     * �õ����ݿ�����
	     * @throws ClassNotFoundException
	     * @throws SQLException
	     * @return ���ݿ�����
	     */
	    public static Connection getConn() throws ClassNotFoundException, SQLException{
	        Class.forName(driver);                                     //ע������
	        return DriverManager .getConnection(url,dbName,dbPass);   //������ݿ����Ӳ�����
	    }
	    
	    /**
	     * �ͷ���Դ
	     * @param conn ���ݿ�����
	     * @param pstmt PreparedStatement����
	     * @param rs �����
	     */
	    public static void closeAll( Connection conn, PreparedStatement pstmt, ResultSet rs ) {
	        /*  ���rs���գ��ر�rs  */
	        if(rs != null){
	            try { rs.close();} catch (SQLException e) {e.printStackTrace();}
	        }
	        /*  ���pstmt���գ��ر�pstmt  */
	        if(pstmt != null){
	            try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}
	        }
	        /*  ���conn���գ��ر�conn  */
	        if(conn != null){
	            try { conn.close();} catch (SQLException e) {e.printStackTrace();}
	        }
	    }
	    public static int executeSQL(String sql,String[] param) {
	        Connection        conn  = null;
	        PreparedStatement pstmt = null;
	        int               num   = 0;
	        
	        /*  ����SQL,ִ��SQL  */
	        try {
	            conn = getConn();                              // �õ����ݿ�����
	            pstmt = conn.prepareStatement(sql);    // �õ�PreparedStatement����
	            if( param != null ) {
	                for( int i = 0; i < param.length; i++ ) {
	                    pstmt.setString(i+1, param[i]);         // ΪԤ����sql���ò���
	                }
	            }
	            num = pstmt.executeUpdate();                    // ִ��SQL���
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();                            // ����ClassNotFoundException�쳣
	        } catch (SQLException e) {
	            e.printStackTrace();                            // ����SQLException�쳣
	        } finally {
	            closeAll(conn,pstmt,null);                     // �ͷ���Դ
	        }
	        return num;
	    }
}
