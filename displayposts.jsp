<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
      <%@ page contentType="text/html" pageEncoding="UTF-8" %>
		<%
					  
		 String remail= request.getParameter("remail");
		 // System.out.println(remail);
				%>
				<!DOCTYPE html>
		<html>
		
		<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scale=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets">
    <link rel="shortcut icon" href="assets/favicon.jpg" type="image/x-icon">
    <title>Blogosphere</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
                        rel="stylesheet">
              <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
			   <link rel="stylesheet" href="./css/all.css">


    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">

   </head>
<style>
h3{
	color:#4285F4;
}
body{
	background-color:powerblue;
}

* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 190px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */

.card{
    width: 350px;
    height: 400px;
    box-shadow: 0 0 40px 20px rgba(0, 0, 0, 0.26);
    perspective: 1000px;
	text-align:center;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
.nav .nav-items{
    display: flex;
    margin: 0;
	float:right;
}

.nav .nav-link.nav-items {
   font-size: 9.1rem;
    position: relative;
    font-family: var(--Abel);
    font-size: 20px;
	
}

.nav .nav-items .nav-link:hover{
    background-color: var(--midnight);
}

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>
		<body>
		<!------                 NAVBAR                 ------>
		<nav class="nav">
        <div class="nav-menu flex-row">
            <div class="nav-brand">
                <img src="assets/icon.jpg" alt="Image" width="90px">
                <img src="assets/icon2.jpg" alt="Image" width="200px">

            </div>
            <div>
			<form  action="userprofile.jsp" method="post" >
                    <button type="submit" class="button">Back to Profile</button>
           	   </form>
			       </div>
        </div>
    </nav>
		<main>
		
		<div class="row">
  		 <%
		 try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Blogosphere","12345");
		          
		 String sql="select * from posts where remail='"+remail+"'";
		 Statement ps = conn.createStatement();
		 ResultSet rs;
		 rs = ps.executeQuery(sql);

	 while(rs.next()){
		
		remail = rs.getString("remail");
		if(remail.equals(remail))
	{%><div class="column">
    <div class="card">
		<h1> Blogger :<%out.println(rs.getString(1));%><h1>
		<h2> Blogger Id:<%out.println(rs.getString(2));%><h2>
		<h3><%out.println(rs.getString(3));%></h3>
		</div>
  </div>
		 <%}
		  }
		 } catch (Exception e) {
		 e.printStackTrace();
		 }
		 %>
		 </div>
		 </main>
			</body>
		</html>
		