
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.dlebre.buisinesscase.register.enums.Country" %>
<html>
    <head>

        <title>Page d'enregistrement d'un nouvel utilisateur</title>

        <%@include file="parts/script-style.jsp" %>
    </head>
    <body>
    <%@include file="parts/menu.jsp" %>

        <section class="min-vh-100">

            <h1 class="offset-1 mb-5"> S'inscrire</h1>
            <%-- AFFICHAGE DES ERREURS --%>
            <div>
                <c:forEach items="${errorsHibernate}" var="hibernateError">
                    <p class="text-danger">${hibernateError.message}</p>
                </c:forEach>
                <c:forEach items="${errors}" var="error">
                    <p class="text-danger">${error}</p>
                </c:forEach>

            </div>
            <%-- FIN AFFICHAGE DES ERREURS --%>

            <%-- FORMULAIRE INSCRIPTION --%>
             <div class="container form-container mt-5">
                <div class="row col-lg-12 mt-5">

                        <form method="post" class="register-form mt-5 mx-auto w-75">

                            <!--mise en place du token de sécurité  (permet de vérifié que la personne qui soumet le formulaire (POST) et bien celle qui en a fait la demande (GET))     -->
                            <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}">
                            <%-- Input firstname   --%>
                            <div class="row">
                                <div class="form-group col-md-6 d-flex flex-column mx-auto mb-3">
                                    <label for="firstname" class="mb-2">Nom : </label>
                                    <input class="form-control-lg" value="${saisie.getFirstname()}" id="firstname" type="text" name="firstname"  placeholder="Votre Nom"/>
                                </div>
                                <%-- Input lastname   --%>
                                <div class="form-group col-md-6 d-flex flex-column mx-auto mb-3">
                                    <label for="lastname" class="mb-2">Prénom : </label>
                                    <input class="form-control-lg" value="${saisie.getLastname()}" id="lastname" type="text" name="lastname"  placeholder="Votre prénom"/>
                                </div>
                            </div>

                            <%-- Input email   --%>
                            <div class="form-group col-md-12 d-flex flex-column  mb-3">
                                <label for="email" class="mb-2">Email : </label>
                                <input class="form-control-lg"  value="${saisie.getEmail()}" id="email" type="email" name="email"  placeholder="Votre adresse mail"/>
                            </div>
                            <%-- Input pays   --%>
                            <div class="form-group col-md-6 d-flex flex-column mb-3">
                                <label for="country" class="mb-2">Pays :</label>
                                <select class="form-select form-select-lg mb-3 country-select" id="country" name="country">
                                    <option value="" disabled selected>Sélectionnez un pays</option>
                                    <c:forEach items="${Country.values()}" var="country">
                                        <option value="${country}">${country.getCountry()}</option>
                                    </c:forEach>

                                </select>
                            </div>

                            <div class="row">
                                <%-- Input number   --%>
                                <div class="form-group col-md-4  d-flex flex-column mx-auto mb-3">
                                    <label for="number" class="mb-2">Numéro de voie : </label>
                                    <input class="form-control-lg"  value="${saisie.getNumber()}" id="number" type="number" name="number"  placeholder="Numéro de rue/voie"/>
                                </div>
                                <%-- Input street   --%>
                                <div class="form-group col-md-8 d-flex flex-column mx-auto mb-3">
                                    <label for="street" class="mb-2">Rue/voie : </label>
                                    <input class="form-control-lg" value="${saisie.getStreet()}" id="street" type="text" name="street"  placeholder="Nom de rue/voie"/>
                                </div>
                            </div>

                            <div class="row">
                            <%-- Input zipcode   --%>
                                <div class="form-group col-md-6 d-flex flex-column mx-auto mb-3">
                                    <label for="zipcode" class="mb-2">Code postal : </label>
                                    <input class="form-control-lg" value="${saisie.getZipcode()}" id="zipcode" type="text" name="zipcode"  placeholder="Zipcode"/>
                                </div>
                                <%-- Input city   --%>
                                <div class="form-group col-md-6 d-flex flex-column mx-auto mb-3">
                                    <label for="city" class="mb-2">Ville : </label>
                                    <input class="form-control-lg" value="${saisie.getCity()}" id="city" type="text" name="city"  placeholder="City"/>
                                </div>

                            </div>


                                <%-- Input password   --%>
                                <div class="form-group col-md-12 d-flex flex-column  mb-3">
                                    <label for="password" class="mb-2">Mot de passe : </label>
                                    <input class="form-control-lg"  id="password" type="password" name="password"  placeholder="Mot de passe"/>
                                </div>
                                <%-- Input confirm password  --%>
                                <div class="form-group col-md-12 d-flex flex-column mb-3 ">
                                    <label for="confirmPassword" class="mb-2">Confirmation Mot de passe : </label>
                                    <input class="form-control-lg" id="confirmPassword" type="password" name="confirmPassword"  placeholder="Confirmation Mot de passe"/>
                                </div>

                            <%-- Input valider   --%>
                            <div class="my-5 d-flex justify-content-center">
                                <input class="btn btn-custom-blue btn-lg"  type="submit" value="Valider"/>
                            </div>


                        </form>
                        <%-- Lien espace de connexion  --%>
                        <p  class="text-center"><span class="fw-bold">Déjà inscrits? </span><a href="http://localhost:8080/login">Se connecter</a></p>

                </div>
            </div>
            <%-- FIN FORMULAIRE INSCRIPTION --%>
        </section>
        <%@include file="parts/footer.jsp"%>
    </body>
</html>
