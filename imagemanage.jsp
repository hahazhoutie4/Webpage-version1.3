<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'imagemanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
		<!--css样式类-->
	<style type='text/css'>
		
	</style>
 	<!-- 自定义样式 -->
  </head>
  
  <body>
  <div class="image_manage">
  </div>
  <div class="button_delete">
  
  </div>
  <div class="button_list">
  
  </div>
  <script>
  $(function(){
  	var select;
  	var json="{";
  		$.ajax({
  			url:'<%=basePath%>ajax!scanfile',
  			method:'post',
  			data:{fileType:"image"},
  			success:function(data){
					  $(".image_manage").html(data);
					select=$(".image_manage").find("input[type='select']");	
  			},
  			error:function(){
  			alert("error!");
  			}
  		});
  	var button_delete=$("#button_delete");
  	button_delete.click(function(){
		
		
		
		
  	});
  });
  </script>
  </body>
</html>
