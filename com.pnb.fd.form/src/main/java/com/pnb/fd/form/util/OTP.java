package com.pnb.fd.form.util;

import com.liferay.counter.kernel.service.CounterLocalServiceUtil;

import com.liferay.portal.kernel.util.ParamUtil;
import com.pnb.fd.service.model.Form;
import com.pnb.fd.service.service.FormLocalServiceUtil;

import java.security.SecureRandom;

import javax.portlet.ResourceRequest;

public class OTP {
	 
	// add method
  public static void addDetails(ResourceRequest resourceRequest) {
	  Long applicantId = CounterLocalServiceUtil.increment();
    Form form =    FormLocalServiceUtil.createForm(applicantId);

	String name	= ParamUtil.getString(resourceRequest, "name");
	String mobileno	= ParamUtil.getString(resourceRequest, "mobile-no");
	String email	= ParamUtil.getString(resourceRequest, "email");
	String location	= ParamUtil.getString(resourceRequest, "location");
	String amount	= ParamUtil.getString(resourceRequest, "fd-amount");
	
	  form.setFullname(name);
      form.setMobile(mobileno);
      form.setEmail(email);
      form.setLocation(location);
      form.setAmount(amount);
      
      FormLocalServiceUtil.addForm(form);
	
  }
	
	 // OTP Generate Method
	
	public static String generateOTP(int length, ResourceRequest resourceRequest) { 
		
		String fullName = ParamUtil.getString(resourceRequest, "name");
		String email = ParamUtil.getString(resourceRequest, "email");
		String mobileno = ParamUtil.getString(resourceRequest, "mobile-no");
		String location = ParamUtil.getString(resourceRequest, "location");
		String amount = ParamUtil.getString(resourceRequest, "fd-amount");
		  
		System.out.println("full name>>  "+fullName);
		System.out.println("email >>> "+ email);
		System.out.println("mobileno >>> "+ mobileno);
		System.out.println("location >>> "+ location);
		System.out.println("amount >>> "+ amount);
		
		
		String character = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		SecureRandom secureRandom = new SecureRandom();
		char[] otp = new char[length];
		
		for (int i = 0; i < length; i++) {
			otp[i] = character.charAt(secureRandom.nextInt(character.length()));
			
		}
		return new String(otp);
	} 
	public static void main(String[]args) {
		
			
	}
	
	//OTP Verify Method
	   public static boolean  otpVerify(int otp) {
		 
		   return true;
	   }
}


