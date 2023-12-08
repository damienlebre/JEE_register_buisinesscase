package com.dlebre.buisinesscase.register.models;

import com.dlebre.buisinesscase.register.enums.Country;
import com.dlebre.buisinesscase.register.interfaces.RegisterGroup;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "utilisateur")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Basic
    @NotBlank(message = "Le nom ne peux pas être vide")
    private String firstname;

    @Basic
    @NotBlank(message = "Le prénom ne peux pas être vide")
    private String lastname;


    @Column(nullable = false, unique = true)
    @NotBlank(message = "L'email est obligatoire")
    @Email(message = "Le format de l'email n'est pas valide")
    private String email;


    @Basic
    @NotNull(message = "Le numéro ne peux pas être vide")
    private Integer number;

    @Basic
    @NotBlank(message = "Le nom de rue ne peux pas être vide")
    private String street;

    @Basic
    @NotBlank(message = "Le zipcode ne peux pas être vide")
    private String zipcode;

    @Basic
    @NotBlank(message = "Le nom de ville/commune ne peux pas être vide")
    private String city;

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @NotBlank(message = "Indiquer un mot de passe")
//    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$") //Minimum eight characters, at least one letter and one number
    private String password;

    @Transient
    private String confirmPassword;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Role> roles;

    public User() {
        this.roles = new ArrayList<Role>();
    }

    @Enumerated(EnumType.STRING)
    private Country country;

    public User(String firstname, String lastname,String email,Integer number, String street, String zicode, String city,Country country, String password, String confirmPassword) {
        this.roles = new ArrayList<Role>();
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.number = number;
        this.street = street;
        this.zipcode = zicode;
        this.city = city;
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
