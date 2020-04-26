/**
Create a unit test for a simple Apex trigger.
•	The Apex trigger to test is called 'RestrictContactByName'
•	'RestrictContactByName' is a trigger which blocks inserts and 
    updates to any contact with a last name of 'INVALIDNAME'.
•	The unit tests must be in a separate Apex class called 'TestRestrictContactByName'.
•	The unit tests must cover scenarios for all lines of code included in the Apex trigger, 
    resulting in 100% code coverage.
•	Run your test class at least once (via 'Run All' tests the Developer Console) 
    before attempting to verify this challenge.


trigger RestrictContactByName on Contact (before insert, before update) {
	
	//check contacts prior to insert or update for invalid data
	For (Contact c : Trigger.New) {
		if(c.LastName == 'INVALIDNAME') {	//invalidname is invalid
			c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
		}

	}

}

*/

// Test class

@isTest
private class TestRestrictContactByName {

    static testMethod void  metodoTest() 
    {
    
        List<Contact> listContact= new List<Contact>();
        Contact c1 = new Contact(FirstName='Francesco', LastName='Riggio' , email='Test@test.com');
        Contact c2 = new Contact(FirstName='Francesco1', LastName = 'INVALIDNAME',email='Test@test.com');
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
            try
            {
                insert listContact;
            }
            catch(Exception ee)
            {
            }
        
        Test.stopTest(); 
        
    }
    
}
