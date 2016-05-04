<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>authorizepage</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
	
	<style type="text/css">
	table {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;}
	table th {
	background:#b5cfd2;
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #999999;}
	table td {
	background:#dcddc0;
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #999999;}
	</style>
  </head>
  <body>
		<div class="authorize_manage">
		</div>
		<div class="button">
  		<div><input type="button" id="button_delete" value="删除用户" style="margin-left:300px;margin-top:10px;width:110px;height:40px;font-size:18px"/></div>
  		<div><input type="button" id="button_authorize" value="授权/解除授权" style="margin-left:300px;margin-top:10px;width:140px;height:40px;font-size:18px"/></div>
  	</div>
  </body>
  <script>
  $(function(){
  var json="{";
  var tr;
  var user="user";
  var checkbox;
  var error="error";
  
  //页面加载ajax开始
  	$.ajax({
  	url:"<%=basePath%>ajax!author",
  	method:"post",
	data:{},
	success:function(data){
		$(".authorize_manage").html(data);
		checkbox=$("input[type='checkbox']");
	},
	error:function(){
	alert(error);
	}
  	});
  	//页面加载ajax完
  	
  	var button1=$("#button_delete");
  	var button2=$("button_authorize");
	  button1.click(function(){
	  $(this).attr("disabled","disabled");
	  json="{";
	  user="user";
	  if(checkbox){
	  checkbox.each(function(index,value){
	 var id=$(this).attr("id");
	 user+=1;
	  	json+=($(this).is(":checked"))?("\""+user+"\""+":"+"\""+id+"\""+","):("");
		  });
	  }
	  if(json=="{"){
	  button1.removeAttr("disabled"); 
	  return false;
	  }
	  json=json+"\"data\":"+"\""+"user"+"\""+"}";
	  var user11=$.parseJSON(json);
	  $.ajax({
		url:"<%=basePath%>ajax!deleteThing",
		method:'post',
		data:user11,
		success:function(data){
		location.reload();		
		},
		error:function(){
		button1.removeAttr("disabled");
		alert("error");
		}
			  });
	});
  });
  </script>
</html>
