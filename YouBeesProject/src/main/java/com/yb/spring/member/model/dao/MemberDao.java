package com.yb.spring.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Location;

@Repository
public class MemberDao {
	
	
	public ArrayList<Location> selectLocationList(SqlSessionTemplate sqlSession, int lNum){
		return (ArrayList)sqlSession.selectList("memberMapper.selectLocationList", lNum);
	}
	
	public ArrayList<Categories> selectServiceList(SqlSessionTemplate sqlSession, int sNum){
		return (ArrayList)sqlSession.selectList("memberMapper.selectServiceList", sNum);
	}
	
	
}
