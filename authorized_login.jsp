<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理员账号登录界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="Administrator,account,login">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
  </head>
  <body>
  <form name="form" id="form" action="<%=basePath%>admin/adminlogin" method="post" >
	<div><label>id:</label>&nbsp;&nbsp;&nbsp;<input type="text" name="user.username" id="username" style="text-indent:0.5em;"/><br/></div>
	<div><label>password:</label><input type="password" name="user.password" id="password" style="text-indent:0.5em;"/><br/></div>
	<div class="label" style="display:none"></div>
	<div  style="position:relative;left:100px;width:20px;">
	<input type="button" value="管理员登录" id="button"/></div>
	</form>
	<script >
	$(function(){
// 	alert(navigator.userAgent);
	$("#button").click(
	function(){
	$.ajax({
	url:"<%=basePath%>ajax!adminlogin_validate",
	method:'post',
	dataType:"json",
	data:{username:$("#username").val(),password:$("#password").val()},
	success:function(data){
	$.each(data.list,function(index,value){
	alert(value.isTrue);
	if(value.isTrue=="true"){
	 $("#form").submit();	
	}else{
	$(".label").html("<p>该管理员用户不存在或者密码错误</p>").css("display","block");
	}
	})
	},
	error:function(){
	alert("error!");
	}
	});
	}
	);
	});
	</script>
<!-- 	alert("success！"); -->
<!-- 		$.each(data.list,function(index,value){ -->
<!-- 	if(value=="true"){ -->
<!-- 	$("#form").submit(); -->
<!-- 	}else{ -->
<!-- 	$(".label").html("<p>该管理员用户不存在或密码不正确</p>"); -->
<!-- 	} -->
<!-- 	}); -->
  </body>
</html>
