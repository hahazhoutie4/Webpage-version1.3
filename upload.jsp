<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html>
  <head>
    <title>upload.html</title>
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="application/octet-stream; charset=UTF-8">
    <link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.css"/>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
	<style type="text/css">
	form {
margin-left:auto;
margin-right:auto;
max-width: 500px;
background: #F7F7F7;
padding: 25px 15px 25px 10px;
font: 16px Georgia, "Times New Roman", Times, serif;
color: #888;
text-shadow: 1px 1px 1px #FFF;
border:1px solid #E4E4E4;
}
form label {
margin-top:14px;
display: block;
font: 16px Georgia, "Times New Roman", Times, serif;
margin-left:70px;
}
form input[type="text"] {
position:relative;
margin-left:20px;
border: 1px solid #DADADA;
color: #888;
height: 30px;
margin-bottom: 16px;
margin-right: 6px;
margin-top: 2px;
outline: 0 none;
padding: 3px 3px 3px 5px;
width:300px;
font-size: 19px;
line-height:15px;
box-shadow: inset 0px 1px 4px #ECECEC;
-moz-box-shadow: inset 0px 1px 4px #ECECEC;
-webkit-box-shadow: inset 0px 1px 4px #ECECEC;
}
form input[type="button"]{
display:inline-block;
-webkit-box-sizing:content-box;
-moz-box-sizing:content-box;
box-sizing:content-box;
padding:0 12px;height:28px;
line-height:28px;border:1px solid #2d88bf;
border-radius:5px;font-size:12px;letter-spacing:1px;
text-align:center;vertical-align:middle;cursor:pointer;
word-wrap:normal;white-space:nowrap;box-shadow:inset 0 1px 0 rgba(255,255,255,0.5);
text-shadow:0 -1px rgba(0,0,0,0.2);background:-webkit-gradient(linear,0% 0%,0% 100%,from(#6dbde4),to(#399dd8));
background:-webkit-linear-gradient(#D0EEFF,#AADFFD);
background:-moz-linear-gradient(#D0EEFF,#AADFFD);
background:-ms-linear-gradient(#D0EEFF,#AADFFD);
}
	form input[type="button"]:hover{
	background:background: #AADFFD;
	}

	a{
	position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
    width:300px;
    height:30px;
    margin-left:20px;
    }
	a:hover{background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: underline;
    }
    .error{
    font:red;
    }
	</style>
  </head>
  <body>
  <div class="medium" style="margin:0px 0px 0px 80px">
  <form action="<%=basePath%>admin/upload" method="post" enctype="multipart/form-data">
  <div class="input_area" style="width: 553px; ">
  <label  style="float:left;">文件名:</label><input type="text" id="name" name="name" /><br/><br/>
  <label  style="float:left;">文件:</label>&nbsp;&nbsp;<a href="javascript:void(0)" ><input type="file"  id="file" accept="application/vnd.ms-excel,image/*" name="file"/></a>
  </div>
  <div class="input_button" style="width:257px">
  <br/>
 <input type="button" value="点击上传" id="button" style="margin-left:200px"/>
  </div>
  </form>
  <div class="label">
  <label></label>
  </div>
  </div>
  <script>
  $(function(){
	 $("#button").click(function(){
	 if(($("#file").val()!="")&&($("#name").val()!="")){
	 $("form").submit();
	 }else{
	 $("#button").addClass("error");
	 }
	 });
  });
  </script>
  </body>
</html>
