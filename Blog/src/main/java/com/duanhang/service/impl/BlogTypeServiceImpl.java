package com.duanhang.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.duanhang.dao.BlogTypeDao;
import com.duanhang.entity.BlogType;
import com.duanhang.service.BlogTypeService;

/**
 * 博客类型Service实现类
 * 
 * @author Administrator
 *
 */
@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

	@Resource
	private BlogTypeDao blogTypeDao;

	public List<BlogType> countList() {
		return blogTypeDao.countList();
	}

	public List<BlogType> list(HashMap<String, Object> map) {
		return blogTypeDao.list(map);
	}

	public long getTotal(HashMap<String, Object> map) {
		return blogTypeDao.getTotal(map);
	}

	public Integer add(BlogType blogType) {
		return blogTypeDao.add(blogType);
	}

	public Integer update(BlogType blogType) {
		return blogTypeDao.update(blogType);
	}

	public Integer delete(Integer id) {
		return blogTypeDao.delete(id);
	}

}
