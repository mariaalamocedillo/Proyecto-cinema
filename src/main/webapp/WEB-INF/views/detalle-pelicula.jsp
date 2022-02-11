<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Pelicula</title>
  <!-- Bootstrap -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/album.css" rel="stylesheet"/>

</head>
<body>
<h1>Detalle Pelicula</h1>
<div id="main-wrapper" class="container">
  <div class="row justify-content-center">
    <div class="col-xl-10">
      <div class="card border-0">
        <div class="card-body p-0">
          <div class="row no-gutters">
            <div class="col-lg-6">
              <div class="p-5">
                <div class="mb-5">
                  <h3 class="h4 font-weight-bold text-theme">Login</h3>
                </div>

                <h6 class="h5 mb-0">Welcome back!</h6>
                <p class="text-muted mt-2 mb-5">Enter your email address and password to access admin panel.</p>

                <form>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">
                  </div>
                  <div class="form-group mb-5">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                  </div>
                  <button type="submit" class="btn btn-theme">Login</button>
                  <a href="#l" class="forgot-link float-right text-primary">Forgot password?</a>
                </form>
              </div>
            </div>

            <div class="col-lg-6 d-none d-lg-inline-block">
              <div class="account-block rounded-right">
                <div class="overlay rounded-right"></div>
                <div class="account-testimonial">
                  <h4 class="text-white mb-4">This  beautiful theme yours!</h4>
                  <p class="lead text-white">"Best investment i made for a long time. Can only recommend it for other users."</p>
                  <p>- Admin User</p>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- end card-body -->
      </div>
      <!-- end card -->

      <p class="text-muted text-center mt-3 mb-0">Don't have an account? <a href="register.html" class="text-primary ml-1">register</a></p>

      <!-- end row -->

    </div>
    <!-- end col -->
  </div>
  <!-- Row -->

  <!-- Bootstrap core JavaScript
================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/holder.min.js"></script>

</div>
</body>
</html>