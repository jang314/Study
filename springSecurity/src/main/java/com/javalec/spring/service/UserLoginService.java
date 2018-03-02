package com.javalec.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.javalec.spring.mapper.MemberMapper;
import com.javalec.spring.model.MemberInfo;

@Service
public class UserLoginService implements UserDetailsService {
	@Autowired 
	MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberInfo memberInfo = mapper.loginUser(username);
		if(memberInfo == null) {
			throw new UsernameNotFoundException("User Not Found");
		}
		return memberInfo;
	}

}
