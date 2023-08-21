<%@ page import ="java.sql.*,java.util.*" %>
<%@ page import="java.io.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  

<%
    String remail = request.getParameter("remail");
	String rpass = request.getParameter("rpass");
	String rname = request.getParameter("rname"); 
	try
	 {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Blogosphere","12345");
		          
		String sql="select *from registration where remail='"+remail+"'";
		Statement ps = conn.createStatement();
		ResultSet rs;
		rs = ps.executeQuery(sql);

	while(rs.next())
	{
		rname = rs.getString("rname");
		rpass = rs.getString("rpass");
		remail = rs.getString("remail");
    if(rname.equals(rname) && rpass.equals(rpass) && remail.equals(remail))
	{
		session.setAttribute("rname",rname);
		session.setAttribute("remail", remail);
		out.println("Welcome " +rname);
        // out.println("<a href='logout.jsp'> Log out</a>");
		// out.println("<a href='userprofile.jsp'> Go to Profile</a>");
        response.sendRedirect("userprofile.jsp");
    } 
	else 
	{
		System.out.println("Invalid password or username");          
    }
	}
	}
	finally
	{
		System.out.println("Opps error ");
	}
	
%>