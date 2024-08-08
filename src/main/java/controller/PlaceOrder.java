package controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Customer;
import dto.Order;

@WebServlet("/place-order")
public class PlaceOrder extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer customer = (Customer) req.getSession().getAttribute("customer");
		
			Order order = new Order();
			order.setDateTime(LocalDateTime.now());
			order.setTotalPrice(customer.getCart().getTotalPrice());
			order.setItems(customer.getCart().getCartItems());

			customer.getOrders().add(order);

			MyDao dao = new MyDao();
			dao.updateCustomer(customer);
			customer.getCart().getCartItems().clear();
			dao.updateCustomer(customer);
			
			req.getSession().setAttribute("customer", dao.findCustomerByEmail(customer.getEmail()).get(0));

			resp.getWriter().print("<h1 align='center' style='color:green'>Order Placed Successfully</h1>");
			req.getRequestDispatcher("customer-home.html").include(req, resp);
		
	}
}
