<!DOCTYPE html>
<html>
  <head>
    <title>Acme Healthcare</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon"> 
    <link type="text/css" rel="stylesheet" href="/static/style.css">
  </head>
  <body>
    <h1>Acme Healthcare - Find a Doctor</h1>
    <div class="container">
      <div class="block left">
	<form class="currency" action="#">
	  <input type="text" name="amount" value="">
	</form>
	<div class="currency-list">
	  <table>
	    % for symbol, title in currencies:
	    <tr><th>{{symbol}}
		<td>{{title}}
		  % end
	  </table>
	</div>
      </div>
      <div class="block right">
	<form class="currency" action="#">
	  <input type="text" name="amount" value="">
	  <span class="symbol"></span>
	</form>
	<div class="currency-list">
	  <table>
	    % for symbol, title in currencies:
	    <tr><th>{{symbol}}
		<td>{{title}}
		  % end
	  </table>
	</div>
      </div>
    </div>
    <div class="error"></div>
    <script type="text/javascript" src="/static/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="/static/main.js"></script>
</html>