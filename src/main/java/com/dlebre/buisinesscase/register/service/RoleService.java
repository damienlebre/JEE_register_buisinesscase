package com.dlebre.buisinesscase.register.service;

import com.dlebre.buisinesscase.register.models.Role;
import com.dlebre.buisinesscase.register.models.User;
import com.dlebre.buisinesscase.register.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class RoleService {

    public Role getByName(String role) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        Role roleObject = session.createQuery("FROM Role r WHERE r.roleName=:role", Role.class)
                .setParameter("role", role).getSingleResult();

        tx.commit();
        session.close();

        return roleObject;
    }

    public void registerUser(User user){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        session.save(user);

        tx.commit();
        session.close();

    }
}
