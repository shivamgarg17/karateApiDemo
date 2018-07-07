package com.mito.controller;

import java.util.UUID;

public class TokenController {
    
	private static String randomString;
	public static String generateRandomToken() {
		
		randomString=UUID.randomUUID().toString();
		return randomString;
	}
}
