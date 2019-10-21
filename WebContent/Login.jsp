<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
    #Style{
        border: solid;
        width:200px;
        height:200px;
        margin-top:50px;
        margin-left: 500px;
    }
    </style>
</head>
<body>
<div id="Style">
<form action="LoginServlet" method="post">
    Enter username :<input type="text" name="username" height="10"> <br><br>
    Enter password :<input type="password" name="password" height="10"><br><br>
    <input type="submit" value="Login">
</form>
</div>
</body>
</html>
