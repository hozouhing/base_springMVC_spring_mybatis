package com.jeff.log;

import java.sql.Connection;
import java.util.Properties;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;

/**
 * 通过拦截<code>StatementHandler</code>的<code>prepare</code>方法，重写sql语句实现物理分页。
 * 签名里要拦截的类型只能是接口。
 * 
 * @author jeff he
 * 
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }) })
public class LogInterceptor implements Interceptor {
	private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();
	private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();
	private static final String UPDATE_MATCHER = "^.*update.*";
	private static final String INSERT_MATCHER = "^.*insert.*";

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler statementHandler = (StatementHandler) invocation
				.getTarget();
		MetaObject metaStatementHandler = MetaObject.forObject(
				statementHandler, DEFAULT_OBJECT_FACTORY,
				DEFAULT_OBJECT_WRAPPER_FACTORY);
		// 分离代理对象链(由于目标类可能被多个拦截器拦截，从而形成多次代理，通过下面的两次循环可以分离出最原始的的目标类)
		while (metaStatementHandler.hasGetter("h")) {
			Object object = metaStatementHandler.getValue("h");
			metaStatementHandler = MetaObject.forObject(object,
					DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
		}
		// 分离最后一个代理对象的目标类
		while (metaStatementHandler.hasGetter("target")) {
			Object object = metaStatementHandler.getValue("target");
			metaStatementHandler = MetaObject.forObject(object,
					DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
		}
		/**
		 * 上面的代码基本上是固定的
		 */
		MappedStatement mappedStatement = (MappedStatement) metaStatementHandler
				.getValue("delegate.mappedStatement");
		String sqlId = mappedStatement.getId();
		/*
		 * System.out.println("LogInterceptor"); System.out.println(sqlId);
		 * System.out.println(sqlId.matches(UPDATE_MATCHER) ||
		 * sqlId.matches(INSERT_MATCHER));
		 */
		if (sqlId.matches(UPDATE_MATCHER) || sqlId.matches(INSERT_MATCHER)) {
			BoundSql boundSql = (BoundSql) metaStatementHandler
					.getValue("delegate.boundSql");
			Object parameterObject = boundSql.getParameterObject();
			if (parameterObject == null)
				throw new NullPointerException("parameterObject is null!");
			else {
				String sql = boundSql.getSql();
				// 重写sql
				if (sqlId.matches(INSERT_MATCHER))
					sql = buildInsertSql(sql);
				else if (sqlId.matches(UPDATE_MATCHER))
					sql = buildUpdateSql(sql);
				metaStatementHandler.setValue("delegate.boundSql.sql", sql);
			}
		}
		// 将执行权交给下一个拦截器
		return invocation.proceed();
	}

	// 重写插入语句
	private String buildInsertSql(String sql) {
		StringBuilder insertSql = new StringBuilder(sql);
		String createId = LogContext.getUserId();
		insertSql.insert(insertSql.indexOf(")"), ",create_dt,create_id");
		insertSql.insert(insertSql.lastIndexOf(")"), ",now(),'" + createId
				+ "'");
		return insertSql.toString();
	}

	// 重写更新语句
	private String buildUpdateSql(String sql) {
		StringBuilder updateSql = new StringBuilder(sql);
		String updateId = LogContext.getUserId();
		updateSql.insert(updateSql.indexOf("where"),
				",update_dt=now(),update_id='" + updateId + "' ");
		return updateSql.toString();
	}

	@Override
	public Object plugin(Object target) {
		// 当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的次数
		if (target instanceof StatementHandler) {
			return Plugin.wrap(target, this);
		} else {
			return target;
		}
	}

	@Override
	public void setProperties(Properties properties) {
	}

}
