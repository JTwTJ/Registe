package com.chuangli.study.service;

import java.math.BigInteger;

import com.chuangli.study.pojo.User;

public interface UserService {

	public Integer ifExist(BigInteger id);
	public String registe(User user);
}
