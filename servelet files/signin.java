import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signin
 */
@WebServlet("/signin")
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signin() {
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
		
		String name,desig,mail,pass;
		name=request.getParameter("name");
		desig=request.getParameter("designation");
		mail=request.getParameter("email");
		pass=request.getParameter("password");
		try
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","abhi@123");
			Statement smt=con.createStatement();	
			String query="insert into account values('"+name+"','"+desig+"','"+mail+"',"+"'"+pass+"');";
			smt.executeUpdate(query);
			RequestDispatcher rd=request.getRequestDispatcher("login.html");
			rd.include(request,response);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
	}
}
