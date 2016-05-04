<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<%@ page  import="com.zhoutong.model.User"%> 
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>index</title>
    <meta charset="UTF-8"/>
	<link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
  </head>
  <body>
  <%User u=(User)session.getAttribute("userlogin"); %>
  <%User admin=(User)session.getAttribute("adminlogin"); %>
  <div class="boot" style="margin:1px;position:absolute;left:40%;top:40%;height:72px;width:180px;flow:auto;box-shadow:1px 1px 1px 1px;">
  欢迎进入二维码管理界面,<%if(u==null&&admin==null){ %>
  <a href="manage/redirect"><abbr title="已有账号">登录</abbr></a><br/>
  <a href="register">没有账号?注册</a>
  <%}else if(u!=null){%>
  <a href="manage/manage">
  <%=u.getUsername()%></a>
  <div class="login_out"><a href="manage/login_out">退出登录</a></div>
  <%}else if(admin!=null){ %>
 <a href="admin/adminlogin_manage"><%=admin.getUsername() %></a> 
  <div class="login_out"><a href="manage/login_out">退出登录</a></div>
  <%;} %><br/>
  <div id="html"></div>
  <div class="iframe" style="width:100px,height:100px">
  <iframe id="iframe" width=100% height=100% id="frame" style="display:none;" scrolling="no">
  </iframe>
  </div>
  </div>
  
  <script >
  $(function(){
	var ajax=function(){
	$.ajax({
	url:"<%=path%>/ajax",
	data:{
	action:"validate",
	},
	dataType:"json",
	type:"post",
	cache:false,	
	complete:function(req,status){
	$("#html").html("<p>holyshit</p>");
	},
	error:function(textStatus, errorThrown) {
			alert("系统ajax交互错误: " + textStatus.status);
		},
	success:function(a){
	$.each(a.list,function(index,data){
	alert(data[index].name);	
	})},
	})};
	 });
//   $("#show").click(function(){
//   $("#iframe").attr({width:"100%",height:"100%"}).toggle(1000);
//   });
//   $("#progressbar").progressbar({
//   value:false,
//   change:function(){
//   $("#progressbar-label").text($("#progressbar").progressbar("value"));
//   },
//   complete:function(){
//   $("#progressbar-label").text("complete");
//   }
//   });
// 	function progress(){
// 	var progressbar=$("#progressbar");
// 	var val=progressbar.progressbar("value")||0;
// 	progressbar.progressbar("value",val+1);
// 	if(val<99){
// 	setTimeout(progress,100);
// 	}}
// 	setTimeout(progress,3000);//3s循环一次
 
  </script>
  </body>
</html>
