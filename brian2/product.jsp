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

    <div class="head">
        <a href="./buy/login.html"><img src="image/login3.png" width="64" height="64"></a>
        <a href="./buy/cart.jsp"><img src="image/cart.png" width="64" height="64"></a>
        <h2><a href="index.html">首頁</a></h2>
        <h2><a href="about.html">關於網站</a></h2>
        <h2><a href="maker.html">作者介紹</a></h2>
        <h2><a href="board.html">聯絡我們</a></h2>

    </div>
        <ul>
            <h3>商品種類</h3>
            <li><a href="pc.html">桌上型電腦</a></li>
            <li><a href="nb.html">筆記型電腦</a></li>
            <li><a href="part.html">電腦零件</a></li>
            <li><a href="game.html">主機</a></li>
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
		    String p = request.getParameter("product");
		    //String p="game";
		    String sql="SELECT * FROM `brian`.`PRODUCT` WHERE Catalog='"+p+"' LIMIT 200";
		    ResultSet rs=stmt.executeQuery(sql);
		    
	    %>


        <%
		    String idp = request.getParameter("id");
            out.println("<p> 目前產品 -"+p+idp+"</p>");
            int id=Integer.parseInt(idp);
		    //int id=1;

            String order="";
            if(rs.absolute(id))
            {
                out.println("<div class=\"product1\">");
                String img=rs.getString(3);
                out.println("<img src=\"image/product/"+img+"\" width=\"320\" height=\"320\"></p>");
                out.println("</div>");


                out.println("<div class=\"content1\">");
                String prod=rs.getString(4);        //product name
                String detail=rs.getString(5);      //product detail
                String description=rs.getString(6); //description
                
                out.println("<p><b>"+prod+detail+"</b> <br>");

                String[] de=description.split(";");
                for(int i=0;i<de.length;++i)
                {
                    out.println("<p><b>"+de[i]+"</b> <br>");
                }


                out.println("</div>");

                out.println("<div class=\"price\">");
                String price=rs.getString(7);   //price
                out.println("<p> 網路價 $"+price+"</p>");
                order=";"+prod+";"+price;
                    
        %>

        <form>
            <label>Amount:</label>
            <select name="amount" id="amount">
                <option value="1">1</option>    
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
			
			
        </form>
		
        <%= "<button  class=\"btna\"  onclick=\"document.location='order.jsp?product="+p+order+"&id="+id+"'\">下訂</button>"%>            

        <%
                out.println("</div>");

            }
          
        %>
<div class="review">
	<img src="image/icon5.jpg" width="150" height="150">
	<p>評語:產品品質優良，令人放心</p><p>星等:五星</p>
			<img src="image/icon6.jpg" width="150" height="150">
	<p>評語:產品作工精細，還不錯</p><p>星等:四星</p>
	<p>在此留下評價<br><textarea name="memo" cols="40" rows="4" wrap="hard"> </textarea><br>
	<label>星等:</label>
            <select name="amount" id="amount">
                <option value="1">五星</option>    
                <option value="2">四星</option>
                <option value="3">三星</option>
                <option value="4">二星</option>
				<option value="5">一星</option>
				<option value="6">負評</option>
            </select><br>
            <input type="submit" value="送出" /></p>
	</div>



	    <%
		    // close all connection
		    rs.close();
		    stmt.close();
		    conn.close();
	    %>
		
  </body>
</html>
