<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>Bisani | Checkout</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
    <script src="https://kit.fontawesome.com/72a36f73ea.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src = "js_files/signup.js"></script>
        
    <style>
       .nav-link:hover {
            background-color: #4198f7;
        }
    </style>
    
</head>
    
<body>
  <div id = 'errorbar'>
  
  	<%
  		if (request.getAttribute("error") != null)
  		{
	  		if (request.getAttribute("error").equals("nullemail"))
	  		{
	  			out.println("Email missing from registration form. Please try again.");
	  		}
	  		else if (request.getAttribute("error").equals("nullname"))
	  		{
	  			out.println("Name missing from registration form. Please try again");
	  		}
	  		else if (request.getAttribute("error").equals("nullpassword"))
	  		{
	  			out.println("Password missing from registration form. Please try again.");
	  		}
	        else if (request.getAttribute("error").equals("nullconfirmation"))
	  		{
	  			out.println("Password confirmation missing from registration form. Please try again");
	  		}
	        else if (request.getAttribute("error").equals("passwordMismatch"))
	        {
	        	out.println("Inputted passwords on registration form do not match. Please try again.");
	        }
	        else if (request.getAttribute("error").equals("badEmail"))
	  		{
	  			out.println("Inputted email on registration form is poorly formatted. Please try again");
	  		}
	        else if (request.getAttribute("error").equals("lbadEmail"))
	  		{
	  			out.println("Inputted email on login form is poorly formatted. Please try again");
	  		}
	        else if (request.getAttribute("error").equals("usernotfound"))
	        {
	        	out.println("Invalid login email or password. Please try again");
	        }
	  		else if (request.getAttribute("error").equals("lnullpassword"))
	  		{
	  			out.println("Password missing from login form. Please try again.");
	  		}
	  		else if (request.getAttribute("error").equals("lnullemail"))
	  		{
	  			out.println("Email missing from login form. Please try again.");
	  		}
	  		else if (request.getAttribute("error").equals("emailInUse"))
	  		{
	  			out.println("Registration email already in use. Please try a different email");
	  		}
	  		

  		}
  	%>
  </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top shadow-lg bg-white rounded">
        <a class="navbar-brand" href="index.html"><i class="fa-solid fa-bag-shopping"></i> S U S T A I N I F Y</a>
    
        <button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation"
            class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button"><span
                class="navbar-toggler-icon"></span></button>
    
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href="index.jsp">Home </a> <a
                    class="nav-link active " href="signup.jsp">Register <span class="sr-only">(current)</span></a>
                <!--<a class="nav-link" href="mycart.html">My Cart</a>
				 move the shopping bag icon next to My Cart 
                <a class="nav-link" href="myprofile.html">
                    My Profile
                </a>
                <a class="nav-link" href="checkout.html">
                    <svg width="1em" height="1em" viewBox="0 0 12 20" class="bi bi-bag" fill="currentColor"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5H2z" />
                    </svg>
                    My Items
                </a> -->
            </div>
        </div>
    </nav>


    <section class="vh-100" style="background-color: #eee;">
        <div class="container h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
              <div class="card text-black" style="border-radius: 25px;">
                <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
      
                      <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>
      
                      <form class="mx-1 mx-md-4" id = "register_form" action = "Register" method = "get">
      
                        <div class="d-flex flex-row align-items-center mb-4">
                          <div class="form-outline flex-fill mb-0">
                            <i class="fa-solid fa-user"></i>
                            <label class="form-label" for="form3Example1c">Your Username</label>
                            <input type="text" name = "register-name" id="form3Example1c" class="form-control" />
                          </div>
                        </div>
      
                        <div class="d-flex flex-row align-items-center mb-4">
                          <div class="form-outline flex-fill mb-0">
                            <i class="fa-solid fa-envelope"></i>
                            <label class="form-label" for="form3Example3c">Your Email</label>
                            <input type="email" name = "register-email" id="form3Example3c" class="form-control" />
                          </div>
                        </div>
      
                        <div class="d-flex flex-row align-items-center mb-4">
                          <div class="form-outline flex-fill mb-0">
                            <i class="fa-solid fa-lock"></i>
                            <label class="form-label" for="form3Example4c">Password</label>
                            <input type="password" name = "register-password" id="form3Example4c" class="form-control" />
                          </div>
                        </div>
      
                        <div class="d-flex flex-row align-items-center mb-4">
                          <div class="form-outline flex-fill mb-0">
                            <i class="fa-solid fa-key"></i>
                            <label class="form-label" for="form3Example4cd">Repeat your password</label>
                            <input type="password" name = "confirm-password" id="form3Example4cd" class="form-control" />
                          </div>
                        </div>
      
                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                          <input type="submit" class="btn btn-primary btn-lg" id = "register_button" value="Register"/>
                        </div>
      
                      </form>
      
                    </div>
                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
      
                      <img src="images/register.svg"
                        class="img-fluid" alt="Sample image">
      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>


	<!--footer-->
	<div class="container-fluid footer">
		<div class="row footerspace align-items-center">
<p style="color: white; margin-bottom: -1%;">Created by Krishna, Rin, Gwen, Sahithi, Brice & Kritin</p>	</div>
<!-- Bootstrap link -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    
</body>
</html>