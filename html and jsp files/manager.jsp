<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //HTTP 1.1
//response.setHeader("Pragma","no-cache"); //HTTP 1.0
//response.setHeader("Expires","0"); //proxy server

	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("login.html");
	}
%>
<div class="alert alert-success" role="alert">
<!--Welcome <label id="nam" style="font-weight:bold">${name}</label>
&nbsp;&nbsp;&nbsp;Department <label id="dpt" style="font-weight:bold">${dept}</label>
&nbsp;&nbsp;&nbsp;Designation <label id="dsg" style="font-weight:bold">${desig}</label>
&nbsp;&nbsp;&nbsp;EmailId <label id="mail" style="font-weight:bold">${email}</label>-->
Welcome <label id="nam" style="font-weight:bold"><%=request.getParameter("name")%></label>
&nbsp;&nbsp;&nbsp;You Are <label id="dsg" style="font-weight:bold"><%=request.getParameter("desig")%></label>
&nbsp;&nbsp;&nbsp;EmailId <label id="mail" style="font-weight:bold"><%=request.getParameter("email")%></label>
<form action="logout" method="post" style="float:right"><button type="submit" class="btn btn-light">LogOut</button></form>
</div>
<%@page import="java.sql.*,java.io.IOException,
javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,java.io.*" %>

<form id="formtable" method="post" name="formtable">
<table class="table table-hover">
<tr>
<th>Sno</th>
<th>Name</th>
<th>Email</th>
<th>Category</th>
<th colspan='2'>Item Name</th>
<th colspan='2'>Quantity</th>
<th colspan='2'>Address</th>
<th colspan='2'>Price</th>
<th colspan='4'></th>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","abhi@123");
	Statement smt =con.createStatement();
	//String query="select * from leaveapp where status='processing' and dept="+"'"+request.getAttribute("dept")+"';";
	//String query="select * from orders where status='processing' and dept="+"'"+request.getParameter("dept")+"';";
	String query="select * from orders where status='processing';";
	ResultSet rs=smt.executeQuery(query);
	//response.setContentType("text/html");
	//PrintWriter ot=response.getWriter();
	//boolean b=(rs==null);
	//if(b)
	//{
	//	ot.println("<html>"
	//			+"<head><title>ERROR</title><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\"></head>"
	//			+"<body><p><b>No Leave Applications</b></p></body></html>");
	//	ot.close();
		
	//}
	//else
	//{
	while(rs.next())
	{
		int quantity,price;
		//Date from ,to;
		String email,name,category,item_name,address;
		name=rs.getString(2);
		email=rs.getString(3);
		category=rs.getString(4);
		item_name=rs.getString(5);
		quantity=rs.getInt(6);
		address=rs.getString(7);
		price=rs.getInt(8);
%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td colspan='2'><%=rs.getString(5) %></td>
			<td colspan='2'><%=rs.getInt(6) %></td>
			<td colspan='2'><%=rs.getString(7) %></td>
			<td colspan='2'><%=rs.getInt(8) %></td>
			<td><button type="submit" onclick="accept(<%=rs.getInt(1)%>)" class="btn btn-outline-success">Accept</button></td>
			<td><button type="submit" onclick="reject(<%=rs.getInt(1)%>)" class="btn btn-outline-danger">Reject</button></td>
		</tr>
<% 
} 
//}%>
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
<input type="hidden" id="name" name="name">
<input type="hidden" id="desig" name="desig">
<input type="hidden" id="email" name="email">
<input type="hidden" id="sno" name="sno">
<input type="hidden" id="btn" name="btn">
</form>
<script>
//alert("enter kiya");
var name=document.getElementById("nam").innerHTML;
var desig=document.getElementById("dsg").innerHTML;
var email=document.getElementById("mail").innerHTML;
document.getElementById("name").value=name;
//alert(document.getElementById("name").value);
document.getElementById("desig").value=desig;
//alert(document.getElementById("desig").value);
document.getElementById("email").value=email;
//alert(document.getElementById("email").value);
//alert("ho gaya");
</script>
<script>
function accept(i)
{
	var id=i;
	document.getElementById("btn").value="accept";
	//alert("button "+document.getElementById("btn").value);
	document.getElementById("sno").value=id;
	//alert("id"+document.getElementById("sno").value);
	//alert("hello");
	document.getElementById("formtable").action="result";
	//document.getElementById("formtable").action="java_project/WebContent/manager.jsp/result";
	//document.getElementById("formtable").action="doPost(HttpServletRequest request, HttpServletResponse response)";
	//alert("hello1");
}
function reject(i)
{
	var id=i;
	//var btn=document.getElementById("reject").value;
	document.getElementById("btn").value="reject";
	//alert("button "+document.getElementById("btn").value);
	document.getElementById("sno").value=id;
	//alert("id"+document.getElementById("sno").value);
	//alert("hello");
	document.getElementById("formtable").action="result";
	//document.getElementById("formtable").action="java_project/WebContent/manager.jsp/result";
	//document.getElementById("formtable").action="doPost(HttpServletRequest request, HttpServletResponse response)";
	//alert("hello1");
}
</script>
</body>
</html>