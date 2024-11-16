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
        <h2 style="text-align: center;">Display</h2>
<form method="get" style="text-align: center;">
    <label for="rollno">Enter Roll No:</label>
    <input type="text" name="rollno" required>
    <button type="submit">Display</button>
</form>
<%
    String rollno = request.getParameter("rollno");
    if (rollno != null && !rollno.isEmpty()) {
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users2 WHERE rollno=?");
        ps.setString(1, rollno);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
%>
<table border="1" style="width:100%; text-align:left;">
    <tr>
        <th>Name</th>
        <th>Roll No</th>
        <th>Username</th>
        <th>Email</th>
        <th>Phone</th>
    </tr>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("rollno") %></td>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
    </tr>
</table>
<%
        } else {
            out.println("<p style='color:red;'>No details found for the provided roll number.</p>");
        }
    }
%>
    </body>
    </html>
