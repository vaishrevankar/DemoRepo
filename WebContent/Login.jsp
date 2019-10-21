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
        width:300px;
        height:300px;
        margin-top:50px;
        margin-left: 500px;
        padding-left:30px;
        padding-top:50px;
    }
    </style>
</head>
<body>
<div id="Style">
<form action="LoginServlet" method="post">
    Enter username :<input type="text" name="username" height="10"> <br><br><br>
    Enter password :<input type="password" name="password" height="10"><br><br><br>
    <center><input type="submit" value="Login"><center>
</form>
</div>
</body>
</html>
