package com.phoenix.test;

import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;

import com.phoenix.Check;

class Login2Test {

	@Test
	void test() {
		Check c=new Check();
		String output = c.checking("raja", "rani");
		assertEquals("failure",output);
	}

}
