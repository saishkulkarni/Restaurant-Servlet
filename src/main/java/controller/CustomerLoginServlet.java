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

@WebServlet("/customer-login")
public class CustomerLoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("customer-login.html").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String Password = req.getParameter("password");

		MyDao dao = new MyDao();

		List<Customer> list = dao.findCustomerByEmail(email);

		if (list.isEmpty()) {
			resp.getWriter()
					.print("<p align='center' style='color:red; position:relative; top:15%;'>Invalid Email</p>");
			req.getRequestDispatcher("customer-login.html").include(req, resp);
		} else if (Password.equals(AES.decrypt(list.get(0).getPassword(), "123"))) {
			req.getSession().setAttribute("customer", list.get(0));
			resp.getWriter().print("<p align='center' style='color:green;' class='fadeOut'>Login Success</p>");
			req.getRequestDispatcher("customer-home.html").include(req, resp);
		} else {
			resp.getWriter().print("<p  align='center' style='color:red;'>Invalid Password</p>");
			req.getRequestDispatcher("customer-login.html").include(req, resp);
		}
	}
}
