package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

@Controller
public class LanguageController {
private final LanguageService langService;
	
	public LanguageController(LanguageService langService) {
		this.langService = langService;
	}
	
	@RequestMapping("/")
	public String redirect() {
		return "redirect:/languages";
	}
	
	//When a user visits "/languages", we want to show them all the languages that we have in our database.
	@RequestMapping("/languages")
	public String index(@ModelAttribute("language")Language language, Model model) {
		List<Language> allLangs = langService.allLanguages();
		model.addAttribute("languages", allLangs);
		return "index.jsp";
	}
	
	@RequestMapping(value="/languages", method=RequestMethod.POST)
	public String create(
			@Valid @ModelAttribute("language") Language language,
			BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			List<Language> allLangs = langService.allLanguages();
			model.addAttribute("languages", allLangs);
			return "index.jsp";
		} else {
			langService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language langup = langService.findLanguage(id);
		if (langup != null) {
			model.addAttribute("language", langup);
			return "show.jsp";
		} else {
			return "redirect:/languages";
		}
		
	}
	
	@RequestMapping("/languages/{id}/edit")
	public String edit(
			@PathVariable("id") Long id,
			@ModelAttribute("language") Language language,
			Model model) {
		Language langup = langService.findLanguage(id);
		if (langup != null) {
			model.addAttribute("langup", langup);
			return "edit.jsp";
		} else {
			return "redirect:/languages/" + id;
		}
	}
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	public String update(
			@PathVariable("id") Long id,
			@Valid @ModelAttribute("language") Language language,
			BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			Language langup = langService.findLanguage(id);
			model.addAttribute("langup", langup);
			return "edit.jsp";
		} else {
			langService.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		langService.deleteLanguage(id);
		return "redirect:/languages";
	}

}
