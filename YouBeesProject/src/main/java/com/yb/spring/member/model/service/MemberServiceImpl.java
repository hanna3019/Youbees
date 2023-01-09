package com.yb.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yb.spring.member.model.dao.MemberDao;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Customer;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;
import com.yb.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFreelancer(Freelancer f) {
		return 0;
	}

	@Override
	public int insertCustomer(Customer c) {
		return 0;
	}

	@Override
	public Member loginMember(Member m) {
		return null;
	}

	@Override
	public ArrayList<Location> selectLocationList(int lnum) {
		return mDao.selectLocationList(sqlSession, lnum);
	}

	@Override
	public ArrayList<Categories> selectServiceList(int sNum) {
		return mDao.selectServiceList(sqlSession, sNum);
	}

	@Override
	public int freeIdCheck(String checkId) {
		return 0;
	}

	@Override
	public int cusIdCheck(String checkId) {
		return 0;
	}

	@Override
	public int deleteFreeMember(String userId) {
		return 0;
	}

	@Override
	public int deleteCusMember(String userId) {
		return 0;
	}
	
	public int deleteCusMember2(String userId) {
		return 0;
	}
}