<%@page import="dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Hotels</title>
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
        .btn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-select {
            background-color: #3498db;
        }
        .btn-select:hover {
            background-color: #2980b9;
        }
        .btn-back {
            background-color: #f4f4f4;
            color: #333;
            margin-top: 10px;
        }
        .btn-back:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hotels List</h1>
        <% List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels"); %>
        <table>
            <tr>
                <th>Hotel Name</th>
                <th>Hotel Address</th>
                <th>Hotel Mobile</th>
                <th>Action</th>
            </tr>
            <% for (Hotel hotel : hotels) { %>
            <tr>
                <td><%= hotel.getName() %></td>
                <td><%= hotel.getAddress() %></td>
                <td><%= hotel.getMobile() %></td>
                <td><a href="view-food?id=<%= hotel.getId() %>" class="btn btn-select">Select</a></td>
            </tr>
            <% } %>
        </table>
        <a href="customer-home.html" class="btn btn-back">Back</a>
    </div>
</body>
</html>
