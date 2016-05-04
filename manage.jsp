<%@ page language="java" import="java.util.*,com.zhoutong.model.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
User u=(User)session.getAttribute("userlogin");
boolean s;
String username="";
if(u==null){
s=false;
}else{
s=true;
 username=u.getUsername();
}
 %>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>
    <% if(!s){%>未登录的<%}else{ %>@<%=username%><%}; %>的信息管理页面</title>
    <script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js"></script>
    <link rel="stylesheet" href="jquery-ui-1.10.4.custom/css/base/jquery-ui-1.10.4.custom.min.css"/>
    
	<style type="text/css">
	/*表格样式*/
	html,body{
	font: 16px Georgia, "Times New Roman", Times, serif;
	}	
	table {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
	}
	table th {
	background:#b5cfd2 ;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
	}
	table td {
	background:#dcddc0 ;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
		}
	/*表格样式*/
	
	/* 三列中间自适应布局 */
	.g-bd5{margin:0 0 10px;}
	.g-sd51,.g-sd52{position:relative;float:left;width:230px;margin:0 -230px 0 0;}
	.g-sd52{float:right;width:190px;margin:0 0 0 -190px;}
	.g-mn5{float:left;width:100%;}
	.g-mn5c{margin:0 200px 0 240px;}
	ul li{
	float:left;
	}
	a[rel='infor']{
		background: #CFCFCF;
		margin-left:1px;
		height:40px;
		text-decoration:none;
	}
	a[rel='infor']:hover{
	background:linear-gradient(#CDB38B,#CD3700);
	}
	</style>
  </head>
  <body>
  <div class="g-bd5 f-cb">
    <div class="g-sd51">
    </div>
    <div class="g-mn5">
        <div class="g-mn5c">
        <div class="topbar" style="background:#6ba7b7;width:100%;height:50px;">
       <a href="#"  title="返回主页"><img src="<%=basePath %>surface/img" width=50px height=50px/></a>
        </div>
        <div class="innerbar">
        <div class="top"><h1 style="align:center">楼层信息管理</h1></div>
        <div class="welcome"><%if(s){ %><p>欢迎你,@<%=username%></p></div>
        <div class="middle">
        <input type="button" value="查询工程量" id="input1"/>
        <div class="select" style="display:none">
        <div style="width:100%">
        <p>输入楼号:<select id="select_floor" style="width: 133px; ">
        <option value="1#">1#楼</option>
       		 <option value="2#">2#楼</option>
       		 <option value="3#">3#楼</option>
       	 	 <option value="4#">4#楼</option>
       		   <option value="5#">5#楼</option>
        		   <option value="6#">6#楼</option>
         			  <option value="7#">7#楼</option>
         				  	 <option value="8#">8#楼</option>
          	   					 <option value="9#">9#楼</option>
          	   						  <option value="10#">10#楼</option>
          	   				 			  <option value="11#">11#楼</option>
           	    							  <option value="12#">12#楼</option>
            	 								     <option value="13#">13#楼</option>
            	  									     <option value="14#">14#楼</option>
            	   										     <option value="车库">车库</option>
        </select><input type="button" value="确认查询" id="input_confirm" style="margin-left:20px"></p></div>
         <div style="width: 100%; "> <p>输入查询文件名:
        <select id="select_file" style="display:none; width: 107px">
        <!-- 此处放置查询文件名 -->
        </select><input type="button" value="查询钢筋" id="input_steel" style="margin-left:20px"></p></div>
        <br/>
       <div style="width: 100%; "> <p>输入查询图片名:<select id="select_image" style="display:none; height: 20px; width: 110px">
        <!-- 此处放置查询图片名 -->
        </select><input type="button" value="查询图片" id="input_image" style="margin-left:20px"></p>
        </div>
        <div style="margin:20px 80px 0px 0px">
        </div>
        <div>
        </div>
        </div>
        <!-- search开始 -->
        <div class="check" style="display:none"><p>数据加载失败!</p></div>
        <div class="label" style="display:none"><p>正在查询，请稍后...</p></div>
        <!-- 隐藏元素 -->
        <div class="hidden" style="display:none">
        </div>
        <!-- 隐藏元素 -->
        
        <div class="search" style="display:none;width:100%">
        </div>
        <!-- search结束 -->
        <div class="table_steel">
        
        <!-- steel bar gravity here -->
        </div>
        
        </div>
        <div class="bottombar">
        
        </div>
            
        </div>
    </div>
    <div class="g-sd52">
       
    </div>
</div>
</div>
  <!-- nec布局 -->
  
  <script >
  $(function(){
  
  //ajax函数体
  var ajax=function(){
  $.ajax({
  method:"post",
  url:"<%=path%>/ajax!search",
  data:{value:$("#select_floor").val()},
  success:function(data){
  		var s="<h3>楼层信息:</h3>";
		  $(".search").html(s+data).fadeIn(1000);
			$(".search").css("display","block");
	  		//显示表格
  },
  error:function(){
  alert("error");
  }
  });
  };//ajax函数体完成
  
	  $("#input1").click(function(){
	 	 $.ajax({
	 	 method:"post",
	 	 url:"<%=path%>/ajax!searchfile",
	 	 data:{},
	 	 dataType:'json',
	 	 success:function(data){
	 	 var s="";
	 	 $.each(data.list,function(index,value){
			$.each(value,function(key,val){
			 s+="<option value="+value[key]+">"+value[key]+"</option>";
			});
	 	 });
		$("#select_file").html(s).css("display","block");	 	
},
	 	 error:function(){
	 	 alert("错误!");
	 	 }
	 
	 });
	  $(".select").css("display","block");
	  });
	  
	  
	  $("#input_confirm").click(ajax);
	  $("#input_steel").click(function(){
	  $.ajax({
	  method:'post',
	  data:{name:$("#select_file").val()},
	  url:"<%=path%>/ajax!returnSteel",
	  success:function(data){
	  var s="<h3>表格信息:</h3>"
			  $(".table_steel").html(s+data);
	  },
	  error:function(){
	alert("error");	 
	 }
	  });
	  });
  });
  </script>
  <%}else{ %><a href="#">点击返回主页</a><%}; %>
        </body>
        </html>