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
    <title>管理员控制页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
	<style type="text/css">
	.g-bd1{margin:0 0 10px;}
	.g-sd1{position:relative;float:left;width:190px;margin-right:-190px;}
	.g-mn1{float:right;width:100%;}
	.g-mn1c{margin-left:200px;}
	
	/*frame 样式*/
	.upload{width:1000px,height:800px};
	.image{width:800px;height:700px}
	.file{width:1100px;height:50%}
	.authorize{width:1000px;height:50%}
	
	</style>
  </head>
  <body>
		<div class="g-bd1 f-cb">
    <div class="g-sd1" style="margin:100px 10px 10px 200px;border:1px solid red">
 			<%if(session.getAttribute("adminlogin")!=null){ %>
 				<div class="user"><b>欢迎你</b>，管理员:@<%=((User)session.getAttribute("adminlogin")).getUsername()%><br/>
  		这里可以管理你的钢筋、土建预算文件。
  		</div>
    	<div class="input">
    	<ul style="list-style-type:none">
    	<li>
    	<div class="a" style="width:80px;height:20px;background:#4eb3b9">
    	<a href="javascript:void(0)" id="button_1">上传文件</a>
    	</div>
		</li>
		<li>
		<div class="a" style="width:80px;height:20px;background:#4eb3b9;display:none">
    	<a href="javascript:void(0)" id="button_2">授权管理</a>
    	</div>
		</li>
		<li>
		<div class="a" style="width:90px;height:22px;background:#4eb3b9;display:none">
    	<a href="javascript:void(0)" id="button_3">浏览文件</a>
    	</div>
    	</li>
    	<li>
    	<div class="a" style="width:80px;height:20px;background:#4eb3b9;display:none;">
    	<a href="javascript:void(0)" id="button_4">管理图片</a>
    	</div>
		</li>
		</ul>
    	</div> 	
  		<%}else{ %>
  		<div class="sign"><p>您未登录,点击</p></div>
  		<%}; %>
    	<div class="toindex">
    	<a href="<%=path %>/admin/index" id="toindex">返回主页</a>
    	</div>
    	<div class="iframe" style="display:none;">
    	<iframe width="1000px" height="700px" frameborder="0" border='0' id="frame">
    	</iframe>
    	</div>
    </div>
    <div class="g-mn1">
        <div class="g-mn1c">
        </div>
    </div>
</div>
    	<script>
    	$(function(){
    	var frame=$(window.frames["frame"].document); //获取iframe对象
    	$("#button_1").click(function(){
			$(".iframe").css("display","block").dialog({
			width:"1000px",
			title:"上传文件",
			resizable:true,
			});
			$("iframe").attr({src:"upload.jsp"}).removeClass().toggleClass("upload");
    	});
    	$("html body").css("font-size","18px");
    	$(".a").css("margin","1px 10px 1px 0px").css({width:"100px",height:"22px"});
    	$("a").css("text-decoration","none").mouseover(function(){
    	$(this).css("text-decoration","underline");
    	}).mouseleave(function(){
    	$(this).css("text-decoration","none");
    	});
    	$("#button_1").mouseover(function(){
    	$(".a").css("display","block");
    	});
    	$("#button_2").click(function(){
    	$(".iframe").css("display","block").dialog({
    		width:"1000px",
			resizable:true,
			title:"授权管理",
			});    	
    		$("iframe").attr("src","authorize.jsp").removeClass().toggleClass("authorize");
    	});
    	$("#button_3").click(function(){
    	$(".iframe").css("display","block").dialog({
    		width:"1100px",
			resizable:true,
    		title:"文件管理",
			});    	
    		$("iframe").attr("src","scanfile.jsp").removeClass().toggleClass("file");
    	});
    	$("#button_4").click(function(){
    	$(".iframe").css("display","block").dialog({
    		width:"1000px",
			resizable:true,
			title:"图片管理",
    		}); 
			$("iframe").css({width:"800px",height:"600px"});
    		$("iframe").attr("src","imagemanage.jsp").removeClass().toggleClass("image");
    	});
    	$("ul").css("list-style-image","url(img/administrator_icon.png)");
    	});
    	</script>
  </body>
</html>