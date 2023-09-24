package com.dlebre.buisinesscase.register.models;

import com.dlebre.buisinesscase.register.enums.Country;
import com.dlebre.buisinesscase.register.interfaces.RegisterGroup;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "utilisateur")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;


    @Column(unique = true)
    @NotBlank(message = "Veuillez saisir un email")
    @Email(message = "Merci de saisir une adresse valide")
    private String email;

    @Basic
    @NotBlank(message = "Le nom ne peux pas être vide")
    @Column(name = "firstname" , length = 255, nullable = false)
    private String firstname;

    @Basic
    @NotBlank(message = "Le prénom ne peux pas être vide")
    @Column(name = "lastname" , length = 255, nullable = false)
    private String lastname;

    private String password;

    @Transient
    private String confirmPassword;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Role> roles;

    public User() {
        this.roles = new ArrayList<Role>();
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "country", length = 255)
    private Country country;

    public User(String firstname, String lastname,String email, Country country, String password, String confirmPassword) {
        this.roles = new ArrayList<Role>();
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.country = country;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }

    public void addRole(Role role){
        this.roles.add(role);
    }

    public void removeRole(Role role){
        this.roles.remove(role);
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }


    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }
}
