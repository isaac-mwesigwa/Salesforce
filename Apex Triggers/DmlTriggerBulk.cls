/*
How to perform DML in bulk efficiently with only one DML call on a list of opportunities. 
The example adds the Opportunity sObject to update to a list of opportunities (oppsToUpdate) in the loop. 
Next, the trigger performs the DML call outside the loop on this list after all opportunities 
have been added to the list. 
This pattern uses only one DML call regardless of the number of sObjects being updated.
*/

trigger DmlTriggerBulk on Account(after update) {   
    // Get the related opportunities for the accounts in this trigger.        
    List<Opportunity> relatedOpps = [SELECT Id,Name,Probability FROM Opportunity
        WHERE AccountId IN :Trigger.New];
          
    List<Opportunity> oppsToUpdate = new List<Opportunity>();
    // Iterate over the related opportunities
    for(Opportunity opp : relatedOpps) {      
        // Update the description when probability is greater 
        // than 50% but less than 100% 
        if ((opp.Probability >= 50) && (opp.Probability < 100)) {
            opp.Description = 'New description for opportunity.';
            oppsToUpdate.add(opp);
        }
    }
    
    // Perform DML on a collection
    update oppsToUpdate;
}