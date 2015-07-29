package com.jeff.page;

import java.util.List;

/**
 * 分页对象
 * 
 * @author jeff he
 *
 * @param <T>
 */
public class Page<T> {
	/**
	 * 分页的大小?
	 */
	private int size;
	/**
	 * 分页的起始页
	 */
	private int offset;
	/**
	 * 总记录数
	 */
	private Long totalCount;
	/**
	 * 总页数
	 */
	private Long totalPage;
	/**
	 * 分页的数据?
	 */
	private List<T> data;

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public Long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
}
