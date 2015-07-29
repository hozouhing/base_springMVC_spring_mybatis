package com.jeff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeff.authority.Auth;
import com.jeff.authority.AuthClass;
import com.jeff.page.Page;
import com.jeff.po.User;
import com.jeff.service.UserService;

@AuthClass
@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	// 返回json，localhost:8080/zyy2/user/addUser.do?username=111&password=111
	@Auth(role = "admin,user", description = "test1")
	@RequestMapping("addUser")
	@ResponseBody
	public User add(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		userService.add(user);
		return user;
	}

	@Auth(role = "admin", description = "test2")
	@RequestMapping("findByPage")
	@ResponseBody
	public Page<User> findByPage(User user) {
		return userService.findByPage(user);
	}

	// 返回index.jsp页面，localhost:8080/zyy2/user/test.do
	@Auth(role = "test", description = "test3")
	@RequestMapping("test")
	// @ResponseBody
	public String test() {
		return "index";
	}

}
