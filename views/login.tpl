<!DOCTYPE html>
<html>
  <head>
  	<link rel="stylesheet" href="/static/base.css">
	<link rel="stylesheet" href="/static/skeleton.css">
	<link rel="stylesheet" href="/static/layout.css">
    <title>Acme Healthcare</title>
  </head>
  <body>
<h2>Acme Healthcare</h2>
<h3>Member Login</h3>
    <form action="/login" method="post">
        <label for="regularInput">Username</label>
        <input name="username" type="text" id="regularInput" /><br>
        <label for="regularInput">Password</label>
        <input name="password" type="text" id="regularInput" /><br>
        <button value="Login" type="submit">Log in</button>
        <!-- Username: <input name="username" type="text" /><br>
        Password: <input name="password" type="password" />
        <input value="Login" type="submit" /> -->
    </form>
   </body>
</html>