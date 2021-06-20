<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Komorebi&nbsp3C賣場</title>
    <style>
        @import url("../css/css3.css");
    </style>
</head>

<body>
    <div class="head">
        <a href="login.html"><img src="../image/login3.png" width="64" height="64"></a>
        <a href="cart.jsp"><img src="../image/cart.png" width="64" height="64"></a>
        <h2><a href="../index.html">首頁</a></h2>
        <h2><a href="../about.html">關於網站</a></h2>
        <h2><a href="../maker.html">作者介紹</a></h2>
        <h2><a href="../board.html">聯絡我們</a></h2>
    </div>
<ul>
    <h3>商品種類</h3>
    <li><a href="pc.html">桌上型電腦</a></li>
    <li><a href="nb.html">筆記型電腦</a></li>
    <li><a href="part.html">電腦零件</a></li>
    <li><a href="game.html">主機</a></li>
</ul>
    <div class="content1">
        <p><b>帳號資料</b></p> <br>
    </div>

	    <%
	  	    Class.forName("com.mysql.jdbc.Driver").newInstance();   //load MySQL driver

            String SrvName="127.0.0.1";
            //String SrvName="NAS200A33";        		
		    String url="jdbc:mysql://"+SrvName+":3306/brian?serverTimezone=UTC";

		    String user="user";
		    String password="123456";
		    Connection conn= DriverManager.getConnection(url,user,password);
		    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    String acc = request.getParameter("account");
		    //String p="game";
		    String sql="SELECT * FROM `brian`.`account` WHERE Account='"+acc+"' LIMIT 5";
		    ResultSet rs=stmt.executeQuery(sql);
		    
	    %>

        <div class="board">
            <form name="testForm" action="updatedata.jsp">

        <%
		    String pass = request.getParameter("password");
            //out.println("<p> password="+pass+"</p>");

            String sname="";
            String ssex="";
            String sbirth="";
            String sphone="";
            String saddr="";
            String spass="";

            if(rs.next())
            {
                spass=rs.getString(7);
                
                if(pass.equals(spass))
                {
                    sname=rs.getString(1);
                    ssex=rs.getString(2);
                    sbirth=rs.getString(3);
                    sphone=rs.getString(4);
                    saddr=rs.getString(5);
                }
                else acc="密碼錯誤";

            }
            else 
            {
                //out.println("account not found !");
                acc="無此帳號";
            }
        %>

                帳號:<input type="text" value="<%= acc %>" ><br><br>
                姓名:<input type="text" value="<%= sname %>" ><br><br>
                性別:<input type="radio" name="sex" value="male" checked>男生
                    <input type="radio" name="sex" value="female" />女生<br><br>

                生日:<input type="text" value="<%= sbirth %>" ><br><br>
                手機:<input type="text" value="<%= sphone %>" ><br><br>
                地址:<input type="text" value="<%= saddr %>" ><br><br>

                <!-- <input type="submit" value="修改"> -->

            </form>
        </div>


	    <%
		    // close all connection
		    rs.close();
		    stmt.close();
		    conn.close();
	    %>


    </body>

</html>