package com.upmc.parisup.DAO.DAOImpl;

import java.util.List;

import org.hibernate.Session;

import com.upmc.parisup.DAO.DAO;
import com.upmc.parisup.persistence.MyPostgreSQLPersistence;

public class MyPostgreSQLDAOImpl<T> implements DAO<T> {
	protected MyPostgreSQLPersistence sql = MyPostgreSQLPersistence.getInstance();
	private Class<T> typeT;

	public MyPostgreSQLDAOImpl(Class<T> t) {
		typeT = t;
	}

	public Class<T> getTypeT() {
		return typeT;
	}

	public T get(Long id) {
		Session session = sql.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		T t = typeT.cast(session.get(typeT, id));
		session.getTransaction().commit();

		return t;
	}

	public void add(T obj) {
		Session session = sql.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(obj);
		session.getTransaction().commit();
	}

	public void delete(String type, String id) {

	}

	public void update(T obj) {
		Session session = sql.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.update(obj);
		session.getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		Session session = sql.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<T> l = session.createCriteria(typeT).list();
		session.getTransaction().commit();

		return l;
	}

	public void deleteAll(String type) {

	}
}