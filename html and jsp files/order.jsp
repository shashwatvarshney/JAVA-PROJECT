<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Place Order</title>
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
<div class="alert alert-warning" role="alert">
Welcome <label id="nam" style="font-weight:bold"><%=request.getParameter("name")%></label>
&nbsp;&nbsp;&nbsp;You are <label id="dsg" style="font-weight:bold"><%=request.getParameter("desig")%></label>
&nbsp;&nbsp;&nbsp;EmailId <label id="mail" style="font-weight:bold"><%=request.getParameter("email")%></label>
<form action="logout" method="post" style="float:right"><button type="submit" class="btn btn-light">LogOut</button></form>
</div>
<form action="status.jsp" method="post"><button type="submit" class="btn btn-outline-info">
See Status of Your Orders
</button>
<!--<input type="hidden" name="gmail" value="${email}">-->
<input type="hidden" name="gmail" value="<%=request.getParameter("email")%>">
</form>

<h3>Place Your Order</h3>
<form action="order_details.jsp" method="post">

<input type="hidden" name="name" id="name">
<input type="hidden" name="desig" id="desig">
<input type="hidden" name="email" id="email">
<input type="hidden" name="item_name"id="item_name">
<b>Category</b><br>
<select name="category" id="category" onchange="select()">
	<option value="Null"></option>
	<option value="Veg">Veg</option>
	<option value="Non-veg">Non-veg</option>
	<option value="Chinese">Chinese</option>
	<option value="Desserts">Desserts</option>
</select><br><br>

<b id="NAME" style="display:none">Item Name</b>
<select id="Veg" name="Veg" style="display:none;" onchange='vau("Veg")'>
	<option value="Null"></option>
	<option value="Veg_Meal">Veg meal</option>
	<option value="Veg_Biryani">Veg Biryani</option>
	<option value="Paneer_Paratha">Paneer Paratha</option>
	<option value="Aalo_Paratha">Aalo Paratha</option>
	<option value="Chola_Bhatora">Chola Bhatora</option>
</select>

<select id="Non-veg" name="Non-veg" style="display:none;" onchange='vau("Non-veg")'>
	<option value="Null"></option>
	<option value="Egg_Meal">Egg Meal</option>
	<option value="Chicken_Meal">Chicken Meal</option>
	<option value="Chicken_Biryani">Chicken Biryani</option>
	<option value="Chicken_Shwarma">Chicken Shwarma</option>
	<option value="Chicken_Roll">Chicken Roll</option>
	<option value="Egg_Roll">Egg Roll</option>
</select>

<select id="Chinese" name="Chinese" style="display:none;" onchange='vau("Chinese")'>
	<option value="Null"></option>
	<option value="Momos">Momos</option>
	<option value="Noodles">Noodles</option>
	<option value="Honey_Chilli_Potato">Honey Chilli Potato</option>
	<option value="Gobi_Manchurain">Gobi Manchurain</option>
	<option value="Fried_Rice">Fried Rice</option>
</select>

<select id="Desserts" name="Desserts" style="display:none;" onchange='vau("Desserts")'>
	<option value="Null"></option>
	<option value="Rasgula">Rasgula</option>
	<option value="Gulab_jamun">Gulab jamun</option>
	<option value="Gajar_Halwa">Gajar Halwa</option>
	<option value="Dry_Fruits_Kheer">Dry Fruits Kheer</option>
	<option value="Ice_Cream">Ice Cream</option>
	<option value="Cheese_Cake">Cheese Cake</option>
</select>
<br>
<b>Quantity</b><br>
<input type="number" name="qty" placeholder="quantity" min="1" required><br><br>
<br>

<b>Address</b><br>
<textarea name="address" placeholder="enter your Address" rows="3" cols="50" required></textarea><br><br>
<button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>

<script>
//alert("Login Successful");
var name=document.getElementById("nam").innerHTML;
var desig=document.getElementById("dsg").innerHTML;
var email=document.getElementById("mail").innerHTML;
document.getElementById("name").value=name;
document.getElementById("desig").value=desig;
document.getElementById("email").value=email;
//alert("come out");
function select()
{
	//alert("hello");
	document.getElementById("NAME").style.display="block";
	cat=document.getElementById("category").value;
	if(cat=="Veg")
	{
		document.getElementById("Non-veg").style.display="none";
		document.getElementById("Chinese").style.display="none";
		document.getElementById("Desserts").style.display="none";
		document.getElementById(cat).style.display="block";
	}
	
	else if(cat=="Non-veg")
	{
		document.getElementById("Veg").style.display="none";
		document.getElementById("Chinese").style.display="none";
		document.getElementById("Desserts").style.display="none";
		document.getElementById(cat).style.display="block";
	}
	
	else if(cat=="Chinese")
	{
		document.getElementById("Veg").style.display="none";
		document.getElementById("Non-veg").style.display="none";
		document.getElementById("Desserts").style.display="none";
		document.getElementById(cat).style.display="block";
	}
	
	else if(cat=="Desserts")
	{
		document.getElementById("Non-veg").style.display="none";
		document.getElementById("Chinese").style.display="none";
		document.getElementById("Veg").style.display="none";
		document.getElementById(cat).style.display="block";
		
	}
	//alert("out");
	//value();
}
function vau(a)
{
	//alert("in");
	var cat=a;
	document.getElementById("item_name").value=document.getElementById(cat).value;
	//document.getElementById("item_name").value=cat
	//alert("out");
}
</script>
</html>