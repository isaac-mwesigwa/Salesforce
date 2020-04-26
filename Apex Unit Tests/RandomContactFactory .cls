/*
Create a contact test factory.
Create an Apex class that returns a list of contacts based on two incoming parameters: 
one for the number of contacts to generate, and the other for the last name. 
The list should NOT be inserted into the system, only returned. 
The first name should be dynamically generated and should be unique for each contact record in the list.
•	The Apex class must be called 'RandomContactFactory' and be in the public scope.
•	The Apex class should NOT use the @isTest annotation.
•	The Apex class must have a public static method called 'generateRandomContacts' 
    (without the @testMethod annotation).
•	The 'generateRandomContacts' method must accept an integer as the first parameter, 
    and a string as the second. The first parameter controls the number of contacts being generated, 
    the second is the last name of the contacts generated.
•	The 'generateRandomContacts' method should have a return type of List<Contact>.
•	The 'generateRandomContacts' method must be capable of consistently generating 
    contacts with unique first names.
•	For example, the 'generateRandomContacts' might return first names based on 
    iterated number (i.e. 'Test 1','Test 2').
•	The 'generateRandomContacts' method should not insert the contact records into the database.
*/

public class RandomContactFactory 
{
	public static List<Contact> generateRandomContacts(integer numofContacts,string LastNameGen)
    {
    	List<Contact> con= new List<Contact>();
    	for(Integer i=0;i<numofContacts;i++)
    	{
        	LastNameGen='Test'+ i;
        	Contact a=new Contact(FirstName=LastNameGen,LastName=LastNameGen);
            con.add(a);
        }
        return con;
    }
}

// Test class
@isTest
public class TestRandomContactFactory {
    static testMethod void testfunction(){
    
 List<Contact> Con = RandomContactFactory.generateRandomContacts(1,'Mattenelli');
    
    }
    }

