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
import dto.FoodItem;

@WebServlet("/view-food")
public class ViewHotelFoods extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			int id = Integer.parseInt(req.getParameter("id"));
			MyDao dao = new MyDao();
			List<FoodItem> items = dao.fetchFoodByHotel(id);
			if (items.isEmpty()) {
				resp.getWriter().print("<h1 align='center' style='color:red'>No Food Items Added Yet</h1>");
				req.getRequestDispatcher("view-menu").include(req, resp);
			} else {
				req.setAttribute("items", items);
				req.getRequestDispatcher("view-menu.jsp").include(req, resp);
			}
	}
}
