<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="Cache" content="no-Cache">
    <title>register page</title>
    <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
    <style type="text/css">
    .textindent{
    text-indent:2em;}
    html,body{font-size:12px}
    .button_click{
     background: none;
    border: 1px solid #96a5b4;
    border-radius: 2px;}
     .on{
     background: none;
    border: 1px solid #96a5b4;
    height: 38px;
    width: 180px;
    border-radius: 2px;}
    </style>
  </head>
  <body>
  <div class="form"  style="position:absolute;left:593px;top:185px;display:block;height:300px;width:430px;border-radius:5px;border:1px solid #96a5b4">
  <div class="head" style="height:20px;width:100%"></div>
  <form name="registervalidate" id="form" action="register_validate" method="get"> 
		  <div class="input_label" style="width:20%;height:200px;float:left">
		 			 <div class="none" style="height:10px;width:12px"></div>
		  			<div class="label" style="margin:18px 0px 0px 15px"><label>&nbsp;&nbsp;用户名:</label></div>
		  			<div class="label" style="margin:18px 0px 0px 15px"><label>&nbsp;&nbsp;密码:</label></div>
		  			<div class="label" style="margin:18px 0px 0px 15px"><label>&nbsp;&nbsp;验证码:</label></div>
		  </div>
  <div class="input_user" style="width:75%;height:470px;float:right;">
  			<div class="none" style="height:15px;width:12px"></div>
				  <div class="input_username" style="margin:10px 0px 0px 4px">
				  			<input type="text" name="user.username" id="input_in1"/>
				  </div>
		 			 <div class="input_password" style="margin:10px 0px 0px 4px"><input type="password" name="user.password" id="input_in2"/></div>
				  <div class="input_validate"> 
							  <div class="input_validatetext">
							  <input type="text"  id="text" style="margin:10px 0px 0px 4px" >
							  </div>
							<div class="input_validateImage" style="margin:2px 0px 0px 12px">
								<a href="javascript:void(0)" title="点击刷新验证码">
										<img src="manage/img.action" width=100px height=40px/>
									</a>
							</div> 
					</div>
		  </div>
		  <div class="input_button" style="position:absolute;left:140px;top:185px;display:block;">
		  			<input type="button" id="button" value="确认注册"/>
		  </div>
		</form>
	  </div>
	  <script >
	  $(function(){
	  var a=1;
	 $("#button").click(function(){
	 if($("#input_in1").val()==""){
	 alert("用户名不能为空");
	 return ;
	 };
	 if($("#input_in2").val()==""){
	 alert("密码不能为空");
	 return ;};
	 $.ajax({
	 url:"<%=path%>/ajax!validateImage",
	 data:{value:$("#text").val(),username:$("#input_in1").val(),password:$("#input_in2").val()},
	 dataType:"json",
	 method:"post",
	success:function(data,textstatus){
	$.each(data.list,function(index,value){
	if(value.isTrue=="true"){
	$("#form").submit();
	return;
	}else{
	alert(value.isTrue);
	$("#div").html("<p style='font:red;'>验证码错误</p>").css({"display":"block"});
	return;
	}
	});
	}
	 });
	 });
	 $("input").addClass("button_click");
	 $("#input_validatetext").addClass("on");
	 $(".label").css("margin","17px 0px 0px 0px");
	 $("a").bind("click",function(){
	 var a=this.a+1;
	 $("img").attr({src:"manage/img?number="+Math.random()});
	 });
	  }); 
	  </script>
  </body>
</html>
