package com.ericbarajas.safetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.ericbarajas.safetravels.models.Travel;
import com.ericbarajas.safetravels.services.TravelService;

@Controller
public class TravelController {
//	IMPORT OUR SERVICE / DEPENDENCY INJECTION
	@Autowired
	TravelService travelServ;
	
	
    
//	READ ONE USER show one travels title description etc.
	@GetMapping("/travels/{id}") 
	public String showOne(
		@PathVariable("id") Long id,
		Model model
	) {
//		RETRIEVE ONE BOOK FROM DB
		Travel oneTravel = travelServ.findTravel(id);
		
//		PASS THE INFORMATION TO THE JSP
		model.addAttribute("travel", oneTravel);
		return "show.jsp";
	}
	
	
//	ASSIGNMENT
//	CREATE AND READ ALL ON ONE PAGE - show all the travels with title description etc.
    @GetMapping("/expenses")
    public String index(
    		@ModelAttribute("aTravel") Travel emptyTravelObj,
    		Model model) {
        List<Travel> travels = travelServ.allTravels();
        model.addAttribute("travels", travels);
        return "index.jsp";
    }
    
//  processes the form
  @PostMapping("/expenses")
  public String create(@Valid @ModelAttribute("aTravel") Travel filledTravelObj, BindingResult result) {
      if (result.hasErrors()) {
          return "index.jsp";
      } else {
          travelServ.createTravel(filledTravelObj);
          return "redirect:/expenses";
      }
  }
//  CREATE AND READ ALL
  
//  UPDATE - update expenses
  	@GetMapping("/expenses/edit/{id}")
  	public String edit(
  			@PathVariable("id") Long travelId, Model model ) {
//  		GRAB ONE USER FROM DB
  		Travel oneTravel = travelServ.findTravel(travelId);
//  		PASS ONE USER TO JSP
  		model.addAttribute("travelObj", oneTravel);
  		return "edit.jsp";
  	}
  	@PutMapping("/expenses/edit/{id}")
    public String update(@Valid @ModelAttribute("aTravel") Travel filledTravelObj, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            travelServ.createTravel(filledTravelObj);
            return "redirect:/expenses";
        }
  	}
//	UPDATE
 
  
//  DELETE
  	@DeleteMapping("/expenses/{id}")
  	public String delete(@PathVariable("id") Long travelId) {
  		travelServ.deleteTravel(travelId);
  		return "redirect:/expenses";
  	}
//  DELETE
    
    
}

