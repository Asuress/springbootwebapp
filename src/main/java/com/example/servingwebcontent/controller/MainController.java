package com.example.servingwebcontent.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.servingwebcontent.domain.Message;
import com.example.servingwebcontent.domain.User;
import com.example.servingwebcontent.repos.MessageRepo;

@Controller
public class MainController {
	@Autowired
	private MessageRepo messageRepo;

	@GetMapping("/")
	public String index(Map<String, Object> model) {
		return "index";
	}

	@GetMapping("/greeting")
	public String greeting(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
		Iterable<Message> messages = messageRepo.findAll();

		if (filter != null && !filter.isEmpty()) {
			messages = messageRepo.findByTag(filter);
		} else {
			messages = messageRepo.findAll();
		}

		model.addAttribute("messages", messages);
		model.addAttribute("filter", filter);

		return "greeting";
	}

	@PostMapping("/greeting")
	public String add(
			@AuthenticationPrincipal User user,
			@RequestParam String text,
			@RequestParam String tag, Map<String, Object> model) {
		Message message = new Message(text, tag, user);

		messageRepo.save(message);

		Iterable<Message> messages = messageRepo.findAll();

		model.put("messages", messages);

		return "greeting";
	}
}