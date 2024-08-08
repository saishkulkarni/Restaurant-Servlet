package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Customer;
import dto.Hotel;

@WebServlet("/view-menu")
public class ViewAllHotels extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			MyDao dao = new MyDao();
			List<Hotel> hotels = dao.fetchAllHotels();
			if (hotels.isEmpty()) {
				resp.getWriter().print("<h1 align='center' style='color:red'>No Hotels Found</h1>");
				req.getRequestDispatcher("customer-home.html").include(req, resp);
			} else {
				req.setAttribute("hotels", hotels);
				req.getRequestDispatcher("view-hotels.jsp").include(req, resp);
			}
	}
}
