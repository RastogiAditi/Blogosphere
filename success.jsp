<%
    if ((session.getAttribute("rname") == null) || (session.getAttribute("rname") == "")) {
%>
You are not logged in<br/>
<a href='index.html'>Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("rname")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>