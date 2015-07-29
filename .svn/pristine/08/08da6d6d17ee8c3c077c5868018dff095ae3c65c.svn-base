package com.jeff.serviceImpl;

import java.io.Serializable;
import java.util.List;

import com.jeff.mapper.BaseMapper;
import com.jeff.page.Page;
import com.jeff.page.PageContext;
import com.jeff.service.BaseService;

public class BaseServiceImpl<T, ID extends Serializable> implements
		BaseService<T, ID> {

	private BaseMapper<T, ID> baseMapper;

	public BaseMapper<T, ID> getBaseMapper() {
		return baseMapper;
	}

	public void setBaseMapper(BaseMapper<T, ID> baseMapper) {
		this.baseMapper = baseMapper;
	}

	@Override
	public int add(T t) {
		return baseMapper.insert(t);
	}

	@Override
	public int deleteById(ID id) {
		return baseMapper.deleteById(id);
	}

	@Override
	public int update(T t) {
		return baseMapper.update(t);
	}

	@Override
	public T getById(ID id) {
		return baseMapper.getById(id);
	}

	@Override
	public List<T> list(T t) {
		return baseMapper.list(t);
	}

	@Override
	public Page<T> findByPage(T t) {
		List<T> data = baseMapper.findByPage(t);
		return buildPage(data);
	}

	@Override
	public Page<T> buildPage(List<T> data) {
		Page<T> page = new Page<T>();
		page.setData(data);
		page.setOffset(PageContext.getPageOffset());
		page.setSize(PageContext.getPageSize());
		page.setTotalCount(PageContext.getTotalCount());
		page.setTotalPage(PageContext.getTotalPage());
		return page;
	}

}
