package com.phoenix;

public class Check {
	public String checking(String username,String password) {
	       if (username.equals("admin") && password.equals("admin")) {
	          
	           return "success";
	       } else {
	          
	           return "failure";
	}
	}

}
