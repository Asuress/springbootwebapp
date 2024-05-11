package com.example.servingwebcontent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.servingwebcontent.domain.Message;
import com.example.servingwebcontent.repos.MessageRepo;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class GreetingController {
	@Autowired
	private MessageRepo messageRepo;

	@GetMapping("/greeting")
	public String greeting(
			@RequestParam(name = "name", required = false, defaultValue = "World") String name,
			Model model) {
		model.addAttribute("name", name);
		return "greeting";
	}

	@GetMapping()
	public String index(@RequestParam(name = "username", required = false, defaultValue = "user") String username,
			Model model) {

		Iterable<Message> messages = messageRepo.findAll();

		model.addAttribute("username", username);
		model.addAttribute("messages", messages);

		return "index";
	}

	@PostMapping("login")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		model.addAttribute("username", username);

		return "index";
	}

	@PostMapping("message")
	public String addMessage(@RequestParam String text, @RequestParam String tag, @RequestParam String username,
			Model model) {

		Message message = new Message(text, tag, username);

		messageRepo.save(message);

		Iterable<Message> messages = messageRepo.findAll();

		model.addAttribute("messages", messages);

		return "index";
	}

}
