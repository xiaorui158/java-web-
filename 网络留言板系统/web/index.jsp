<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,biz.*,biz.impl.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GBK");
	MessageBiz mbiz = new MessageBizImpl();
	int pageSize = 5;
	int totalpages = new MessageBizImpl().getTotalPages(pageSize);
	List mlist = new ArrayList();
	String p = request.getParameter("page");
	int np = 1;
	if (p != null && !p.equals(""))
		np = Integer.parseInt(p);
	if (np > totalpages)
		np = totalpages;
	else if (np < 1)
		np = 1;
	mlist = mbiz.turnPage(np);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>�ÿ����԰�</title>
	
  <script type="text/javascript">
	function check(){
		var author  = document.forms[0].uname.value;
		var message = document.forms[0].message.value;
		var errorMsg= "";
		if(author==""|| author=="��������������") {
			errorMsg += "���߲���Ϊ��";
		}
		if(message=="") {
			errorMsg += "\n���ݲ���Ϊ��";
		}
		if(message.length>500) {
			errorMsg += "\n���ݳ��Ȳ��ܴ���500";
		}
		if(author.length>20) {
			errorMsg += "\n���������Ȳ��ܴ���20";
		}
		if(errorMsg!=""){
			alert(errorMsg);
			return false;
		}
	}
	
	
	
	
	</script>
  <style type="text/css">
<!--
.all {
	font-family: "����";
	font-size: 12px;
	font-style: normal;
	color: #000000;
	border: 1px solid #3399FF;
}
.f {
	
	font-family: "����";
	font-size: 12px;
	font-style: normal;
	color: #000000;
}
.a1 {
	
	background-color: #3399FF;
	text-align: left;
}
-->
  </style>
</head>

	<body>
		<div align="center">
			<h3>
				�ÿ����԰�
			</h3>
		</div>
		<div>
			<%
				for (int i = 0; i < mlist.size(); i++) {
					Message message = (Message) mlist.get(i);
			%>
			<div class="all">
				<div class="a1">
					���ߣ�<%=message.getAuthor()%></div>
				<div align="right"><%=5 * (np - 1) + i + 1%>#
				</div>
				<div><%=message.getMessage()%></div>
				<div align="right">
					����ʱ�䣺<%=message.getPostTime()%></div>
			</div>
			<p>
				<%
					}
				%>
			
		</div>
		<div>
			<div align="right" style="font-size: 12px;">
				<a href="index.jsp?page=<%=np - 1%>">��һҳ</a>&nbsp;&nbsp;&nbsp;
				<a href="index.jsp?page=<%=np + 1%>">��һҳ</a>
			</div>
		</div>
		<form method="post" action="dopost.jsp" onSubmit="return check()">
			<div class="f">
				<p>
					�û���
					<input class="all" type="text" name="uname" />
				</p>
				<p>
					������Ϣ
					<label>
						<textarea class="all" name="message" rows="5" cols="55"></textarea>
					</label>
				</p>
				<p>
					<input type="submit" name="submitb" value="�ύ" />
				</p>
			</div>
		</form>
	</body>

</html>

