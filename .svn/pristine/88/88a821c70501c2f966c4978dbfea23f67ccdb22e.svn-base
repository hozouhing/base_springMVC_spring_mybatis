package com.jeff.log;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jeff.po.User;

/**
 * 将分页的pager数据嵌入localthread中
 * 
 * @author jeff he
 *
 */
public class LogAndPermitFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		String userId = "";
		try {
			User user = (User) session.getAttribute("userSeession");
			if (user != null)
				userId = user.getId();
			else
				userId = "session中没有user";
		} catch (Exception e) {
			userId = "获取userid出现异常";
		}
		try {
			// 将LOG数据放入当前线程
			LogContext.setUserId(userId);
			chain.doFilter(req, resp);
		} finally {
			// 清除LOG数据
			LogContext.removeUserId();
		}
	}

	public void init(FilterConfig cfg) throws ServletException {

	}

	public void destroy() {

	}

}
