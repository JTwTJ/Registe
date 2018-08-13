package com.chuangli.study.pojo;

import java.io.Serializable;
import java.math.BigInteger;

public class User implements Serializable {

	private BigInteger id;
	private String password;
	
	public BigInteger getId() {
		return id;
	}
	public void setId(BigInteger id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
