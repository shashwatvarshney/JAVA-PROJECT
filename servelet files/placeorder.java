

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class placeorder
 */
@WebServlet("/placeorder")
public class placeorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public placeorder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int quantity,price;
		String name,desig,email,category,item_name,address;
		name=request.getParameter("name");
		email=request.getParameter("email");
		desig=request.getParameter("designation");
		item_name=request.getParameter("item_name");
		if(email=="")
			System.out.println("email empty");
		if(name=="")
			System.out.println("name empty");
		if(item_name=="")
			System.out.println("item_name empty");
		category=request.getParameter("category");
		quantity=Integer.parseInt(request.getParameter("quantity"));
		price=Integer.parseInt(request.getParameter("price"));
		address =request.getParameter("address");
//		System.out.println(name+" "+email+" "+item_name+" "+category+" "+quantity+" "+price+" "+address);
		try
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","abhi@123");
			Statement smt=con.createStatement();
			String query="insert into orders (name,email,category,item_name,quantity,address,price,status) values('"+name+"','"+email+"','"+category+"','"+item_name+"',"+quantity+",'"+address+"',"+price+",'processing');";
			int i=smt.executeUpdate(query);
			
			boolean b=(i==1);
			PrintWriter out=response.getWriter();
			if(b)
			{
				
//				out.println("<html>"
//						+"<head><title>Successful</title><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\"></head>"
//						+"<body><div class=\"alert alert-success\" role=\"alert\">\r\n" + 
//						"  Submitted Successfully\r\n"+
//						"</div></body></html>");
//				request.setAttribute("name",name);
//				request.setAttribute("dept",dept);
//				request.setAttribute("desig",desig);
//				request.setAttribute("email",email);
//				request.getRequestDispatcher("leave.jsp").include(request,response);
				//out.println("Order Placed Successfully");
				out.println("<html>"
						+"<head><title>Successful</title><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\"></head>"
						+"<body><b>Order Placed Successfully</b>&nbsp;<a href=\"order.jsp?name="+name+"&desig="+desig+"&email="+email+"\">Go Back</a></body></html>");
				
				//request.getRequestDispatcher("status.jsp").include(request,response);
			}
			else
			{
//				PrintWriter out=response.getWriter();
//				out.println("<html>"
//						+"<head><title>Not Successful</title><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\"></head>"
//						+"<body><div class=\"alert alert-danger\" role=\"alert\">\r\n" + 
//						"  Not Submitted Successfully\r\n" +"<a href=\"leave.jsp\">Try Again</a>"+ 
//						"</div></body></html>");
				out.println("{ERROR} Submission Unsuccessfull Try Again");
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
	}
}
