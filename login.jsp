<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.zhoutong.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
    <script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
    <link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.min.css"/>
  </head>
  <body>
	<div class="form" style="position:absolute;left:200px;top:200px;box-shadow:2px 2px 2px 2px">
	<form name="form"  id="form" action="manage/login" method="post">
	<div><label>id:</label>&nbsp;&nbsp;&nbsp;<input type="text" name="user.username"  id="username" style="text-indent:0.5em;"/><br/></div>
	<div><label>password:</label><input type="password" name="user.password" id="password" style="text-indent:0.5em;"/><br/></div>
	<div class="label"><label id="label"></label></div>
	<div  style="position:relative;left:100px;width:20px;" ><input id="button" type="button" value="登录"/></div>
	</form>
	<div ><a href="authorized/authorized">管理员账号登录</a></div>
	</div>
<script>
	$(document).ready(function(){
	$("#button").bind("click",function(){
	$.ajax({
	method:"post",
	url:"<%=path%>/ajax!login",
	dataType:"json",
	data:{username:$("#username").val(),password:$("#password").val()},
	success:function(data){
	$.each(data.list,function(index,value){
	if(value.isTrue=="true"){
	$("#form").submit();
	}else{
	$("label#label").text("用户名或者密码错误!");
	}
	})	
	},
	error:function(){
	alert("error!")}
	})}
	);
	});
</script>	
  </body>
</html>
