import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		try {
			
			// Database connection
			// --------------------------------------------------------------------------------------------------------
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursesdb3", "root", "password");
			
			// --------------------------------------------------------------------------------------------------------
			
			// Getting the login form data
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			
			// Fetching the user information from the users table of database
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE user_name = ? AND pass_word = ?");
			
			ps.setString(1, name);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) { // Enter into the if block if the user exist
				// Getting user's informations
				String full_name = rs.getString("full_name");
				String user_name = rs.getString("user_name");
				String user_id = rs.getString("user_id");
				
				// Storing user credentials into session
				HttpSession session = request.getSession(true);
				session.setAttribute("full_name", full_name);
				session.setAttribute("user_name", user_name);
				session.setAttribute("user_id", user_id);
				
				// Rendering pages based on user type
				switch(rs.getString("utype")) {
					case "admin": {
						System.out.println("Admin Log in");
						response.sendRedirect("Admin");
						break;
					}
					case "teacher": {
						response.sendRedirect("Teacher");
						break;
					}
					case "student": {
						response.sendRedirect("Student");
						break;
					}
				}

			} else { // User does not exist. Something went wrong
				request.setAttribute("passwordError", "Something went wrong!!! Try again.");
			    request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
