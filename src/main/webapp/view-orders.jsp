<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.Order" %>
<%@ page import="dto.CartItem" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            line-height: 1.6;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .back-btn {
            display: block;
            width: 100px;
            margin: 20px auto 0;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .back-btn:hover {
            background-color: #45a049;
        }
        .order-details {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 4px;
        }
        .item-image {
            max-width: 50px;
            max-height: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Orders</h1>
        
        <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        if (orders != null && !orders.isEmpty()) {
            for (Order order : orders) {
        %>
            <div class="order-details">
                <h2>Order #<%= order.getId() %></h2>
                <p><strong>Date:</strong> <%= order.getDateTime().format(formatter) %></p>
                <p><strong>Total Price:</strong> $<%= String.format("%.2f", order.getTotalPrice()) %></p>
                
                <table>
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CartItem item : order.getItems()) { %>
                            <tr>
                                <td>
                                    <% if (item.getImage() != null) { %>
                                        <img src="data:image/jpeg;base64,<%= Base64.encodeBase64String(item.getImage()) %>" alt="<%= item.getName() %>" class="item-image">
                                    <% } else { %>
                                        No Image
                                    <% } %>
                                </td>
                                <td><%= item.getName() %></td>
                                <td><%= item.getType() %></td>
                                <td><%= item.getQuantity() %></td>
                                <td>$<%= String.format("%.2f", item.getPrice()) %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <%
            }
        } else {
        %>
            <p>No orders found.</p>
        <%
        }
        %>
        
        <a href="customer-home.html" class="back-btn">Back</a>
    </div>
</body>
</html>
