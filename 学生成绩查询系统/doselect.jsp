<%--
  Created by IntelliJ IDEA.
  User: 19339
  Date: 2022/5/12
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" import="java.sql.*" %>
<html style="text-align: center">
<head>
    <title>Title</title>
</head>
<body>
<% request.setCharacterEncoding("GBK");
    String number=request.getParameter("xh");
    String subject=request.getParameter("km");
    Connection con=null;
    PreparedStatement pstm=null;
    ResultSet rs=null;
    if(number.equals(""))response.sendRedirect("index.jsp");//ѧ�����������δ���롣
    else{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cj","root","1234");
            String sql="select * from result where number=?";//��̬ SQL ���
            if(!(subject.equals(""))) sql=sql+" and subject=?";
            pstm=con.prepareStatement(sql);//���� pstm ����
            pstm.setInt(1,Integer.parseInt(number));//Ϊ�����þ���ֵ
            if(!(subject.equals(""))) pstm.setString(2,subject);
            rs=pstm.executeQuery();//ִ�в�ѯ
            if(rs.next()!=false){//��ѯ������
%>
<h1 style="font-family: ����">ѧ���ɼ���</h1>
<a href="index.jsp">���²�ѯ</a><br>
<table border="0" style="text-align: center;margin: auto">
    <tr><td>ѧ��</td><td>��Ŀ</td><td>�ɼ�</td>
    </tr>
    <%
        rs.beforeFirst();
        while(rs.next()){
    %>
    <tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getInt(3) %></td
    ></tr>
    <%
        }%>
</table>
<%}
else response.sendRedirect("noresult.jsp");//û��ѯ�����ݣ��� noresult ҳ��
}catch(ClassNotFoundException | SQLException e)
{e.printStackTrace();
} finally{
    if(rs!=null)rs.close();
    if(pstm!=null)pstm.close();
    if(con!=null) con.close();
}
}
%>
</body>
</html>





<%--<% request.setCharacterEncoding("GBK");--%>
<%--    String number=request.getParameter("xh");--%>
<%--    String subject=request.getParameter("km");--%>
<%--    Connection con=null;--%>
<%--    PreparedStatement pstm=null;--%>
<%--    ResultSet rs=null;--%>
<%--    if(number.equals(""))response.sendRedirect("index.jsp");//ѧ�����������δ���롣--%>
<%--    else{--%>
<%--        try{--%>
<%--            Class.forName("com.mysql.jdbc.Driver");--%>
<%--            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cj","root","123");--%>
<%--            String sql="select * from result where number=?";//��̬ SQL ���--%>
<%--            if(!(subject.equals(""))) sql=sql+" and subject=?";--%>
<%--            pstm=con.prepareStatement(sql);//���� pstm ����--%>
<%--            pstm.setInt(1,Integer.parseInt(number));//Ϊ�����þ���ֵ--%>
<%--            if(!(subject.equals(""))) pstm.setString(2,subject);--%>
<%--            rs=pstm.executeQuery();//ִ�в�ѯ--%>
<%--            if(rs.next()!=false){//��ѯ������--%>
<%--%>--%>
<%--<h1>ѧ���ɼ���</h1>--%>
<%--<a href="index.jsp">���²�ѯ</a><br>--%>
<%--<table border="0">--%>
<%--    <tr><td>ѧ��</td><td>��Ŀ</td><td>�ɼ�</td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        while(rs.next()){--%>
<%--    %>--%>
<%--    <tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getInt(3) %></td--%>
<%--    ></tr>--%>
<%--    <%--%>
<%--        }%>--%>
<%--</table>--%>
<%--<%}--%>
<%--else response.sendRedirect("noresult.jsp");//û��ѯ�����ݣ��� noresult ҳ��--%>
<%--}catch(ClassNotFoundException | SQLException e)--%>
<%--{e.printStackTrace();--%>
<%--} finally{--%>
<%--    if(rs!=null)rs.close();--%>
<%--    if(pstm!=null)pstm.close();--%>
<%--    if(con!=null) con.close();--%>
<%--}--%>
<%--}--%>
<%--%>--%>