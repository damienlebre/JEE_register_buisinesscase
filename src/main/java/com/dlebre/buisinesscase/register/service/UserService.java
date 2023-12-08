package com.dlebre.buisinesscase.register.service;

import com.dlebre.buisinesscase.register.models.User;
import com.dlebre.buisinesscase.register.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class UserService {

    private RoleService roleService;

    public UserService(){
        this.roleService = new RoleService();
    }

    public List<User> getUserByEmail(String email) {
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session session = sf.getCurrentSession();
            Transaction tx = session.beginTransaction();

            List<User> users = session.createQuery("FROM User u WHERE u.email=:email", User.class)
                    .setParameter("email", email).getResultList();

            tx.commit();
            return users;
        } catch (Exception e) {
            e.printStackTrace(); // ou loggez l'exception
            throw e; // Remontez l'exception pour une gestion plus globale
        }
    }


    public void registerUser(User user) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

//            user.addRole(this.roleService.getByName("User"));
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            session.persist(user);

            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace(); // ou loggez l'exception
            throw e; // Remontez l'exception pour une gestion plus globale
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }
    }

}