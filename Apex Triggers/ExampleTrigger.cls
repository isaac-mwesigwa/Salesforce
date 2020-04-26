/*
The following example trigger shows how to call a static method from a trigger. 
If the trigger was fired because of an insert event, 
the example calls the static sendMail() method on the EmailManager class. 
This utility method sends an email to the specified recipient and contains the number of contact records inserted.
 */
 
trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        // Call a utility method from another class
        EmailManager.sendMail('mwesisaact@gmail.com', 'Trailhead Trigger Tutorial', 
                    recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}

/** Create a contact to test the trigger
Contact c = new Contact(LastName='Test Contact');
insert c;
 */