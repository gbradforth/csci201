import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RefreshSearch extends Thread
{
	HttpServletRequest request;
	HttpServletResponse response;
	
    public RefreshSearch(HttpServletRequest request, HttpServletResponse response)
    {
        this.request = request;
        this.response = response;
        
    }
    
    public void run() {
    	try {
			request.getRequestDispatcher("results.jsp").forward(request,response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public class Search extends Thread{
    	public Search() {
    		
    	}
    	
    	public void run() {
    		
    	}
    }


}