# Restaurant-Servlet

Restaurant-Servlet is a web application for managing a restaurant's menu and customer orders using Java Servlets and JSP.

## Features

- Admin and Customer roles
- Menu management (Add, View, Update, Delete food items)
- Customer registration and login
- Place and view orders
- Admin dashboard for order management

## Technologies Used

- Java Servlets
- JSP (JavaServer Pages)
- JDBC (Java Database Connectivity)
- MySQL Database
- HTML/CSS
- Bootstrap (for styling)

## Project Structure

The project follows a standard Maven web application structure:

Restaurant-Servlet/ ├── src/ │ ├── main/ │ │ ├── java/ │ │ │ └── controller/ │ │ │ ├── AddFood.java │ │ │ ├── AdminLogin.java │ │ │ ├── CustomerLogin.java │ │ │ ├── CustomerSignup.java │ │ │ ├── DeleteFood.java │ │ │ ├── EditFood.java │ │ │ ├── FetchAllMenu.java │ │ │ ├── FetchCustomerOrders.java │ │ │ └── PlaceOrder.java │ │ └── webapp/ │ │ ├── AddFood.jsp │ │ ├── AdminHome.jsp │ │ ├── AdminLogin.jsp │ │ ├── CustomerHome.jsp │ │ ├── CustomerLogin.jsp │ │ ├── CustomerSignup.jsp │ │ ├── EditFood.jsp │ │ └── ViewMenu.jsp └── pom.xml


## Setup and Installation

1. Clone the repository:

2. Set up a MySQL database and update the connection details in the servlet files.

3. Build the project using Maven:

4. Deploy the generated WAR file to a servlet container like Apache Tomcat.

5. Access the application through your web browser.
