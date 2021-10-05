package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
private final LanguageRepository langRepo;
	
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	//Methods
	public List<Language> allLanguages() {
		return langRepo.findAll();
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> langs = langRepo.findById(id);
		if (langs.isPresent()) {
			return langs.get();
		} else {
			return null;
		}
	}
	
	public Language createLanguage(Language language) {
		return langRepo.save(language);
	}
	
	public Language updateLanguage(Language langup) {
		Optional<Language> langs = langRepo.findById(langup.getId());
		if (langs.isPresent()) {
			langs.get().setName(langup.getName());
			langs.get().setCreator(langup.getCreator());
			langs.get().setVersion(langup.getVersion());
			return langRepo.save(langs.get());
		} else {
			return null;
		}
	}
	
	public Language updateLanguage(Long id, String name, String creator, String version) {
		Optional<Language> langs = langRepo.findById(id);
		if (langs.isPresent()) {
			langs.get().setName(name);
			langs.get().setCreator(creator);
			langs.get().setVersion(version);
			return langRepo.save(langs.get());
		} else {
			return null;
		}
	}
	
	public void deleteLanguage(Long id) {
		langRepo.deleteById(id);
	}

}
