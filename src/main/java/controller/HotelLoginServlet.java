package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyDao;
import dto.Hotel;

@WebServlet("/hotel-login")
public class HotelLoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("hotel-login.html").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		MyDao dao = new MyDao();

		List<Hotel> list = dao.findHotelByEmail(email);
		

		if (list.isEmpty()) {
			resp.getWriter().print("<h1 align='center' style='color:red'>Invalid Email</h1>");
			req.getRequestDispatcher("hotel-login.html").include(req, resp);
		} else if (password.equals(AES.decrypt(list.get(0).getPassword(),"123"))) {
			Hotel hotel = list.get(0);
			
			HttpSession session = req.getSession();	
			session.setAttribute("hotel", hotel);
			
			resp.getWriter().print("<h1 align='center' style='color:green'>Login Success</h1>");
			req.getRequestDispatcher("hotel-home.html").include(req, resp);
		} else {
			resp.getWriter().print("<h1 align='center' style='color:red'>Invalid Password</h1>");
			req.getRequestDispatcher("hotel-login.html").include(req, resp);
		}
	}
}
