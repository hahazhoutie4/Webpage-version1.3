<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'redirect_to_index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css" >
	.g-bd5{margin:0 0 10px;}
	.g-sd51,.g-sd52{position:relative;float:left;width:230px;margin:0 -230px 0 0;}
	.g-sd52{float:right;width:190px;margin:0 0 0 -190px;}
	.g-mn5{float:left;width:100%;}
	.g-mn5c{margin:0 200px 0 240px;}
	</style>
	<link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
  </head>
  <body>
  <!-- nec模板 -->
  <div class="g-bd5 f-cb">
    <div class="g-sd51">
        
    </div>
    <div class="g-mn5">
        <div class="g-mn5c">
          <p>
          用户未登录，页面将在2s内跳转至登录界面，点击<a href="javascript:void(0)">这里</a>立即跳转</p>
  			<%response.setHeader("refresh", "2;URL=index.jsp"); %>
        </div>
    </div>
    <div class="g-sd52">
    </div>
</div>
 
 <script >
 $(function(){
	$("a").click(function(){
	$("a").attr("href","index.jsp");
	});
 });
 </script>
 	
  </body>
</html>
