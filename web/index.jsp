<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19.06.2020
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
      <link rel="stylesheet" href="/css/style.css">

  </head>
  <body>
  <!-- Slideshow container -->
  <div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
          <img src="/img/img1.jpg" style="width:100%">
      </div>

      <div class="mySlides fade">
          <img src="/img/img2.jpg" style="width:100%">
      </div>

      <div class="mySlides fade">
          <img src="/img/img3.jpg" style="width:100%">
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
  </div>
  <br>

  <!-- The dots/circles -->
  <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
  </div>



  <form action="/login" method="post">
    <input type="text" name="email" placeholder="Input your email"><br>
    <input type="password" name="password" placeholder="Input your password"><br>
    <input type="submit" value="Login">
  </form>

  <p id="pId" class="pclass" style="width: 100px; height: 100px; border: 1px solid black"></p>
 <button id="hide">Hide</button>
 <button id="show">Show</button>
  </body>
  <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="/js/slider.js" type="text/javascript"></script>



  <script>


  $(document).ready(function () {
    $('#hide').on('click',function () {
      $("#pId").hide();
    })

      $('#show').on('click',function () {
      $("#pId").show();
    })
  })

  // let p = document.getElementById("pId");
  // let button = document.getElementById("clickMe");
  //
  // button.onclick = function () {
  //   p.style["border"] = " 2px solid red"
  //   p.style.width = "200px"
  // }


</script>
</html>
