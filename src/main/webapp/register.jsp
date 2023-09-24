<%--
  Created by IntelliJ IDEA.
  User: aero
  Date: 18/09/2023
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.dlebre.buisinesscase.register.enums.Country" %>
<html>
    <head>

        <title>Page d'enregistrement nouvel utilisateur</title>

        <%@include file="parts/script-style.jsp" %>
    </head>
    <body>
    <%@include file="parts/menu.jsp" %>

        <section class="min-vh-100">

            <h1 class="offset-1 mb-5"> S'incrire</h1>

            <ul>
                <c:forEach items="${errorsHibernate}" var="hibernateError">
                    <li>${hibernateError.message}</li>
                </c:forEach>

                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>

             <div class="container">
                <div class="row col-lg-10">

                        <form method="post" class="register-form">

                            <!--mise en place du token de sécurité  (permet de vérifié que la perosnne qui soumet le formulaire (POST) et bien celle qui en a fait la demande (GET))     -->
                            <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}">

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="firstname" class="mb-2 fw-semibold">Nom : </label>
                                <input class="form-control-lg"  id="firstname" type="text" name="firstname"  placeholder="Votre Nom"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="lastname" class="mb-2 fw-semibold">Prénom : </label>
                                <input class="form-control-lg"  id="lastname" type="text" name="lastname"  placeholder="Votre prénom"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="email" class="mb-2 fw-semibold">email : </label>
                                <input class="form-control-lg"  id="email" type="email" name="email"  placeholder="Votre adresse mail"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="country" class="mb-2 fw-semibold">Pays :</label>
                                <select class="form-select form-select-lg mb-3 country-select" id="country" name="country">
                                    <option value="">Sélectionnez un pays</option>
                                    <c:forEach items="${Country.values()}" var="country">
                                        <option value="${country}">${country.getCountry()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="password" class="mb-2 fw-semibold">Mot de passe : </label>
                                <input class="form-control-lg"  id="password" type="password" name="password"  placeholder="Mot de passe"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3 ">
                                <label for="confirmPassword" class="mb-2 fw-semibold">Confirmation Mot de passe : </label>
                                <input class="form-control-lg" id="confirmPassword" type="password" name="confirmPassword"  placeholder="Confirmation Mot de passe"/>
                            </div>

                            <div class="mt-3 mb-5 col-2 offset-lg-3 offset-md-6 offset-sm-6">
                                <input   type="submit"  value="Valider"/>
                            </div>

                        </form>

                        <p  class="text-center">Déjà inscrits?<a href="http://localhost:8080/login">Se connecter</a></p>

                </div>
            </div>
        </section>
        <%@include file="parts/footer.jsp"%>
    </body>
</html>
