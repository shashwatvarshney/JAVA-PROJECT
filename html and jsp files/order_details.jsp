<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
name:<label id="nam"><%=request.getParameter("name")%></label><br>
desig:<label id="dsg"><%=request.getParameter("desig")%></label><br>
email:<label id="mail"><%=request.getParameter("email")%></label><br><br>
<h1><b><u>Your Order</u></b></h1>
<form id="form" method="post" action="placeorder">
category: <label id="cat"><%=request.getParameter("category")%></label><br>
item name: <label id="itmnam"><%=request.getParameter("item_name")%></label><br>
quantity: <label id="qty"><%=request.getParameter("qty")%></label><br>
address: <label id="add"><%=request.getParameter("address")%></label><br>
price: <label id="amt"></label><br>
<a href="order.jsp?name=<%=request.getParameter("name")%>&desig=<%=request.getParameter("desig")%>&email=<%=request.getParameter("email")%>" class="btn btn-primary" role="button" aria-pressed="true">Go Back</a>
<!--<button type="submit" onclick="back()" class="btn btn-primary">Go Back</button>&nbsp;&nbsp;-->
&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-primary">Place Order</button>

<input type="hidden" name="name" id="name">
<input type="hidden" name="designation" id="designation">
<input type="hidden" name="email" id="email">
<input type="hidden" name="category" id="category">
<input type="hidden" name="item_name" id="item_name">
<input type="hidden" name="quantity" id="quantity">
<input type="hidden" name="address" id="address">
<input type="hidden" name="price" id="price">
</form>

<script>
//alert("in");
	document.getElementById("name").value = document.getElementById("nam").innerHTML;
	document.getElementById("designation").value = document.getElementById("dsg").innerHTML;
	document.getElementById("email").value = document.getElementById("mail").innerHTML;
	document.getElementById("category").value = document.getElementById("cat").innerHTML;
	document.getElementById("item_name").value = document.getElementById("itmnam").innerHTML;
	document.getElementById("quantity").value = document.getElementById("qty").innerHTML;
	document.getElementById("address").value = document.getElementById("add").innerHTML;
	
	var Veg_meal=60;
	var Veg_Biryani=70;
	var Paneer_Paratha=30;
	var Aalo_Paratha=20;
	var Chola_Bhatora=70;
	var Egg_Meal=80;
	var Chicken_Meal=100;
	var Chicken_Biryan=100;
	var Chicken_Shwarma=60;
	var Chicken_Roll=50;
	var Egg_Roll=40;
	var Momos=40;
	var Noodles=50;
	var Honey_Chilli_Potato=50;
	var Gobi_Manchurain=30;
	var Fried_Rice=60;
	var Rasgula=10;
	var Gulab_jamun=10;
	var Gajar_Halwa=30;
	var Dry_Fruits_Kheer=30;
	var Ice_Cream=25;
	var Cheese_Cake=40;
	
	//alert(document.getElementById("item_name").value+" "+document.getElementById("quantity").value);
	document.getElementById("amt").innerHTML = 50 * document.getElementById("quantity").value;
	//alert(document.getElementById("amt").innerHTML);
	document.getElementById("price").value = document.getElementById("amt").innerHTML;

//alert(document.getElementById("name").value+" "+document.getElementById("designation").value+" "+
//document.getElementById("email").value+" "+document.getElementById("category").value+" "+ 
//document.getElementById("item_name").value+" "+document.getElementById("quantity").value+" "+
//document.getElementById("address").value+" "+document.getElementById("price").value)
//alert("out");

//function back()
//{
//	alert("in function");
//	var name=document.getElementById("name").value;
//	var email=document.getElementById("email").value;
//	var desig=document.getElementById("designation").value;
//	alert(name+" "+email+" "+desig);
//	document.getElementById("form").action="order.jsp?name="+name+"&desig="+desig+"&email="+email;
	//document.getElementById("form").action="order.jsp?name=${name}&desig=${desig}&email=${email}";
//	alert("out");
//}
//function order()
//{
//	document.getElementById("form").action="placeorder";
//}
//alert("out");
</script>
</body>
</html>