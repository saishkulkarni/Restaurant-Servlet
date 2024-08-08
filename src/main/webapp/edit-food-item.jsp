<!DOCTYPE html>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Food Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .radio-group {
            margin-bottom: 15px;
        }
        .radio-group label {
            margin-right: 15px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        .current-image {
            text-align: center;
            margin-bottom: 15px;
        }
        .current-image img {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px;
        }
    </style>
</head>
<body>
    <% FoodItem item = (FoodItem) request.getAttribute("item"); %>
    <div class="container">
        <h1>Edit Food Item</h1>
        <form action="edit-food-item" method="post" enctype="multipart/form-data">
            <label for="id">Id:</label>
            <input type="text" id="id" name="id" value="<%= item.getId() %>" readonly>
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= item.getName() %>" required>
            
            <label for="price">Cost:</label>
            <input type="text" id="price" name="price" value="<%= item.getPrice() %>" required>
            
            <div class="radio-group">
                <label>Type:</label>
                <label>
                    <input type="radio" name="type" value="veg" <%= item.getType().equals("veg") ? "checked" : "" %>> VEG
                </label>
                <label>
                    <input type="radio" name="type" value="non-veg" <%= item.getType().equals("non-veg") ? "checked" : "" %>> NON-VEG
                </label>
            </div>
            
            <label for="stock">Stock:</label>
            <input type="number" id="stock" name="stock" value="<%= item.getStock() %>" required>
            
            <label for="image">Picture:</label>
            <input type="file" id="image" name="image" accept="image/*">
            
            <div class="current-image">
                <p>Current Image:</p>
                <img src="data:image/jpeg;base64,<%= Base64.encodeBase64String(item.getImage()) %>" alt="<%= item.getName() %>" height="100" width="100">
            </div>
            
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
