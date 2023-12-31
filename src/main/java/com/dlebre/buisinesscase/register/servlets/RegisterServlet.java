package com.dlebre.buisinesscase.register.servlets;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.dlebre.buisinesscase.register.enums.Country;
import com.dlebre.buisinesscase.register.models.User;
import com.dlebre.buisinesscase.register.service.RoleService;
import com.dlebre.buisinesscase.register.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

@WebServlet(name = "register", value = "")
public class RegisterServlet extends HttpServlet {

    private Validator validator;
    private RoleService roleService;
    private UserService userService;
    public void init() {
        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        validator = validatorFactory.getValidator();
        this.roleService = new RoleService();
        this.userService = new UserService();

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("countries", Country.values());
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //récupération de la saisie utilisateur
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String countryValue = request.getParameter("country");
        String numberParam = request.getParameter("number");
        Integer number = null;

        if (numberParam != null && !numberParam.isEmpty()) {
            try {
                number = Integer.valueOf(numberParam);
            } catch (NumberFormatException e) {
                // Gérer la conversion en cas d'erreur
            }
        }
        String street = request.getParameter("street");
        String zipcode = request.getParameter("zipcode");
        String city = request.getParameter("city");
        Country country = null;

        if (countryValue != null && !countryValue.trim().isEmpty()) {
            try {
                country = Country.valueOf(countryValue);
            } catch (IllegalArgumentException e) {
                // Gérer le cas où la valeur n'est pas un membre valide de l'énumération Country
            }
        }
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        User user = new User(firstname, lastname, email, number, street, zipcode, city, country, password, confirmPassword);

        //Verifie que l'email n'existe pas déja
        List<String> errorMessages = new ArrayList<>();

        if (!this.userService.getUserByEmail(user.getEmail()).isEmpty()){
            errorMessages.add("ce email est déja inscrit");
        }

        //Valildation du mot de passe et de sa confirmation
        if (!user.getPassword().equals(user.getConfirmPassword())){
            errorMessages.add("Le mot de passe et sa confirmation ne correspondent pas");
        }
        //Validation des erreurs hibernate
        Set<ConstraintViolation<User>> errors = this.validator.validate(user);

        if (!errors.isEmpty()) {
            for (ConstraintViolation<User> error : errors) {
                System.out.println("Hibernate Error: " + error.getMessage());
            }
        }

        if (errors.isEmpty() && errorMessages.isEmpty()){
           //Enregistrer
            this.userService.registerUser(user);
           //rediriger
            response.sendRedirect("http://localhost:8080/login?registersuccess");
//            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else {
            request.setAttribute("errorsHibernate", errors);
            request.setAttribute("errors", errorMessages);
            request.setAttribute("saisie", user); // garder les saisie des users
//          et rediriger vers la page d'inscription
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }
    public void destroy() {
    }
}