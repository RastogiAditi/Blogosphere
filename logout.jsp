<%
session.setAttribute("name", null);
session.invalidate();
response.sendRedirect("Index.html");

%>
