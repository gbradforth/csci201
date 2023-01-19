<!DOCTYPE html>
<html lang="en">

<head>

  <title>Create New Item</title>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap link -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" href="main.css">
  <script src="https://kit.fontawesome.com/72a36f73ea.js" crossorigin="anonymous"></script>

  <style>
    .nav-link:hover {
      background-color: #4198f7;
    }
  </style>

</head>
<body>
  <div id = 'errorbar'>
  
  	<%
  		if (request.getAttribute("success") != null)
  		{
  			out.println("Successfully added new Item to catalogue.");
  		}
  	%>
  </div>

<body>

  <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top shadow-lg bg-white rounded">
    <a class="navbar-brand" href="index-logged-in.jsp"><i class="fa-solid fa-bag-shopping"></i> S U S T A I N I F Y</a>

    <button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation"
      class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button"><span
        class="navbar-toggler-icon"></span></button>

    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" href="index-logged-in.jsp">Home </a>
        <a class="nav-link" href="checkout.jsp">
          <svg width="1em" height="1em" viewBox="0 0 12 20" class="bi bi-bag" fill="currentColor"
            xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
              d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5H2z" />
          </svg>
          My Items
        </a>
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

                  <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Create New Item</p>

                  <form class="mx-1 mx-md-4" action="SubmitItem" method="POST">

                    <div class="d-flex flex-row align-items-center mb-4">
                      <div class="form-outline flex-fill mb-0">
                        <i class="fa-solid fa-signature"></i>
                        <label class="form-label" for="name">Name</label>
                        <input type="text"  name="name" id="name"  class="form-control" />
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <div class="form-outline flex-fill mb-0">
                        <i class="fa-solid fa-dollar-sign"></i>
                        <label class="form-label" for="price">Price</label>
                        <input type="text" name="price" id="price" class="form-control" />
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <div class="form-outline flex-fill mb-0">
                        <i class="fa-solid fa-file-image"></i>
                        <label class="form-label" for="image">Image</label>
                        <input type="file" name="image" id="image" class="form-control" />
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <div class="form-outline flex-fill mb-0">
                        <i class="fa-solid fa-file-pen"></i>
                        <label class="form-label" for="description">Description</label>
                        <input type="text" name="desc" id="desc" class="form-control" />
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <div class="form-outline flex-fill mb-0">
                        <i class="fa-solid fa-tag"></i>
                        <label class="form-label" for="tags">Tags</label>
                        <input type="text" name="tags" id="tags" class="form-control" />
                      </div>
                    </div>

                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                      <input type="submit" class="btn btn-primary btn-lg"/>
                    </div>

                  </form>

                </div>
                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                  <img src="images/register.svg" class="img-fluid" alt="Sample image">

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
      <p style="color: white; margin-bottom: -1%;">Created by Krishna, Sahithi, Brice & Kritin</p>
    </div>
    <!-- Bootstrap link -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
      crossorigin="anonymous"></script>

</body>

</html>