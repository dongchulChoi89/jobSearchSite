package javarajob.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import javarajob.vo.FavCompany;

@Repository
public interface FavCompanyDao {
    public ArrayList<FavCompany> favCompanyList(String id);

    public void addFavCompany(FavCompany vo);

    public void removeFavCompany(FavCompany vo);
    public void removeFavCompanyAccount(String id);
    public FavCompany getFavCompany(FavCompany vo);
}
