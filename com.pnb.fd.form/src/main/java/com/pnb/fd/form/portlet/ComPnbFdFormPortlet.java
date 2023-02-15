package com.pnb.fd.form.portlet;

import com.pnb.fd.form.constants.ComPnbFdFormPortletKeys;
import com.pnb.fd.form.util.OTP;
import com.pnb.fd.service.service.FormLocalServiceUtil;

import java.io.IOException;

import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author Sukhvinder Singh
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=ComPnbFdForm",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + ComPnbFdFormPortletKeys.COMPNBFDFORM,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class ComPnbFdFormPortlet extends MVCPortlet {

	
	
	@Override
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws IOException, PortletException {
			String cmd = ParamUtil.getString(resourceRequest, "cmd");
			System.out.println("cmd >>> "+ cmd);
			
			 if(cmd.equals("otpGenerate")) {
		          OTP.addDetails(resourceRequest);
		          OTP.generateOTP(6, resourceRequest);
			 }
			/*	String otpGlobal =  StringPool.BLANK;
		
		 * if(cmd.equals("otpGenerate")) {
		 * 
		 * otpGlobal = OTP.generateOTP(6,resourceRequest);
		 * System.out.println("otp >>>> "+ otpGlobal); }else
		 * if(cmd.equals("otpVerify")){ String otp =
		 * ParamUtil.getString(resourceRequest, "otp"); if(otpGlobal.equals(otp)) {
		 * //equals ignorecase
		 * 
		 * System.out.println("otp if >>> "+otp);
		 * 
		 * otpGlobal = StringPool.BLANK; }else { System.out.println("elsee >>> "+otp); }
		 * }
		 */
			super.serveResource(resourceRequest, resourceResponse);
	}
	
	
 
}