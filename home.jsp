<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            display: flex;
            background-color:chocolate;
            padding: 10px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
        }
        .navbar a:hover {
            background-color: #575757;
        }
        .navbar span {
            color: white;
            margin-right: auto;
            padding: 10px 15px;
        }
        .content-frame {
            width: 100%;
            height: 600px;
            border: none;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <span>Welcome, <%= username %>!</span>
        <a href="insert.jsp" target="contentFrame">Insert</a>
        <a href="update.jsp" target="contentFrame">Update</a>
        <a href="delete.jsp" target="contentFrame">Delete</a>
        <a href="display.jsp" target="contentFrame">Display</a>
        <a href="logout" target="_self">Sign Out</a>
    </div>
    <iframe name="contentFrame" class="content-frame"></iframe>
</body>
</html>
