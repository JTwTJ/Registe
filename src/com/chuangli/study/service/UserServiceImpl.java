package com.chuangli.study.service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jredis.JredisConnection;
import org.springframework.stereotype.Service;

import com.chuangli.study.dao.UserDao;
import com.chuangli.study.pojo.User;
import com.chuangli.study.util.RedisUtil;

import redis.clients.jedis.Jedis;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public Integer ifExist(BigInteger id) {
		//从redis缓存数据中查询数据
		Jedis jedis = new Jedis();
		String result = jedis.get(id+"");
		//System.out.println(result);
		if(result != null) {
			return 1;
		}else 
		{
			return userDao.ifExist(id);
		}
	}
	@Override
	public String registe(User user) {
		Jedis jedis = new Jedis();
		BigInteger id = user.getId();
		String password = user.getPassword();
		
		//将数据存入redis缓存中
		jedis.set(id+"", id+"");
		jedis.set(password, password);
		userDao.registe(user);
		
		return "注册成功！";
	}
}
