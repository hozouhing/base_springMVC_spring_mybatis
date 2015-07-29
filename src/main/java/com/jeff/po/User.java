package com.jeff.po;

import java.io.Serializable;
import java.util.UUID;

@SuppressWarnings("serial")
public class User implements Serializable {

	private String id;
	private String username;
	private String password;

	public User() {
		super();
		UUID uuid = UUID.randomUUID();
		this.id = uuid.toString();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
