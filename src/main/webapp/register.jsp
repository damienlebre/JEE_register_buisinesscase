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

            <h1 class="offset-1 mb-5"> S'inscrire</h1>

            <ul>
                <c:forEach items="${errorsHibernate}" var="hibernateError">
                    <li>${hibernateError.message}</li>
                </c:forEach>

                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>

             <div class="container form-container mt-5">
                <div class="row col-lg-12 mt-5">

                        <form method="post" class="register-form">

                            <!--mise en place du token de sécurité  (permet de vérifié que la personne qui soumet le formulaire (POST) et bien celle qui en a fait la demande (GET))     -->
                            <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}">

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="firstname" class="mb-2">Nom : </label>
                                <input class="form-control-lg"  id="firstname" type="text" name="firstname"  placeholder="Votre Nom"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="lastname" class="mb-2">Prénom : </label>
                                <input class="form-control-lg"  id="lastname" type="text" name="lastname"  placeholder="Votre prénom"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="email" class="mb-2">email : </label>
                                <input class="form-control-lg"  id="email" type="email" name="email"  placeholder="Votre adresse mail"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="country" class="mb-2">Pays :</label>
                                <select class="form-select form-select-lg mb-3 country-select" id="country" name="country">
                                    <option value="">Sélectionnez un pays</option>
                                    <c:forEach items="${Country.values()}" var="country">
                                        <option value="${country}">${country.getCountry()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="number" class="mb-2">Numéro de voie : </label>
                                <input class="form-control-lg"  id="number" type="number" name="number"  placeholder="Numéro de rue/voie"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="street" class="mb-2">Rue/voie : </label>
                                <input class="form-control-lg"  id="street" type="text" name="street"  placeholder="Nom de rue/voie"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="zipcode" class="mb-2">code postal : </label>
                                <input class="form-control-lg"  id="zipcode" type="text" name="zipcode"  placeholder="Zipcode"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="zipcode" class="mb-2">code postal : </label>
                                <input class="form-control-lg"  id="city" type="text" name="city"  placeholder="City"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3">
                                <label for="password" class="mb-2">Mot de passe : </label>
                                <input class="form-control-lg"  id="password" type="password" name="password"  placeholder="Mot de passe"/>
                            </div>

                            <div class="form-group col-lg-6 col-md-8 col-sm-8 d-flex flex-column mx-auto mb-3 ">
                                <label for="confirmPassword" class="mb-2">Confirmation Mot de passe : </label>
                                <input class="form-control-lg" id="confirmPassword" type="password" name="confirmPassword"  placeholder="Confirmation Mot de passe"/>
                            </div>

                            <div class="my-5 d-flex justify-content-center">
                                <input class="btn btn-custom-blue btn-lg"  type="submit"  value="Valider"/>
                            </div>


                        </form>

                        <p  class="text-center"><span class="fw-bold">Déjà inscrits? </span><a href="http://localhost:8080/login">Se connecter</a></p>

                </div>
            </div>
        </section>
        <%@include file="parts/footer.jsp"%>
    </body>
</html>
