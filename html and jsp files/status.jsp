<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Status</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<%@page import="java.sql.*,java.io.IOException,
javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,java.io.*" %>
<table class="table">
<tr>
<th>Category</th>
<th>Item Name</th>
<th>Quantity</th>
<th>Address</th>
<th>Price</th>
<th>Status</th>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","abhi@123");
	Statement smt=con.createStatement();
	String query="select category,item_name,quantity,address,price,status from orders where email='"+request.getParameter("gmail")+"';";
	ResultSet rs=smt.executeQuery(query);
	String status;
	while(rs.next())
	{
		if(rs.getString(6).equalsIgnoreCase("accept"))
			status="table-secondary";
			//status="bg-success";
		else if(rs.getString(6).equalsIgnoreCase("reject"))
			status="table-danger";
			//status="bg-danger";
		else
			status="table-warning";
			//status="bg-primary";
			//status="table-secondary";
	%>
		<tr class=<%=status%>>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getInt(5) %></td>
			<td><%=rs.getString(6) %></td>
		</tr>
<%		
	}%>
	</table>
<%
rs.close();
smt.close();
con.close();
}
catch(SQLException e)
{
	System.out.println(e);
}
%>
</body>
</html>
