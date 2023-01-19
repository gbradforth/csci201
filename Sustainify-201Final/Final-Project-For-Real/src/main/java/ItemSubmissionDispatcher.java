import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Util.Constant;

@WebServlet("/SubmitItem")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		  )
public class ItemSubmissionDispatcher extends HttpServlet {
	
	// for retrieving random numbers
	Random RNG = null;
	
	public void init()
	{
	}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
			// getting information from form. Pre-validated using jsp
			String itemName = request.getParameter("name");
            String desc = request.getParameter("desc");
            String image_url = "whatever";
            int userId = 1;
			try {
				 userId = Util.DatabaseStuff.getUserID("wh@brice.com");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
//			String description = request.getParameter("description");
//			Double price = Double.valueOf(request.getParameter("price"));
			Util.DatabaseStuff.insertItem(itemName, image_url, desc, userId);
			request.setAttribute("success", "nullconfirmation");
			request.getRequestDispatcher("new.jsp").forward(request, response);
			
			

			
			
			
	}
}
