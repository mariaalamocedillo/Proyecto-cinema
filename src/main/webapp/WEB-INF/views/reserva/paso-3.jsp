<%--
  Created by IntelliJ IDEA.
  User: maria
  Date: 20/02/2022
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pago reserva</title>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/estilos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

</head>

<body class="imgfondo mt-0">
<jsp:include page="/WEB-INF/layout/navBar.jsp" ></jsp:include>

<main>
    <div class="container">

        <section class="section register min-vh-100 d-flex flex-column text-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10 d-flex flex-column align-items-center justify-content-center">

                        <div class="card rounded-xl justify-content-between m-auto w-100">
                            <div class="card-header">
                                <nav>
                                    <ol class="breadcrumb mb-0" style="--bs-breadcrumb-divider: '>';">
                                        <li class="breadcrumb-item">Reserva</li>
                                        <li class="breadcrumb-item">Asientos</li>
                                        <li class="breadcrumb-item active">Pago</li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="card-body">

                                <div>
                                    <div class="row">
                                        <div class="col-md-4 order-md-2 mb-4">
                                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="text-muted">Entradas para ${reserva.proyeccion.pelicula.titulo}</span>
                                                <span class="badge badge-secondary badge-pill">${entradas.size()}</span>
                                            </h4>
                                            <!--Resumen de la compra-->
                                            <ul class="list-group mb-3">
                                                <c:forEach var="entrada" items="${entradas}">
                                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                        <div>
                                                            <h6 class="my-0">Entrada adulto ${entrada.getName()}</h6>
                                                            <small class="text-muted">${entrada.sala.nombre}</small>
                                                        </div>
                                                        <span class="text-muted">8,50???</span>
                                                    </li>
                                                </c:forEach>

                                                <li class="list-group-item d-flex justify-content-between">
                                                    <span>Total </span>
                                                    <strong>${reserva.precio}???</strong>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-8 order-md-1">
                                            <form class="needs-validation" novalidate="" method="post" action="${mvc.basePath}/reserva/pagada">
                                                <h4 class="mb-3">Pago</h4>

                                                <div class="d-block my-3">
                                                    <div class="custom-control custom-radio">
                                                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                                                        <label class="custom-control-label" for="credit">Tarjeta de cr??dito</label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label for="cc-name">Nombre completo</label>
                                                        <input type="text" class="form-control" id="cc-name" value="${clienteName}" placeholder="" required="">
                                                        <small class="text-muted"></small>
                                                        <div class="invalid-feedback">
                                                            El nombre es necesario
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label for="cc-number">N??mero de la tarjeta</label>
                                                        <input type="number" name="num-tarjeta" class="form-control" id="cc-number" placeholder="" required="">
                                                        <div class="invalid-feedback">
                                                            El n??mero de la tarjeta es necesario
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row justify-content-center">
                                                    <div class="col-md-5 mb-5">
                                                        <label for="cc-expiration">Caducidad</label>
                                                        <input type="month" class="form-control" id="cc-expiration" placeholder="" required="">
                                                        <div class="invalid-feedback">
                                                            Debe introducir la caducidad de la tarjeta
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5 mb-5">
                                                        <label>CVC</label>
                                                        <input type="number" class="form-control" name="cc-cvv" placeholder="" required="" min="1" max="9999">
                                                        <div class="invalid-feedback">
                                                            El CVC debe ser entre 0 y 4 cifras
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="text" name="reserva" value="${reserva.id}" hidden>
                                                <c:if test="${mensaje.texto != null}">
                                                    <div class="col-md-12">
                                                        <p class="alert alert-danger">${mensaje.texto}</p>
                                                    </div>
                                                </c:if>
                                                <button class="btn col-5 btn-primary btn-lg btn-block" type="submit">Pagar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

        </section>

    </div>
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';

        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');

            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/holder.min.js"></script></body>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/tinymce/tinymce.min.js"></script>


<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>

</html>