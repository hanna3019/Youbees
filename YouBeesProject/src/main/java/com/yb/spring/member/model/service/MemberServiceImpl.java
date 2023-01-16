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

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFreelancer(Freelancer f) {
		return mDao.insertFreelancer(sqlSession, f);
	}

	@Override
	public int insertCustomer(Customer c) {
		return mDao.insertCustomer(sqlSession, c);
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
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int deleteFreeMember(int freeNum) {
		return mDao.deleteFreeMember(sqlSession, freeNum);
	}

	@Override
	public int deleteCusMember(String userId) {
		return mDao.deleteCusMember(sqlSession, userId);
	}

	@Override
	public Customer loginMember(String userId) {
		return mDao.loginMember(sqlSession, userId);
	}
	
	@Override
	public Freelancer loginMemberF(String userId) {
		return mDao.loginMemberF(sqlSession, userId);
	}

	@Override
	public Customer loginMemberC(String userId) {
		return mDao.loginMemberC(sqlSession, userId);
	}

}
