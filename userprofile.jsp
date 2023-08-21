<%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
        <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
            <%@ page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets">
    <link rel="shortcut icon" href="assets/favicon.jpg" type="image/x-icon">
    <title>Blogosphere</title>
                    <!-- Font Awesome Icons -->
                    <link rel="stylesheet" href="./css/all.css">


                    <!-- --------- Owl-Carousel ------------------->
                    <link rel="stylesheet" href="./css/owl.carousel.min.css">
                    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

                    <!-- ------------ AOS Library ------------------------- -->
                    <link rel="stylesheet" href="./css/aos.css">

                    <!-- Custom Style   -->
                    <link rel="stylesheet" href="./css/Style.css">
                    <!-- <link rel="stylesheet" href="./css/Style2.css"> -->

                    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
                </head>
				<style>
				
				.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 8px 27px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  opacity:0.7;
  transition: width 3s;
  cursor:pointer;
}
.button:hover{
	transition: width 3s;
	opacity:1;
}
input[type=submit]{
	width:120px;
	background-color:black;
	color: white;
}
input[type=reset]{
	width:120px;
	background-color:black;
	color: white;
}
input:hover{
	transition: width 3s;
}
	</style>
                <body>
				<!-- -----------------------------------------profile start-------------------------------------------->
                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                    <div class="container bootstrap snippets bootdey">
                        <h1> Welcome <%out.println(session.getAttribute("rname"));
                                if(session.getAttribute("remail")==null) { response.sendRedirect("login.jsp"); }%>
                        </h1>
                  <table>
                            <% try{ Class.forName("oracle.jdbc.driver.OracleDriver"); 
							Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Blogosphere","12345");
                                Statement ps=conn.createStatement(); String u1=(String)session.getAttribute("rname");
                                String s1="select *from registration Where rname='" +u1+"'"; 
								ResultSet rs=ps.executeQuery(s1); if(rs.next()) { %>
                                <div class="grid-body">
				      <ul class="nav nav-tabs">
                                        <li class="active"><form action="userprofile.jsp" method="get">
										<div ><button  class="button">Profile</button>
										 </div>
										</form></li>
                                        <li class=""><form action="displayposts.jsp" method="get" value=<% out.println(rs.getString(2));%>>
										<div ><button  class="button" name="remail" value=<% out.println(rs.getString(2));%> >Posts</button>
										 </div>
										</form></li>
                                        <li class=""><form action="logout.jsp" method="get">
										<div ><button  class="button" >LogOut</button></div>
										 </form></li>
                                    </ul> 
                                    <div class="tab-content">

                                        <!-- BEGIN PROFILE -->
                                        <div class="tab-pane active" id="profile">

                                            <hr>
										
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <p><strong>Name:</strong><i>
                                                        <% out.println(rs.getString(1));%>
                                                    </i></p>
                                                    <p><strong>E-mail :</strong><i>
                                                        <% out.println(rs.getString(2));%></i>
                                                    </p>
                                                </div>
                                            </div>
											</div>
                                        </div>
			<!-------------------------------------------profile ending-------------------------------------------------->
                                        <div class="grid profile">
                                            <form action="posts.jsp" method="post">
											    <input type="hidden" name="rname" value = <% out.println(rs.getString(1));%> >
												 <input type="hidden" name="remail" value = <% out.println(rs.getString(2));%> >
												Enter your Post here:<br>
												<textarea name="message" maxlength="200"
                                                     style="resize:none ; width: 300px; height: 200px;"></textarea><br><br>
										        <span><input type="submit" value="Post"></span>
										        <span><input type="reset" value="Reset"></span>
											</form>
									</div>								
										<% } 
										} catch (Exception e) { } %>
										
                        </table>
                </body>

                </html>