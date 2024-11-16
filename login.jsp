<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Login Page</h2>
        <form action="login.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" name="password" required><br>
            <button type="submit" value="Login">Login</button>
        </form>
        <p style="text-align:center;">Don't have an account? <a href="register.jsp">Register here</a>.</p>
    </div>
    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users2 WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
            out.println("<p style='color:red;'>Invalid credentials. Try again.</p>");
        }
    }
    %>
</body>
</html>

