<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.login-container {
	background-color: #fff;
	width: 300px;
	margin: 100px auto;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

label {
	display: block;
	margin-bottom: 5px;
	color: #666;
}

input[type="text"], input[type="password"] {
	width: 95%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 3px;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="login-container">
		<h2>Login</h2>
		<form action="StudentServlet" method="post">
			<label for="userId">User ID:</label> <input type="text" id="userId"
				name="userId" required><br> <label for="password">Password:</label>
			<input type="password" id="password" name="password" required><br>
			<input type="submit" value="Login">
		</form>
		<script>
			$(document).ready(function() {
				var error = getUrlParameter('error');
				if (error === '1') {
					alert('Invalid credentials. Please try again.');
				}
			});

			function getUrlParameter(name) {
				name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
				var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
				var results = regex.exec(location.search);
				return results === null ? '' : decodeURIComponent(results[1]
						.replace(/\+/g, ' '));
			};
		</script>
	</div>
</body>
</html>
