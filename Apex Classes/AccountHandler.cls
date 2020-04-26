/*
Create a method for inserting accounts.
To pass this challenge, create an Apex class that inserts a new account named after an incoming parameter. If the account is successfully inserted, the method should return the account record. If a DML exception occurs, the method should return null.
    •	The Apex class must be called AccountHandler and be in the public scope
    •	The Apex class must have a public static method called insertNewAccount
    •	The method must accept an incoming string as a parameter, which will be used to create the Account name
    •	The method must insert the account into the system and then return the record
    •	The method must also accept an empty string, catch the failed DML and then return null
 */

public class AccountHandler {
    
    public static account insertNewAccount (String AcName){
        
        try{
            Account acct = new Account(name=AcName);
            insert acct;
            System.debug('Account '+AcName+' created');
            return acct;
        }
        catch(dmlException e){
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
        }
    }
}

/* Use one of the methods below to execute code.
AccountHandler.insertNewAccount('Test New Account-2');
OR
AccountHandler.insertNewAccount('');
*/