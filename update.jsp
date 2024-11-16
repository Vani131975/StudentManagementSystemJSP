<%@ page import="java.sql.*" %>
<html>
    <head>
        <style>
            input[type="text"]{
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    }
             button {
               padding: 7px;
               margin-bottom: 10px;
               border: 1px solid #ccc;
               border-radius: 4px;
               background-color: #007bff;
               color: white;
               border: none;
               cursor: pointer;
            }

            button:hover {
               background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <h2 style="text-align: center;">Update</h2>
<%
    ResultSet rs = null;
    String rollno = null;
    String successMessage = null;
    String errorMessage = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        rollno = request.getParameter("rollno");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (password != null && !password.equals(confirmPassword)) {
            errorMessage = "Password and confirm password do not match!";
        } else {
            try {
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

                if (name != null && username != null && email != null && phone != null && password != null) {
                    PreparedStatement psUpdate = con.prepareStatement(
                        "UPDATE users2 SET name=?, username=?, email=?, phone=?, password=? WHERE rollno=?");
                    psUpdate.setString(1, name);
                    psUpdate.setString(2, username);
                    psUpdate.setString(3, email);
                    psUpdate.setString(4, phone);
                    psUpdate.setString(5, password);
                    psUpdate.setString(6, rollno);

                    int rows = psUpdate.executeUpdate();
                    if (rows > 0) {
                        successMessage = "Details updated successfully!";
                    } else {
                        errorMessage = "Failed to update details. Roll number may not exist.";
                    }
                }

                if (rollno != null) {
                    PreparedStatement psSelect = con.prepareStatement(
                        "SELECT * FROM users2 WHERE rollno=?");
                    psSelect.setString(1, rollno);
                    rs = psSelect.executeQuery();
                }

            } catch (Exception e) {
                errorMessage = "Error: " + e.getMessage();
            }
        }
    }
%>
<%
    if (successMessage != null) {
%>
<p style="color:green;"><%= successMessage %></p>
<%
    }
    if (errorMessage != null) {
%>
<p style="color:red;"><%= errorMessage %></p>
<%
    }
%>
<form method="post" style="text-align: center;">
    <label>Enter Roll No:</label>
    <input type="text" name="rollno" value="<%= rollno != null ? rollno : "" %>" required>
    <button type="submit">Search</button>
</form>

<%
    if (rs != null && rs.next()) {
%>
<form method="post" style="max-width: 500px;
margin: 50px auto;
background: #fff;
padding: 20px;
border-radius: 8px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
    <input type="hidden" name="rollno" value="<%= rs.getString("rollno") %>">

    <label for="name">Name:</label>
    <input type="text" name="name" value="<%= rs.getString("name") %>" required><br>

    <label for="username">Username:</label>
    <input type="text" name="username" value="<%= rs.getString("username") %>" required><br>

    <label for="email">Email:</label>
    <input type="email" name="email" value="<%= rs.getString("email") %>" required><br><br>

    <label for="phone">Phone:</label>
    <input type="text" name="phone" value="<%= rs.getString("phone") %>" required><br>

    <label for="password">Password:</label>
    <input type="password" name="password" value="<%= rs.getString("password") %>" required><br><br>

    <label for="confirmPassword">Confirm Password:</label>
    <input type="password" name="confirmPassword" value="<%= rs.getString("password") %>" required><br><br>

    <button type="submit">Update</button>
</form>
<%
    } else if (rollno != null) {
%>
<p style="color:red;">Roll number not found. Please try again.</p>
<%
    }
%>
    </body>
    </html>