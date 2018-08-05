package com.duanhang.dao;

import java.util.List;
import java.util.Map;

import com.duanhang.entity.Blog;

/**
 * ����Dao�ӿ�
 * 
 * @author Administrator
 *
 */
public interface BlogDao {

	/**
	 * �������ڷ��·����ѯ
	 * 
	 * @return
	 */
	public List<Blog> countList();

	/**
	 * ��ҳ��ѯ����
	 * 
	 * @param map
	 * @return
	 */
	public List<Blog> list(Map<String, Object> map);

	/**
	 * ��ȡ�ܼ�¼��
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String, Object> map);

	/**
	 * ����id���Ҳ���ʵ��
	 * 
	 * @param id
	 * @return
	 */
	public Blog findById(Integer id);

	/**
	 * ���²�����Ϣ
	 * 
	 * @param blog
	 * @return
	 */
	public Integer update(Blog blog);

	/**
	 * ��ȡ��һ����������
	 * 
	 * @param id
	 * @return
	 */
	public Blog getLastBlog(Integer id);
	/**
	 * ��ȡ��һ����������
	 * 
	 * @param id
	 * @return
	 */
	public Blog getNextBlog(Integer id);

}