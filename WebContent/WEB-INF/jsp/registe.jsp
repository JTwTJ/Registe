<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册页面</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
	
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
</head>
<style>
#div1{
display: none;
position: absolute;
left:30%;
top:20%;
width:600px;
height:400px;
text-align: center;
}
</style>

<script type="text/javascript">
	function checkIfExist(){
		var id = document.getElementById("id").value;
	    if(id.length != 11)
	    {
	    	document.getElementById("span01").innerHTML = "<font color='red'>账号必须为11位！</font>";
	    }
	    else{
	    	//var password = document.getElementById("password").value;
			$.ajax({
		        type:"post",
		        url:"<%=basePath%>/registe.action",
		        dataType:"json",
		        data:{"id":id},
		        
		        success:function(data){
	                var isExist = data.isExist;
	                if(isExist)
	                    //alert("用户名已经存在");
	                	document.getElementById("span01").innerHTML = "<font color='red'>用户名已存在！</font>";
	                else
	                    //alert("该用户名可以使用");
	                	document.getElementById("span01").innerHTML = "<font color='green'>用户名可用！</font>";
	                },
	            error:function(data){
	            	document.getElementById("span01").innerHTML = "<font color='red'>手机号必须为11位整数！</font>";
	            }
		    });
	    }
	}
	function checkPwd(){
		var pwd = document.getElementById("password").value;
		if(pwd.length<8||pwd.length>13)
		{
			document.getElementById("span02").innerHTML = "<font color='red'>密码必须在8到13位之间！</font>";
		}
		else{
			document.getElementById("span02").innerHTML = "<font color='green'>密码合法！</font>";
		}
	}
	function registe(){
		var id = document.getElementById("id").value;
		var password = document.getElementById("password").value;
		if(password.length<8||password.length>13)
		{
			return false;
		}
		else
		{
			$.ajax({
		        type:"post",
		        url:"<%=basePath%>/submit.action",
		        dataType:"json",
		        data:{"id":id,
		        	  "password":password
		        	 },	 
		        success:function(data){
		        	document.getElementById("div1").style.display="block";
		        	document.getElementById("open").style.display="none";
	            },
		    });
		}
	}
	function refresh(){
		document.getElementById("div1").style.display="none";
		document.getElementById("open").style.display="block";
		window.location.reload();
	}

</script>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" background="${pageContext.request.contextPath}/images/nh.jpg">
	<div ALIGN="center">
		<table border="0" width="1140px" cellspacing="0" cellpadding="0" id="table1">
			<tr>
				<td height="93"></td>
				<td></td>
			</tr>
			<tr>
				<td width="740" height="412"></td>
				<td class="login_msg" width="400" align="center">
				<!-- margin:0px auto; 控制当前标签居中 -->
					<fieldset style="width: auto; margin: 0px auto;">
						<legend>
							<font style="font-size:15px;font-weight:20" face="宋体"> 注册页面 </font>
						</legend>					
						<%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
						<form>
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
							<br /> 账&nbsp;号：<input id="id" type="text" name="id" onblur="checkIfExist()" /><span id="span01"></span><br />
							<br /> 密&nbsp;码：<input id="password" type="password" name="password" onblur="checkPwd()" /><span id="span02"></span><br />
							<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<center>
							<a href="#" class="btn btn-default btn-sm" data-toggle="modal" role="button" onclick="registe()" id="open">注册</a>
							</center>
						</form>
					</fieldset>
				</td>
			</tr>
		</table>
	</div>
	<div class="panel panel-default" id="div1" >
	<h4 class="modal-title" id="myModalLabel">注册成功</h4>
   	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="refresh()">关闭</button>
	</div>
</body>
</html>