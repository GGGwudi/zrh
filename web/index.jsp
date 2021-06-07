<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Welcome to CandyHouse</title>
  </head>
  <style>
    body{
      background:url("pictures/background.png");
      background-size:100% 100%;
      background-attachment: fixed;
    }
    #welcome{
      text-align: center;
      margin-top: 200px;
    }
    #bot{
      width: 200px;
      height: 30px;
      border-radius: 10px;
    }
  </style>
  <script>
    function next() {
        window.location="PageContent";
    }
  </script>
  <body>
  <div id="welcome">
  <strong style="color:black;font-size: 50px;font-family:'Sitka Text'">欢迎光临~糖果屋~</strong>
  <p style="font-size: 20px;color: black;font-family:'Sitka Text'">Sweet~分享甜蜜</p>
  <button id="bot" type="button" style="font-family: 'Sitka Text'" onclick="next()">进入~糖果屋~</button>
  </div>
  </body>
</html>
