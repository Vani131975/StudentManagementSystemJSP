<%@ page import="java.sql.*" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String rollno = request.getParameter("rollno");

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        PreparedStatement ps = con.prepareStatement("DELETE FROM users2 WHERE rollno=?");
        ps.setString(1, rollno);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            out.println("<p style='color:green;'>User deleted successfully!</p>");
        } else {
            out.println("<p style='color:red;'>Roll number not found. Deletion failed.</p>");
        }
    }
%>
<html>
    <head><style>
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
    </style></head>
    <body>
        <h2 style="text-align: center;">Delete</h2>
<form method="post" style="text-align: center;">
    <label for="rollno">Roll No:</label>
    <input type="text" name="rollno" required>
    <button type="submit">Delete</button>
</form>
</body>
</html>
