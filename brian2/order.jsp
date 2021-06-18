<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>

<html>

  <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Komorebi&nbsp3C賣場</title>
        <style>
                @import url("css/css2.css");
        </style>
  </head>


  <body>


	    <%
	  	    Class.forName("com.mysql.jdbc.Driver").newInstance();   //load MySQL driver

            String SrvName="127.0.0.1";
            //String SrvName="NAS200A33";        		
		    String url="jdbc:mysql://"+SrvName+":3306/brian?serverTimezone=UTC&characterEncoding=utf-8";

		    String user="user";
		    String password="123456";
		    Connection conn= DriverManager.getConnection(url,user,password);
		    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			request.setCharacterEncoding("UTF-8");
		    String p = request.getParameter("product");
   			if(p!=null)
     			p = new String(p.getBytes("8859_1"),"UTF-8");

		    String idp = request.getParameter("id");

    		String[] ss=p.split(";");

			out.println("catalog:"+ss[0]+"name:"+ss[1]+"price:"+ss[2]+"-"+idp);
		   

            String sql="USE `brian`";
            stmt.execute(sql);

            //sql="INSERT INTO `order`(`Catalog`, `ProductID`, `ProductName`, `Amount`, `Price`) VALUES ('nb','1','xxxxx','1','42900')";
            sql="INSERT INTO `order`(`Catalog`, `ProductID`, `ProductName`, `Amount`, `Price`) VALUES ('"+ss[0]+"','"+idp+"','"+ss[1]+"','1','"+ss[2]+"')";

            stmt.execute(sql);
		    
	    %>

	    <%
		    // close all connection
		    //rs.close();
		    stmt.close();
		    conn.close();
	    %>

        <p><a href="index.html">已下訂成功，點此返回首頁</a></p>
  </body>
</html>
