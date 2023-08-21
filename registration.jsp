<%@ page import ="java.sql.*" %>
<%
String rname = request.getParameter("rname");    
String remail = request.getParameter("remail");
String rpass = request.getParameter("rpass");
String rpass1=request.getParameter("rconfirmpass");
// out.println(rname+remail+rpass+rpass1);
if(rpass.equals(rpass1))
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Blogosphere","12345");
		PreparedStatement ps = conn.prepareStatement("insert into registration values(?,?,?)");
		ps.setString(1,rname);
		ps.setString(2,remail);
		ps.setString(3,rpass);
		int x=ps.executeUpdate();
		if(x!=0)
		{
			 response.sendRedirect("Index.html");
			}
		else
		{
			out.println("Something went wrong...");
		}
	}
	catch(Exception e)
	{
		out.println("Email id already exist");
	}
}
else
{
	out.println("Password not matched...");
}
%>