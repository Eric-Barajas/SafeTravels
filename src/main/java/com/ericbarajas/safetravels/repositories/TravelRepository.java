package com.ericbarajas.safetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ericbarajas.safetravels.models.Travel;

@Repository
public interface TravelRepository extends CrudRepository<Travel, Long>{
    // this method retrieves all the travels from the database
//	have to declare findAll method
    List<Travel> findAll();
    
    
//    // this method finds travels with descriptions containing the search string
//    List<Travel> findByDescriptionContaining(String search);
//    // this method counts how many titles contain a certain string
//    Long countByTitleContaining(String search);
//    // this method deletes a travel that starts with a specific title
//    Long deleteByTitleStartingWith(String search);

    
}

