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
<h3>Schedule Appointment</h3>
<form action="/schedule" method="post">
<h3>Leona J. Smith, MD</h3>
<div class="adr">
Primary Family Care<br>
Distance: 1.9 mi<br>
</div>
<label for="regularTextarea">Reason for Visit</label>
<textarea id="regularTextarea"></textarea>
<label for="regularInput">Date</label>
<input name="username" type="text" id="regularInput" />
<label for="selectList">Time</label>
<select id="selectList">
<option value="Option 1">8:00 a.m.</option>
<option value="Option 2">12:30 p.m.</option>
<option value="Option 3">3:00 p.m.</option>
</select>
<button value="Schedule" type="submit">Book Appointment</button>
</form>
</div>
</div>
</body>
</html>