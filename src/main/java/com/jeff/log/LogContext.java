package com.jeff.log;

public class LogContext {

	private static ThreadLocal<String> userId = new ThreadLocal<String>();

	private static ThreadLocal<String> ip = new ThreadLocal<String>();

	private static ThreadLocal<String> url = new ThreadLocal<String>();

	public static String getUserId() {
		return userId.get();
	}

	public static void setUserId(String _userId) {
		userId.set(_userId);
	}

	public static void removeUserId() {
		userId.remove();
	}

	public static String getIp() {
		return ip.get();
	}

	public static void setIp(String _ip) {
		ip.set(_ip);
	}

	public static void removeIp() {
		ip.remove();
	}

	public static String getUrl() {
		return url.get();
	}

	public static void setUrl(String _url) {
		url.set(_url);
	}

	public static void removeUrl() {
		url.remove();
	}
}
