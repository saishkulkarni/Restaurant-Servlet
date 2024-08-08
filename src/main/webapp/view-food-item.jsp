<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Food Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
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
        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin: 2px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-edit {
            background-color: #3498db;
        }
        .btn-edit:hover {
            background-color: #2980b9;
        }
        .btn-delete {
            background-color: #e74c3c;
        }
        .btn-delete:hover {
            background-color: #c0392b;
        }
        .btn-back {
            background-color: #f4f4f4;
            color: #333;
        }
        .btn-back:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Food Items</h1>
        <% List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems"); %>
        <table>
            <tr>
                <th>Name</th>
                <th>Stock</th>
                <th>Image</th>
                <th>Price</th>
                <th>Hotel Name</th>
                <th>Actions</th>
            </tr>
            <% for (FoodItem item : foodItems) { %>
            <tr>
                <td><%= item.getName() %></td>
                <td><%= item.getStock() %></td>
                <td><img src="data:image/jpeg;base64,<%= Base64.encodeBase64String(item.getImage()) %>" alt="<%= item.getName() %>" height="100" width="100"></td>
                <td>$<%= String.format("%.2f", item.getPrice()) %></td>
                <td><%= item.getHotel().getName() %></td>
                <td>
                    <a href="edit-food-item?id=<%= item.getId() %>" class="btn btn-edit">Edit</a>
                    <a href="delete-food-item?id=<%= item.getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
        <a href="hotel-home.html" class="btn btn-back">Back</a>
    </div>
</body>
</html>
