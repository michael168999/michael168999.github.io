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
    <li><a href="../pc.html">桌上型電腦</a></li>
    <li><a href="../nb.html">筆記型電腦</a></li>
    <li><a href="../part.html">電腦零件</a></li>
    <li><a href="../game.html">主機</a></li>
</ul>

    <%
	  	    Class.forName("com.mysql.jdbc.Driver").newInstance();   //load MySQL driver

            String SrvName="127.0.0.1";
            //String SrvName="NAS200A33";        		
		    String url="jdbc:mysql://"+SrvName+":3306/brian?serverTimezone=UTC";

		    String user="user";
		    String password="123456";
		    Connection conn= DriverManager.getConnection(url,user,password);
		    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    String sql="SELECT * FROM `brian`.`ORDER` LIMIT 200";
		    ResultSet rs=stmt.executeQuery(sql);
		    
	    %>

        <div class="content1">
            <p><b>購物車-您選購購的商品會在此成列</b></p> <br></br>
        </div>
        <form>
            <div class="board">
                <table style="width:100%">
                    <%
		                

                        out.println("<tr><th>商品名稱</th><th>數量</th><th>單價</th><th>小計</th><th>取消</th></tr>");                

                        


                        int total=0;
                        while(rs.next())
                        {
                            String cat=rs.getString(1);    
                            String id=rs.getString(2);
                            String product=rs.getString(3);
                            String amount=rs.getString(4);    
                            String price=rs.getString(5);

                            int stotal=Integer.parseInt(amount)*Integer.parseInt(price);
                            total=total+stotal;

                            String cc="<button onclick=\"document.location='cancelorder.jsp'\">取消</button>";

                            out.println("<tr>");          
                            out.println("<td>"+product+"</td><td>"+amount+"</td><td>"+price+"</td>"+"<td>"+stotal+"</td>"+"<td>"+cc+"</td>");                
                            out.println("</tr>");     
                        }

                        out.println("</table>");  
                        out.println("<br>總付款金額:"+total+"</br><br>");   
                        out.println("<button onclick=\"document.location='cancelorder.jsp'\">結帳</button>");   
                    %>

                    
                
            </div>
           
        </form>



	    <%
		    // close all connection
		    rs.close();
		    stmt.close();
		    conn.close();
	    %>


  
    </form>
    </body>

</html>