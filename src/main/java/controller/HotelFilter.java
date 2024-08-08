package controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import dto.Hotel;

@WebFilter({ "/add-food-item","/delete-food-item","/edit-food-item","/view-food-item" })
public class HotelFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;

		Hotel hotel = (Hotel) req.getSession().getAttribute("hotel");
		if (hotel == null) {
			response.getWriter().print("<h1 align='center' style='color:red'>Invalid Session</h1>");
			req.getRequestDispatcher("hotel-login.html").include(req, response);
		} else {
			chain.doFilter(request, response);
		}
	}

}
