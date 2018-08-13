package com.chuangli.study.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chuangli.study.pojo.User;
import com.chuangli.study.service.UserService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 注册判断
	 */
	@RequestMapping(value = "/registe.action", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkUserName(BigInteger id, Model model, HttpServletRequest request, HttpServletResponse response)
            throws ParseException {
        Map<String, Object> resultMap = new HashMap<String,Object>();
        int count = userService.ifExist(id);
        //System.out.println(count);
        boolean isExist=(count>0?true:false);
        resultMap.put("isExist", isExist);
        return resultMap;
    }
	/**
	 * 注册
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/submit.action", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ifExist(BigInteger id, String password, Model model, HttpSession session) {
        Map<String, Object> resultMap =  new HashMap<String,Object>();
		User user = new User();
		user.setId(id);;
		user.setPassword(password);
		String msg = userService.registe(user);
		resultMap.put("msg", msg);
		return resultMap;
	}
}
