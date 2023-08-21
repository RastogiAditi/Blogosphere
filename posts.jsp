<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
      <%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%

		String rname = request.getParameter("rname");    
		String remail = request.getParameter("remail");
		String message = request.getParameter("message");
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Blogosphere","12345");
		String q="insert into posts values(?,?,?)";
		PreparedStatement ps = conn.prepareStatement(q);
		ps.setString(1,rname);
		ps.setString(2,remail);
		ps.setString(3,message);
		ps.executeUpdate();
		%>
		<script>
		window.alert("Post Successfully !");
		window.location.href="userprofile.jsp";
		</script>
		<%
		}
	catch(Exception e)
	{
		System.out.println("Error!!");
	}
 	
%>

