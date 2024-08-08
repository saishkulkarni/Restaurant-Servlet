package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Cart;
import dto.Customer;
import dto.Order;

@WebServlet("/customer-signup")
public class CustomerSignupServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("customer-signup.html").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		long mno = Long.parseLong(req.getParameter("mobile"));
		String address = req.getParameter("address");

		MyDao dao = new MyDao();

		List<Customer> list = dao.findCustomerByEmail(email);
		if (list.isEmpty()) {
			List<Order> arrayList = new ArrayList<Order>();
			Customer c = new Customer(0, name, email, mno, address, AES.encrypt(password, "123"), new Cart(),arrayList);
			dao.saveCustomer(c);
			resp.getWriter().print("<p align='center' style='color:green;'>Your account created successfully<p>");
			req.getRequestDispatcher("customer-login.html").include(req, resp);
		} else {
			resp.getWriter().print(
					"<p align='center' style='color:red;'>Account already exists with email - " + email + "</p>");
			req.getRequestDispatcher("customer-signup.html").include(req, resp);
		}

	}

}
