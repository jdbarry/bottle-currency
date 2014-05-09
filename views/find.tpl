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
<h3>Find a Doctor</h3>
<form action="/find" method="post">
<label for="regularInput">Zip Code</label>
<input name="zip" type="text" id="regularInput" />
<label for="regularInput">Name (Optional)</label>
<input name="name" type="text" id="regularInput" />
<button value="find" type="submit">Search</button>
</form>
</div>
</div>
</body>
</html>