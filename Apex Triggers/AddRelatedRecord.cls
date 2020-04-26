/**
This trigger adds a related opportunity for each new or updated account if 
no opportunity is already associated with the account. 
The trigger first performs a SOQL query to get all 
child opportunities for the accounts that the trigger fired on. 
Next, the trigger iterates over the list of sObjects in Trigger.New to get each account sObject. 
If the account doesn’t have any related opportunity sObjects, the for loop creates one. 
If the trigger created any new opportunities, the final statement inserts them
 */

trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate over accounts that are in this trigger but that don't have opportunities.
    for (Account a : [SELECT Id,Name FROM Account
                     WHERE Id IN :Trigger.New AND
                     Id NOT IN (SELECT AccountId FROM Opportunity)]) {
        // Add a default opportunity for this account
        oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(1),
                                   AccountId=a.Id)); 
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }
}

/**To test the trigger, create an account in the Salesforce user interface.
In the Opportunities related list on the account’s page, find the new opportunity. 
The trigger added this opportunity automatically!
 */