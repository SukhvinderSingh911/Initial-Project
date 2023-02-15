<%@ include file="/init.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

.Title{
  color: #c9252c;
    font-weight: 600;
    margin-top: 10px;
    text-transform: uppercase;
}

.subtitle {
    font-size: 18px;
    opacity: 0.7;
    margin-bottom: 30px;
}
.red-btn {
    background-color: #c9252c;
    color: #fff;
    text-transform: uppercase;
    padding: 12px 25px;
    display: inline-block;
    margin-right: 200px;
    box-shadow: 0 3px 4px #888;
    border-radius: 4px;
}

[type=checkbox] {
    cursor: pointer;
    height: 18px;
    width: 18px;
    
}

label {
    color: #c9252c;
    font-weight: 600;
}

.posting-input label {
	display: block;
}

.required {
    color: #fc0d1b;
    position: relative;
    bottom: 15px;
    font-size: 13px;
}

label[for] {
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 7px;
}

.posting-input input {
	height: 40px;
	width: 100%;
	border: 1px solid #15998b;
	border-radius: 5px;
	padding-left: 15px;
	margin-bottom: 15px;
	font-size: 18px;
}

.posting-input select {
	height: 40px;
	width: 100%;
	border: 1px solid #15998b;
	border-radius: 5px;
	padding-left: 15px;
	margin-bottom: 15px;
	font-size: 18px;
	opacity: 0.8;
}

.tab1{
 display: block;
}  
.tab2{
 display: none; 
}
</style>

<div id="<portlet:namespace/>fd-form" >
  <h2 class="Title">FIXED DEPOSIT ENQUIRY FORM</h2>
   <h4 class="subtitle">Please share your details to get a call back from us</h4>
     <div class="tab1"  id = "<portlet:namespace/>tab-1">
     <div class="row">
	<div class="col-md-5 col-sm-12 col-xs-12">
		<div class="posting-input">
			<input id="<portlet:namespace/>full-name" name="<portlet:namespace/>full-name"   placeholder=" Full Name"  type="text" />
			<span class="required" id="<portlet:namespace/>full-name-error"></span>
		</div>
	 </div>
     <div class="col-md-5 col-sm-12 col-xs-12">
			<div class="posting-input">
				<input id="<portlet:namespace/>mobile-no" name="<portlet:namespace/>mobile-no"   placeholder="Mobile No."  type="text" />
				<span class="required" id="<portlet:namespace/>mobile-no-error"></span>
			</div>
	</div>
 </div>	
 <div class="row">
	<div class="col-md-5 col-sm-12 col-xs-12">
		<div class="posting-input">
			<input id="<portlet:namespace/>email" name="<portlet:namespace/>email"  placeholder="Email"  type="text" />
			<span class="required" id="<portlet:namespace/>email-error"></span>
		</div>
	 </div>
  	
  <div class="col-md-5 col-sm-12 col-xs-12">
		<div class="posting-input">
			<select id="<portlet:namespace/>location" name="<portlet:namespace/>location" > 
				<option value="" selected disabled> Location</option>
				<option value="Delhi">Delhi</option>
				<option value="Mumbai">Mumbai</option>
				<option value="Others">Others</option>
			</select>
			<span class="required" id="<portlet:namespace/>location-error"></span>
		</div>
	</div>
	</div>	
	<div class="row">
	<div class="col-md-5 col-sm-12 col-xs-12">
		<div class="posting-input">
			<input id="<portlet:namespace/>fd-amount" name="<portlet:namespace/>fd-amount"  placeholder="FD Amount"  type="text" />
			<span class="required" id="<portlet:namespace/>fd-amount-error"></span>
		</div>
	 </div>
  	
  <div class="col-md-5 col-sm-12 col-xs-12">
		<div class="check">
		   
		    <input id="<portlet:namespace/>permission" name="<portlet:namespace/>permission"    type="checkbox" />
		    <label for="<portlet:namespace/>permission">I agree to be contacted by PNB Housing representative regarding my Fixed Deposits enquiry.</label>
			<span class="required" id="<portlet:namespace/>permission-error"></span>
		   
		</div>
	</div>
	</div>		

	<div class="row button-row mt-5">
		<div class="posting-button col-12 text-center">
			<button class="calc-btn red-btn mBot10" name="<portlet:namespace/>request-btn" id="<portlet:namespace/>request-btn" 
				onclick = "proceed()">REQUEST A CALL BACK</button>	
		</div>
	</div>
    </div>
      
       <div class="tab2"  id = "<portlet:namespace/>tab-2">
       <div class="row">
	    <div class="col-md-6 col-sm-12 col-xs-12">
		 <div class="posting-input">
			<label for="<portlet:namespace/>otp">Your OTP</label>
			<input id="<portlet:namespace/>otp" name="<portlet:namespace/>otp"  placeholder="Please enter OTP"  type="text" />
			<span class="required" id="<portlet:namespace/>otp-error"></span>
		 </div>
	   </div> 
     </div>
     <div class="row button-row mt-5">
		<div class="posting-button col-12 text-center">
			<button class="calc-btn red-btn mBot10" name="<portlet:namespace/>back-btn" id="<portlet:namespace/>back-btn" 
				onclick = "back()">BACK</button>	
		    <button class="calc-btn red-btn mBot10" name="<portlet:namespace/>verify-btn" id="<portlet:namespace/>verify-btn" 
				onclick = "otpVerify()">VERIFY OTP</button>	
		</div>
	</div>
   </div>
</div>



<script>

/* OTP Verification  */
 
  function otpVerify(){
	  var otp = $("#<portlet:namespace/>otp").val();
	  $.ajax({
	       	url : '${resourceUrl}',
	       	type: 'POST',
	       	dataType : "text",
	       	data : {
	       		"<portlet:namespace/>otp" :otp,
	       	"<portlet:namespace/>cmd" : "otpVerify"
	        },
	        success : function(responseData) {
	        	alert('OTP Verified');
	    	},
	      	error: function () {
	           
	       	}	
		});
	}
 
 /* Request A Call Back */
  var x = null;
  var y = null;
 	function proceed(){ 
 	var name = $("#<portlet:namespace/>full-name").val();
 	var mobileno = $("#<portlet:namespace/>mobile-no").val();
 	var email = $("#<portlet:namespace/>email").val();
 	var location = $("#<portlet:namespace/>location").val();
 	var amount = $("#<portlet:namespace/>fd-amount").val();
 	if (validateFullName() && validateMobileNo() && validateEmail() && validateLocation() && validateAmount() ){
 			$.ajax({
 	       	url : '${resourceUrl}',
 	       	type: 'POST',
 	       	dataType : "text",
 	       	data : {
 	       		"<portlet:namespace/>name" :name,
 	       		"<portlet:namespace/>email" :email,
 				"<portlet:namespace/>mobile-no" :mobileno,
 				"<portlet:namespace/>location" :location,
 				"<portlet:namespace/>fd-amount" :amount,
 	       	    "<portlet:namespace/>cmd" : "otpGenerate"
 	        },
 	        success : function(responseData) {
 	       	   
 	    	},
 	      	error: function () {
 	          
 	       	}	
 		});
 			
 			 x =  document.getElementById("<portlet:namespace/>tab-1");
 		 	 x.style.display="none";
 		 	 
 		 	  y =  document.getElementById("<portlet:namespace/>tab-2");
 		 	
 		 	 y.style.display="block";

 	}
 	 
  }
 /*  $("#<portlet:namespace/>fd-form").submit(function(e) {console.log('yes');
 	    e.preventDefault();
 	});
   */
   
   /* Back To Tab1 */
  function back(){ 
 	 x.style.display="block";
 	 y.style.display="none";
 	 
  }

  /* Full Name Validation */
  function validateFullName() {
	var	fullname = document.getElementById('<portlet:namespace/>full-name').value;
		 var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		 if (fullname == ''){
			 document.getElementById("<portlet:namespace/>full-name-error").innerHTML = "Full Name must not be empty";
		      return false;
		 } else if(fullname != '') {    
			    if( fullname.match(format)){
			        document.getElementById("<portlet:namespace/>full-name-error").innerHTML = "Full Name must not contain any symbol";
			        return false;
	      }else if (fullname.length > 45){
			      document.getElementById("<portlet:namespace/>full-name-error").innerHTML = "Full Name must not exceed 45 characters";
			       return false;
	      }else if (!isNaN(fullname)){
	    	  document.getElementById("<portlet:namespace/>full-name-error").innerHTML = "Enter characters only";
	    	  return false;
		 }else{
	          return true;
	        }
	      }
 } 
 

  /*MobileNo Validation */
  
 function validateMobileNo() {
	 
	  let x = document.getElementById("<portlet:namespace/>mobile-no").value;
	
	  let text;
	  if (!isNaN(x) && (x.length == 10)) {
	    return true;
	  } else {
	    text = "Input not valid";
	  }
	  document.getElementById("<portlet:namespace/>mobile-no-error").innerHTML = text;
	}

 /*Email Validation */
	
	  function validateEmail(){ 
		  var email = null;
		var  email = document.getElementById('<portlet:namespace/>email').value; 
		  if(typeof email == "undefined" || email == "" ){
			  document.getElementById("<portlet:namespace/>email-error").innerHTML = "Enter Email Address";
			   return false;
			} 
	  else if(checkEmailPattern(email) == false){
		  document.getElementById("<portlet:namespace/>email-error").innerHTML = "Invalid Email Address";
		  return false;
	  }	else{
		  return true;
	   }  
	  }
 
	  /*Location/Branch Validation On Change*/
 function validateLocation(){
	 var	location = document.getElementById('<portlet:namespace/>location').value;
		 if (location == ""){
			 document.getElementById("<portlet:namespace/>location-error").innerHTML = "Please select nearest branch";
		      return false;
		
	     }else{
	         return true;
	       }
	     }
	  
 /*FD Amount Validation */
  function validateAmount(){ 
	var	amount = document.getElementById('<portlet:namespace/>fd-amount').value;
		 if (amount == ''){
			 document.getElementById("<portlet:namespace/>fd-amount-error").innerHTML = "Fill amount";
		      return false;
		
	     }else if(amount<=10000){
	    	 document.getElementById("<portlet:namespace/>fd-amount-error").innerHTML = "FD amount should be more than 10000";
	         return false;
	         
	       }else if(isNaN(amount)){
	    	   document.getElementById("<portlet:namespace/>fd-amount-error").innerHTML = "Enter Valid Input";
	    	   return false;
	       }else{
	    	   return true;
	       }
	     }
 

 
  /*Email Validation Pattern */
 function checkEmailPattern(strVal){
		var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if(!strVal.match(regex)){
			return false;
		}
	}
</script>

