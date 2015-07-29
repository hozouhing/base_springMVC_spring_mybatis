package com.jeff.util;

import java.io.IOException;
import java.util.Properties;

public class PropertiesUtil {
	private static Properties prop;

	public static Properties getProp(String name) {
		try {
			if (prop == null) {
				prop = new Properties();
				prop.load(PropertiesUtil.class.getClassLoader()
						.getResourceAsStream(name));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prop;
	}

}
