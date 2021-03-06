package javarajob.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javarajob.repository.CareerDao;
import javarajob.vo.Career;
import javarajob.vo.Career_Sch;

@Service
public class CareerService {
	@Autowired(required = false)
	CareerDao dao;

	public void insertCareer(Career vo) {
		dao.insertCareer(vo);
	}

	public ArrayList<Career> listCareer(Career_Sch sch) {
		return dao.listCareer(sch);
	}

	public Career getCareer(int careerid) {
		return dao.getCareer(careerid);
	}

	public void deleteCareer(int careerid) {
		dao.deleteCareer(careerid);
	}

	public void updateCareer(Career upt) {
		dao.updateCareer(upt);
	}
	
	public ArrayList<Career> listCareerforindex() {
		return dao.listCareerForIndex();
	}
	
	public int getCount(){
		return dao.getCount();
	}
	
	public ArrayList<Career> listCareerForBookmark(String id){
		return dao.listCareerforBookmark(id);
	}
	
	public ArrayList<Career> listCareerForBookmarkOrderByBookmark(String id){
		return dao.listCareerforBookmarkOrderByBookmark(id);
	}
	
	public int getFavCount(String id){
		return dao.getFavCount(id);
	}
	
	public int getFavCountCompany(String id){
		return dao.getFavCountCompany(id);
	}
	
	public ArrayList<Career> listCareerForIndexSelect(int industry) {
		return dao.listCareerForIndexSelect(industry);
	}

	public ArrayList<Career> listCareerForIndexOrderByBookmark(){
		return dao.listCareerForIndexOrderByBookmark();
	}
}
