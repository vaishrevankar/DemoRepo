package com.phoenix.test;

import com.phoenix.Check;


import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;


class LoginTest {

	@Test
	void test() {
		Check c=new Check();
		String output = c.checking("admin", "admin");
		assertEquals("success",output);
	}

}
