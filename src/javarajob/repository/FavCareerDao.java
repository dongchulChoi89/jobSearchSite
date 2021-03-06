package javarajob.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import javarajob.vo.FavCareer;

@Repository
public interface FavCareerDao {
	public ArrayList<FavCareer> favCareerList(String id);

	public void addFavCareer(FavCareer vo);

	public void removeFavCareer(FavCareer vo);

	public void removeFavCareerAccount(String id);

	public FavCareer getFavCareer(FavCareer vo);

}
