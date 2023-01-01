package com.ericbarajas.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ericbarajas.safetravels.models.Travel;
import com.ericbarajas.safetravels.repositories.TravelRepository;
@Service
public class TravelService {
    // adding the travel repository as a dependency
    private final TravelRepository travelRepository;
    
    public TravelService(TravelRepository travelRepository) {
        this.travelRepository = travelRepository;
    }
    // returns all the travels
    public List<Travel> allTravels() {
        return travelRepository.findAll();
    }
    // creates a travel
    public Travel createTravel(Travel b) {
        return travelRepository.save(b);
    }
    // retrieves a travel
    public Travel findTravel(Long id) {
    	return travelRepository.findById(id).orElse(null);
    	
    	//        Optional<Travel> optionalTravel = travelRepository.findById(id);
        //        if(optionalTravel.isPresent()) {
//            return optionalTravel.get();
//        } else {
//            return null;
//        }
    }
//    updates one travel
//    get travel
    public Travel updateTravel(Long id, String expense, String vendor, Double amount, String description) {
//    	putting whatever travel by id into the variable newTravel
    	Travel newTravel = findTravel(id);
//    	setting/updating the newTravels title...(parameters)
    	newTravel.setExpense(expense);
    	newTravel.setVendor(vendor);
    	newTravel.setAmount(amount);
    	newTravel.setDescription(description);
//    	return new updated travel
    	return travelRepository.save(newTravel);
    }
    
    
//    deletes one travel
//    grabbing a travel by its id
    public void deleteTravel(Long id) {
//    	deletes the entity(a particular travel) with the given id
    	travelRepository.deleteById(id);
    }
}

