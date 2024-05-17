package com.example.servingwebcontent.repos;

import org.springframework.data.repository.CrudRepository;

import com.example.servingwebcontent.domain.User;

public interface UserRepo extends CrudRepository<User, Long> {
	User findByUsername(String username);
}
