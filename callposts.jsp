<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*" %>
      <%@ page contentType="text/html" pageEncoding="UTF-8" %>
	  <!DOCTYPE html>
		<html>
		<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scale=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets">
    <link rel="shortcut icon" href="assets/favicon.jpg" type="image/x-icon">
    <title>Blogosphere</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="./css/all.css">


    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">

    <!-- Custom Style   -->
    <link rel="stylesheet" href="./css/Style.css">
    <!-- <link rel="stylesheet" href="./css/Style2.css"> -->

</head>


<body>
<!-- ----------------------------  Navigation ---------------------------------------------- -->

    <nav class="nav">
        <div class="nav-menu flex-row">
            <div class="nav-brand">
                <img src="assets/icon.jpg" alt="Image" width="90px">
                <img src="assets/icon2.jpg" alt="Image" width="200px">

            </div>
            <div class="toggle-collapse">
                <div class="toggle-icons">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
            <div>
                <ul class="nav-items">
                    <li class="nav-link">
                        <a href="Index.html">Home</a>
                    </li>
                    <li class="nav-link">
                        <a href="#category">Category</a>
                    </li>
<!----                    <li class="nav-link">
                        <a href="callposts.jsp">Posts</a>
                    </li>  --->
                    <li class="nav-link">
                        <a href="#pages" >Pages</a>
                    </li>
                    <li class="nav-link">
                        <a href="Contacts.html">Contact Us</a>
                    </li>
                    <li class="nav-link">
                        <a href="#" class="open-button" onclick="SignForm()">SignUp</a>
                    </li>
                </ul>
            </div>
            <div class="social text-gray">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </nav>

    <!-- ------------x---------------  Navigation --------------------------x------------------- -->
<!----------------------------- Main Site Section ------------------------------>

    <main>

        <!------------------------ Site Title ---------------------->

        <section class="site-title">
            <div class="site-background" data-aos="fade-up" data-aos-delay="100">
                <h1>All about Blogging</h1>
                <h2>Connecting !deas and people</h2>
                <h3>Create a unique and beautiful blog</h3>
                <button class="btn"><a href="#" onclick="SignForm()">Create a blog</a></button>
            </div>
        </section>

        <!------------x----------- Site Title ----------x----------->


        <!-- --------------------- Blog Carousel ----------------- -->

			   <section>
            <div id="pages" class="blog">
                <div class="container">
                    <div class="owl-carousel owl-theme blog-post">
                 
		<%
				String rname;
			String remail;
			String message;
		 	 try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Blogosphere","12345");
		          
		 String sql="select *  from posts";
		 Statement ps = conn.createStatement();
		 ResultSet rs;
		 rs = ps.executeQuery(sql);
			
			while(rs.next())
			{
				remail=rs.getString("remail");
				rname=rs.getString("rname");
				message=rs.getString("message"); 
				%>        <div class="blog-content" data-aos="fade-right" data-aos-delay="200">
                             <div class="blog-title">
                                 <div >
		<h1> Blogger :<%out.println(rname);%><h1>
		<h2> Blogger Id:<%out.println(remail);%><h2>
		<h3 style="color:red;"><%out.println(message);%></h3>
		</div>         <button class="btn btn-blog">Like</button>
                                <!-- <span>2 minutes</span> -->
                            </div>
                        </div>
                 <%}
				
				}catch(Exception e)
									{
									out.println("stop");
									}
			 

		 %>
		  </div>
                    <div class="owl-navigation">
                        <span class="owl-nav-prev"><i class="fas fa-long-arrow-alt-left"></i></span>
                        <span class="owl-nav-next"><i class="fas fa-long-arrow-alt-right"></i></span>
                    </div>
                </div>
            </div>
        </section>

        <!-- ----------x---------- Blog Carousel --------x-------- -->
		  <div class="form-popup" id="myForm">
            <div class="form-container">
                <div class="card">
                    <div class="inner-box" id="card">
                        <div class="class-front">
                            <tr>
                                <h2>LOGIN</h2>
                            </tr>
                            <form action="login.jsp" method="post">
                                <tr>
                                    <td><input type="email" name="remail" class="input-box" placeholder="Your Email Id"
                                            required></td>
                                </tr>
                                <tr>
                                    <td><input type="password" name="rpass" class="input-box" id="myInput"
                                            placeholder="Password" required></td>
                                </tr>
                                <tr>
                                    <td><button type="submit" class="submit-btn">Submit </button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" onclick="myFunction()"><span>Show Password</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"><span>Remember Me</span></td>
                                </tr>

                            </form>
                            <button type="button" class="button" onclick="openRegister()">I am new here</button>
                            <a href="">Forgot Password</a>
                            <button type="button" class="close-button" onclick="closeForm()">Close</button>


                        </div>
                        <div class="class-back">
                            <tr>
                                <h2>REGISTER</h2>
                            </tr>
                            <form action="registration.jsp" method="post">
                                <table>
                                    <tr>
                                        <td>
                                            </ts><input type="text" name="rname" class="input-box"
                                                placeholder="Your Name" required></td>
                                    </tr>
                                    <tr>
                                        <td><input type="email" name="remail" class="input-box"
                                                placeholder="Your Email Id" required></td>
                                    </tr>
                                    <tr>
                                        <td><input type="password" name="rpass" class="input-box" id="myInput"
                                                placeholder="Password" required></td>
                                    </tr>
                                    <tr>
                                        <td><input type="password" name="rconfirmpass" class="input-box" id="myInput"
                                                placeholder="Confirm Password" required></td>
                                    </tr>
                                    <tr>
                                        <td><button type="submit" class="submit-btn">Submit </button></td>
                                    </tr>
                                </table>
                                <tr>
                                    <td><input type="checkbox" onclick="myFunction()"><span>Show Password</span></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"><span>Remember Me</span></td>
                                </tr>

                            </form>
                            <button type="button" class="button" onclick="openLogin()">I have an account</button>
                            <!-- <a href="">Forgot Password</a> -->
                            <td><button type="button" class="close-button" onclick="closeForm()">Close</button></td>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        
		   <div class="pagination flex-row">
                        <a href="#"><i class="fas fa-chevron-left"></i></a>
                        <a href="#" class="pages">1</a>
                        <a href="callposts.jsp" class="pages">2</a>
                        <a href="#" class="pages">3</a>
                        <a href="#"><i class="fas fa-chevron-right"></i></a>
                    </div>
                </div><!-- ---------------------- Site Content -------------------------->

        <section class="container">
            <div class="site-content">
                <div class="posts">
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./assets/Blog-post/blog1.jpg" class="img" alt="blog1">
                            </div>
                            <div class="post-info flex-row">
                                <!-- <span><i class="fas fa-user text-gray"></i>&nbsp;&nbsp;Admin</span> -->
                                <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;June 07, 2021</span>
                                <!-- <span>2 Commets</span> -->
                            </div>
                        </div>
                        <div  class="post-title">
                            <a href="#">THE DELICIOUS STORY OF THE PIZZA</a>
                            <p>Pizza, favored by all ages, dates back to 1889. Pizza, garnished with Mozzarella
                                and tomatoes, was normally known as the dish for poor people until it became a famous
                                dish for the wealthy when Queen Margherita had it as a meal as well.Pizza, with sauces and spices such as basil and garlic added later on, gets 
                                    recognition by other nations with the arrival of Italian immigrants to the United States.
                                    The spread of pizza all over the world is due to the initiatives of the Americans.
                                    At that time in Italy, pizzas were made with Mozzarella and tomatoes however later on were 
                                    served with different ingredients used today. Pizza, which has spread quickly outside of the
                                    USA, has become a favorite dish for consumers of all ages.</span>
                                    <span id="dots">...</span>
                                    <span id="more">
                            </p>
                            <button class="btn post-btn" onclick="readMore()" id="byClick">Read More &nbsp; <i
                                    class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    <hr>
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./assets/Blog-post/blog2.jpg" class="img" alt="blog1">
                            </div>
                            <div class="post-info flex-row">
                                <!-- <span><i class="fas fa-user text-gray"></i>&nbsp;&nbsp;Admin</span> -->
                                <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;June 07, 2021</span>
                                <!-- <span>7 Commets</span> -->
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">Tata Steel Wins Heart For Paying Salaries, Benefits To The Families of Employees Who Died Due To Covid</a>
                            <p>Ratan Tata is known for his empathetic nature and treating his employees like his family. There have been several 
                                instances where he has gone out of the way to help out the people who work for him and his company Tata Steel. 
                                So, during the second wave of Covid-19, Tata Steel has gone above and beyond to help its employees and extended 
                                social security schemes to the family members of the employees affected by Covid-19. 
                                The Jamshedpur-based steel manufacturer has announced that it would continue to pay monthly salary to the family 
                                of all employees who died due to COVID-19.
                                It also added in the statement that the salary would be paid till the retirement age of the deceased - that is 60 years.
                                The monthly pay would be the same as the last salary which the person drew before their demise.  Along with the salary, 
                                the company would also provide medical benefits and residential facilities.
                                <span id="dots">...</span>
                                <span id="more"></span>
                            </p>
                            <button class="btn post-btn" onclick="readMore()" id="byClick">Read More &nbsp; <i
                                    class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    <hr>
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./assets/Blog-post/blog3.jpg" class="img" alt="blog1">
                            </div>
                            <div class="post-info flex-row">
                                <!-- <span><i class="fas fa-user text-gray"></i>&nbsp;&nbsp;Admin</span> -->
                                <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;June 07, 2021</span>
                                <!-- <span>5 Commets</span> -->
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">MY TRAVEL PHOTOGRAPHY GEAR: WHAT’S IN MY BACKPACK</a>
                            <p>For the last three years, I have been traveling all around the world taking photographs 
                                and writing travel blogs and guides. Throughout this time I’ve tried a lot of different 
                                camera gear and also different backpacks and organization methods to keep it all sorted 
                                efficiently. In this blog post, I’m going to walk you through everything that’s in my backpack. 
                                I’ll always keep this blog post up to date, adding and removing gear as I upgrade or find better alternatives.
                                I’ve become a bit of an efficiency and practicality geek, which I’m sure my friends will tell you all about.
                                I only use reliable products because I can’t afford things to go wrong when I’m in a place I’ll never come
                                back to or I’m working on a project. All of the camera gear and equipment in this blog post are items that
                                I have in my backpack as I travel around the world as a professional travel blogger.
                                I usually buy my camera gear from Amazon as it is cheaper than the stores but also has a high level of reliability.
                                <span id="dots">...</span>
                                <span id="more"></span>
                            </p>
                            <button class="btn post-btn" onclick="readMore()" id="byClick">Read More &nbsp; <i
                                    class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    <hr>
                    <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                        <div class="post-image">
                            <div>
                                <img src="./assets/Blog-post/blog4.jpg" class="img" alt="blog1">
                            </div>
                            <div class="post-info flex-row">
                                <!-- <span><i class="fas fa-user text-gray"></i>&nbsp;&nbsp;Admin</span> -->
                                <span><i class="fas fa-calendar-alt text-gray"></i>&nbsp;&nbsp;June07, 2021</span>
                                <!-- <span>12 Commets</span> -->
                            </div>
                        </div>
                        <div class="post-title">
                            <a href="#">Sledgehammer Training with Intent</a>
                            <p>Long time readers of the site know that I’m a fan of the sledgehammer,
                                both for power development and conditioning. World champion fighters were swinging
                                sledgehammers before any of us were born (ex. Jack Dempsey), and they continue to do so today.
                                As a result, it’s no surprise that I’ve demonstrated sledgehammer swings many times.
                                As a professional boxing coach, it’s an exercise that I strongly believe in. Yet,
                                whenever I demo the sledge, my inbox fills with questions about the ideal weight of the hammer.
                                And while I welcome all questions, size shouldn’t be the primary concern.
                                <span id="dots">...</span>
                                <span id="more"></span>>
                            </p>
                            <button class="btn post-btn" onclick="readMore()" id="byClick">Read More &nbsp; <i
                                    class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    <div class="pagination flex-row">
                        <a href="#"><i class="fas fa-chevron-left"></i></a>
                        <a href="#" class="pages">1</a>
                        <a href="callposts.jsp" class="pages">2</a>
                        <a href="#" class="pages">3</a>
                        <a href="#"><i class="fas fa-chevron-right"></i></a>
                    </div>
                </div>
                    <aside class="sidebar">
                    <div id="category" class="category">
                        <h2>Category</h2>
                        <ul class="category-list">
                            <li class="list-items" data-aos="fade-left" data-aos-delay="100">
                                <a href="#">Software</a>
                                <!--<span>(05)</span>-->
                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="200">
                                <a href="#">Techonlogy</a>
                                <!--<span>(02)</span>-->
                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="300">
                                <a href="#">Lifestyle</a>
                                <!--<span>(07)</span>-->
                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="400">
                                <a href="#">Shopping</a>
                                <!--<span>(01)</span>-->
                            </li>
                            <li class="list-items" data-aos="fade-left" data-aos-delay="500">
                                <a href="#">Food</a>
                                <!--<span>(08)</span>-->
                            </li>
                        </ul>
                    </div>
                    <div class="popular-post">
                        <h2>Popular Post</h2>
                        <div class="post-content" data-aos="flip-up" data-aos-delay="200">
                            <div class="post-image">
                                <div>
                                    <img src="./assets/popular-post/m-blog-1.jpg" class="img" alt="blog1">
                                </div>
                               </div>
                            <div class="post-title">
                                <a href="#">Tea production volume across India in March 2021</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="flip-up" data-aos-delay="300">
                            <div class="post-image">
                                <div>
                                    <img src="./assets/popular-post/m-blog-2.jpg" class="img" alt="blog1">
                                </div>
                                <div class="post-info flex-row">
                                    
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">Nature Lovers – Here Are Some of The Greenest States in India You Can Visit</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="flip-up" data-aos-delay="400">
                            <div class="post-image">
                                <div>
                                    <img src="./assets/popular-post/m-blog-3.jpg" class="img" alt="blog1">
                                </div>
                                <div class="post-info flex-row">
                                    
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">Getting married during the pandemic? </a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="flip-up" data-aos-delay="500">
                            <div class="post-image">
                                <div>
                                    <img src="./assets/popular-post/m-blog-4.jpg" class="img" alt="blog1">
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">TOP 15 DESTINATIONS FOR BUDGET TRAVEL IN INDIA</a>
                            </div>
                        </div>
                        <div class="post-content" data-aos="flip-up" data-aos-delay="600">
                            <div class="post-image">
                                <div>
                                    <img src="./assets/popular-post/m-blog-5.jpg" class="img" alt="blog1">
                                </div>
                            </div>
                            <div class="post-title">
                                <a href="#">Import Export Trade data from All Indian Sea ports, Air Ports and ICDS</a>
                            </div>
                        </div>
                    </div>
</main>

    <!---------------x------------- Main Site Section ---------------x-------------->


    <!-- --------------------------- Footer ---------------------------------------- -->

    <footer class="footer">
        <div class="container">
            <div class="about-us" data-aos="fade-right" data-aos-delay="200">
                <!--<h2>About us</h2>-->
                <h2><a href="Contacts.html">About Us</a></h2>
            </div>
            <div class="newsletter" data-aos="fade-right" data-aos-delay="200">
                <h2>Newsletter</h2>
                <p>Stay update with our latest</p>
                <div class="form-element">
                    <input type="text" placeholder="Email"><span><i class="fas fa-chevron-right"></i></span>
                </div>
            </div>
            <div class="instagram" data-aos="fade-left" data-aos-delay="200">
                <h2>Instagram</h2>
                <div class="flex-row">
                    <img src="./assets/instagram/thumb-card3.png" alt="insta1">
                    <img src="./assets/instagram/thumb-card4.png" alt="insta2">
                    <img src="./assets/instagram/thumb-card5.png" alt="insta3">
                </div>
                <div class="flex-row">
                    <img src="./assets/instagram/thumb-card6.png" alt="insta4">
                    <img src="./assets/instagram/thumb-card7.png" alt="insta5">
                    <img src="./assets/instagram/thumb-card8.png" alt="insta6">
                </div>
            </div>
            <div class="follow" data-aos="fade-left" data-aos-delay="200">
                <h2>Follow us</h2>
                <p>Let us be Social</p>
                <div>
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-youtube"></i>
                </div>
            </div>
        </div>
        <div class="rights flex-row">
            <h2 class="text-gray">
                Copyright ©2021 All rights reserved | made by ADARSH</h2>
        </div>
        <div class="move-up">
            <span><i class="fas fa-arrow-circle-up fa-2x"></i></span>
        </div>
    </footer>

    <!-- -------------x------------- Footer --------------------x------------------- -->

    <!-- Jquery Library file -->
    <script src="./js/Jquery3.4.1.min.js"></script>

    <!-- --------- Owl-Carousel js ------------------->
    <script src="./js/owl.carousel.min.js"></script>

    <!-- ------------ AOS js Library  ------------------------- -->
    <script src="./js/aos.js"></script>

    <!-- Custom Javascript file -->
    <script src="./js/main.js"></script>
		 	</body>
		</html>
		