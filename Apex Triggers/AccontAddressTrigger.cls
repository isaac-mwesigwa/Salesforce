/*
Create an Apex trigger for Account that matches Shipping Address Postal Code 
with Billing Address Postal Code based on a custom field.
For this challenge, you need to create a trigger that, before insert or update, checks for a checkbox, 
and if the checkbox field is true, sets the Shipping Postal Code (whose API name is ShippingPostalCode) 
to be the same as the Billing Postal Code (BillingPostalCode).
    •	The Apex trigger must be called 'AccountAddressTrigger'.
    •	The Account object will need a new custom checkbox that should have 
        the Field Label 'Match Billing Address' and Field Name of 'Match_Billing_Address'. 
        The resulting API Name should be 'Match_Billing_Address__c'.
    •	With 'AccountAddressTrigger' active, if an Account has a Billing Postal Code and
        'Match_Billing_Address__c' is true, the record should have the Shipping Postal Code 
        set to match on insert or update.
 */
 
 trigger AccountAddressTrigger on Account (before insert, before update) {

    for(Account a : Trigger.new){
        If (a.Match_Billing_Address__c == true && a.BillingPostalCode!=Null) {
            a.ShippingPostalCode = a.BillingPostalCode;
        }   
    }
}

/** This also works!
trigger AccountAddressTrigger on Account (before insert,before update) {

	for(Account a : Trigger.new){
		if(a.Match_Billing_Address__c = True)
			a.ShippingPostalCode = a.BillingPostalCode;
		}
	}
}
*/