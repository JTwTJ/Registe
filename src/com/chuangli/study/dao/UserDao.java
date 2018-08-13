package com.chuangli.study.dao;

import java.math.BigInteger;

import com.chuangli.study.pojo.User;

public interface UserDao {
    Integer ifExist(BigInteger id);
	void registe(User user);
}
