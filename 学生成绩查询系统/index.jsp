<%--
  Created by IntelliJ IDEA.
  User: 19339
  Date: 2022/5/12
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" import="java.sql.*,java.lang.*"  %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function yz() //��װһ��<body>�����ɵ���¼��ĺ���
        {
            var nn = document.getElementById("nn"); //ͨ�� id �� �ҵ� Ԫ�ز����� ��ֵ
            if(nn.value=="") //�ж�����
            {
                alert("������ѧ��"); //�����������������ʾ����
                return false;
            }
            else
            {
                alert("����ѯ���ǣ�"+nn.value)
                return true; //��������ʱ��ִ�б��� action
            }
        }
    </script>
</head>
<body>
<h1 style="text-align: center;font-family: ����" >ѧ���ɼ���ѯϵͳ</h1>
<form action="doselect.jsp" method="post" style="text-align: center">
    ѧ�ţ�<input type="text" name="xh" id="nn">&nbsp &nbsp &nbsp��Ŀ��<input type="text" name="km">&nbsp &nbsp<input
        type="submit" onclick="yz()" value="��ѯ">
    <input type="reset" value="����">
</form>
</body>
</html>
