<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'scanfile.jsp' starting page</title>
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
	border-collapse: collapse;
	}
	table th {
	background:#b5cfd2;
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #999999;
	}
	table td {
	background:#dcddc0;
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #999999;
		}
	</style>
  </head>
  	<body>
	<div class="framework" style="width"1100px";height:100%">
  	</div>
  	<div class="button">
  		<input type="button" id="button_delete" value="删除文件" style="float:left;margin-left:300px;margin-top:10px;width:110px;height:40px;font-size:18px"/>
  	</div>
  <script>
  $(function(){
  var json;
  var checkbox;
  var file;
  var tr;
  var button_delete=$("#button_delete");
  
  //页面ajax加载
  $.ajax({
  url:"<%=basePath%>ajax!scanfile",
  method:"post",
  data:{fileType:"file"},
  success:function(data){
	$(".framework").html(data);
		checkbox=$(".framework").find("input[type='checkbox']");
	},
  error:function(){
  	$(".framework").html("<b>加载失败</b>");
  }});
  //页面ajax加载完成
  
  
  //删除文件ajax
  button_delete.click(function(){
  	json="{";
  	file="file";
  	$(this).attr("disabled","disabled");
  	if(!checkbox){ return false ;$(this).removeAttr("disabled")};
  	checkbox.each(function(index,value){
  	file+=1;
	var id=$(this).attr("id");
		json+=($(this).is(":checked"))?("\""+file+"\""+":"+"\""+id+"\""+","):("");
	
  	});
  	if(json=="{"){return false;button_delete.removeAttr("disabled");}
  	json=json+"\"data\":"+"\""+"file"+"\""+"}";
	 var file11=$.parseJSON(json);
	 $.ajax({
	 url:"<%=basePath%>ajax!deleteThing",
	 method:"post",
	 data:file11,
	 success:function(data){
		location.reload();
	 },
	 error:function(){
			 alert("error!");
			 button_delete.removeAttr("disabled");
	 }
	 });
  	});
  	//删除文件ajax完成
  	
  });
  </script>
  </body>
</html>