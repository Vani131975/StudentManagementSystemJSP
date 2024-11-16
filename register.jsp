<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Registration Page</h2>
        <form action="register.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" required><br>
            <label for="rollno">Roll No:</label>
            <input type="text" name="rollno" required><br>
            <label for="username">Username:</label>
            <input type="text" name="username" required><br>
            <label for="email">Email:</label>
            <input type="email" name="email" required><br>
            <label for="phone">Phone:</label>
            <input type="text" name="phone" required><br>
            <label for="password">Password:</label>
            <input type="password" name="password" required><br>
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" name="confirm_password" required><br>
            <button type="submit" value="Register">Register</button>
        </form>
        <p style="text-align:center;">Already have an account? <a href="login.jsp">login</a>.</p>
    </div>
    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String rollno = request.getParameter("rollno");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        PreparedStatement ps = con.prepareStatement("INSERT INTO users2 (name, rollno, username, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, rollno);
        ps.setString(3, username);
        ps.setString(4, email);
        ps.setString(5, phone);
        ps.setString(6, password);

        ps.executeUpdate();
        out.println("<p style='color:green;'>Registration successful. <a href='login.jsp'>Login here</a></p>");
    }
    %>
</body>
</html>

