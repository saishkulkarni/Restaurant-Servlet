<%@page import="dto.CartItem"%>
<%@page import="dto.Cart"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cart Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
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
        img {
            display: block;
            margin: 0 auto;
        }
        .total-row {
            font-weight: bold;
            background-color: #e6e6e6;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-secondary {
            background-color: #f4f4f4;
            color: #333;
        }
        .btn-secondary:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Cart Items</h1>
        <% Cart cart = (Cart) request.getAttribute("cart"); %>
        <table>
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
            <% for (CartItem item : cart.getCartItems()) { %>
            <tr>
                <td><img src="data:image/jpeg;base64,<%= Base64.encodeBase64String(item.getImage()) %>" alt="<%= item.getName() %>" height="100" width="100"></td>
                <td><%= item.getName() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= String.format("%.2f", item.getPrice() / item.getQuantity()) %></td>
                <td>$<%= String.format("%.2f", item.getPrice()) %></td>
            </tr>
            <% } %>
            <tr class="total-row">
                <td colspan="4">Total Price:</td>
                <td>$<%= String.format("%.2f", cart.getTotalPrice()) %></td>
            </tr>
        </table>
        <a href="place-order" class="btn">Place Order</a>
        <a href="customer-home.html" class="btn btn-secondary">Back</a>
    </div>
</body>
</html>
