<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/static/base.css">
<link rel="stylesheet" href="/static/skeleton.css">
<link rel="stylesheet" href="/static/layout.css">
<title>Acme Healthcare</title>
    <style>
    .container h2, .container img {
    display: inline;
    vertical-align: middle;
}
  </style>
</head>
<body>
<div class="container">
<img src="/static/icon.png" width="40">
<h2>Acme Healthcare</h2>
<div style="padding-left:45px;">
<h3>Member Login</h3>
<form action="/login" method="post">
<label for="regularInput">Username</label>
<input name="username" type="text" id="regularInput" />
<label for="regularInput">Password</label>
<input name="password" type="password" id="regularInput" />
<p><a href="">Forgot password?</a></p>
<button value="Login" type="submit">Log in</button>
</form>
</div>
</div>
</body>
</html>