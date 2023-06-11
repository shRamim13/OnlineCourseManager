import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class User
 */
@WebServlet("/User")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	// Database url
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/coursesdb3";
	
	// Database Credentials
	static final String USER = "root";
	static final String PASSWORD = "password";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// Getting user's information from session
		String user_name = (String)request.getSession(false).getAttribute("user_name");
		String full_name = (String)request.getSession(false).getAttribute("full_name");
		
		
		try {
			// checking the session is valid or not
			if (user_name == null) {
				response.sendRedirect("login.jsp");
				return;
			}
			
			// Database Connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			
			// Fetching course informations
			String sql = "SELECT user_name, utype, user_id FROM users";
			PreparedStatement ps = con.prepareStatement(sql);

			// Storing course information
			List<String[]> courseData = new ArrayList<String[]>();

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			    String username = rs.getString("user_name");
			    String utype = rs.getString("utype");
			    String userid = rs.getString("user_id");

			    String[] arr = {username, utype, userid};
			    courseData.add(arr);
			}

			rs.close();
			con.close();
			// passing data to user.jsp page
			request.setAttribute("user_name", user_name);
			request.setAttribute("full_name", full_name);
			request.setAttribute("courses", courseData);
			request.getRequestDispatcher("user.jsp").forward(request, response);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		// response.sendRedirect("LoginServlet");
	}

}