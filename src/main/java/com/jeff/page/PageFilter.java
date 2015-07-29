package com.jeff.page;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 将分页的pager数据嵌入localthread中
 * 
 * @author jeff he
 *
 */
public class PageFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		Integer pageSize = 10;
		Integer pageOffset = 0;
		String order = "ASC";
		try {
			// 尝试获取分页大小并强制转为integer
			pageSize = Integer.parseInt(req.getParameter("pageSize"));
		} catch (NumberFormatException e) {
			// 捕获异常，设置为默认分页10
			pageSize = 10;
		}
		try {
			// 尝试获取起始页大小并强制转为integer
			pageOffset = Integer.parseInt(req.getParameter("offset"));
		} catch (NumberFormatException e) {
			// 捕获异常，设置为默认起始页为1
			pageOffset = 1;
		}
		// 尝试获取order
		if (req.getParameter("order") != null) {
			order = req.getParameter("order");
		}
		try {
			// 将分页数据放入当前线程
			PageContext.setOrder(order);
			PageContext.setSort(req.getParameter("sort"));
			PageContext.setPageOffset(pageOffset);
			PageContext.setPageSize(pageSize);
			// pass the request
			chain.doFilter(req, resp);
		} finally {
			// 清除分页数据
			PageContext.removeOrder();
			PageContext.removeSort();
			PageContext.removePageOffset();
			PageContext.removePageSize();
			PageContext.removeTotalCount();
			PageContext.removeTotalPage();
		}
	}

	public void init(FilterConfig cfg) throws ServletException {

	}

	public void destroy() {

	}

}
