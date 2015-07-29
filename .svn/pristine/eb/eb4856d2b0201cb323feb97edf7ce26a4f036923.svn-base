package com.jeff.testUtil;

import org.junit.Test;

public class CommonTest {

	@Test
	public void decorateInsert() {
		StringBuilder insertSql = new StringBuilder(
				"insert into `user` (id,username,password) values ('0','0','0')");
		insertSql.insert(insertSql.indexOf(")"), ",create_dt,create_id");
		insertSql.insert(insertSql.lastIndexOf(")"), ",now(),'1'");
		System.out.println(insertSql);
	}

	@Test
	public void decorateUpdate() {
		StringBuilder updateSql = new StringBuilder(
				"update from `user` set password='123456' where id='0'");
		updateSql.insert(updateSql.indexOf("where"),
				",update_dt=now(),update_id='1' ");
		System.out.println(updateSql);
	}

	@Test
	public void regular() {
		String sql= "inserUser";
		System.out.println(sql.matches("^insert.*"));
	}

}
