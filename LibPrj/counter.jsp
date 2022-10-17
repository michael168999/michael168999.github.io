<%@ page contentType="text/html" %>​

<%@page pageEncoding="UTF-8"%>​

<html>​

<head><title>訪客計數器init</title>​

</head>​
<body>​
<%
int counter=0;
//application.setAttribute("counter","1000");

String strNo = (String)application.getAttribute("counter");
if(strNo == null )
	strNo="0";//application無counter變數，表所有人第一次連線
counter = Integer.parseInt(strNo);
counter++;
strNo = String.valueOf(counter);
application.setAttribute("counter",strNo);
%>
<h3>您是第<%=counter%>位貴客！</h3>​

</body>​

</html>​