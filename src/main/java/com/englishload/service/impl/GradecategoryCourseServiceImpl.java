package com.englishload.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.englishload.mapper.GradecategoryCourseMapper;
import com.englishload.po.GradecategoryCourse;
import com.englishload.service.GradecategoryCourseService;

@Service
public class GradecategoryCourseServiceImpl implements GradecategoryCourseService {
  @Autowired
  GradecategoryCourseMapper gradecategoryCourseMapper;
	@Override
	public int insertGradecategoryCourse(GradecategoryCourse record) {
		
		return gradecategoryCourseMapper.insertGradecategoryCourse(record);
	}
	@Override
	public int updateGradecategoryCourse(GradecategoryCourse record) {
		// TODO Auto-generated method stub
		return gradecategoryCourseMapper.updateByPrimaryKey(record);
	}

}
