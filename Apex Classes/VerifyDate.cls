/*
Create a unit test for a simple Apex class.
Write unit tests that achieve 100% code coverage for the class, and run your Apex tests.
    •	The Apex class to test is called 'VerifyDate'. 
    •	'VerifyDate' is a class which tests if a date is within a proper range, 
        and if not will return a date that occurs at the end of the month within the range.
    •	The unit tests must be in a separate test class called 'TestVerifyDate'.
    •	The unit tests must cover scenarios for all lines of code included in the Apex class, 
        resulting in 100% code coverage.
    •	Run your test class at least once (via 'Run All' tests the Developer Console) 
        attempting to verify this challenge.
*/

// Apex Class
public class VerifyDate {
	
	//method to handle potential checks against two dates
	public static Date CheckDates(Date date1, Date date2) {
		//if date2 is within the next 30 days of date1, use date2.  Otherwise use the end of the month
		if(DateWithin30Days(date1,date2)) {
			return date2;
		} else {
			return SetEndOfMonthDate(date1);
		}
	}
	
	//method to check if date2 is within the next 30 days of date1
	private static Boolean DateWithin30Days(Date date1, Date date2) {
		//check for date2 being in the past
        	if( date2 < date1) { return false; }
        
        	//check that date2 is within (>=) 30 days of date1
        	Date date30Days = date1.addDays(30); //create a date 30 days away from date1
		if( date2 >= date30Days ) { return false; }
		else { return true; }
	}

	//method to return the end of the month of a given date
	private static Date SetEndOfMonthDate(Date date1) {
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		return lastDay;
	}

}
*/

//TestVerifyDate Test Class
@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates()
    {
        Date D1=system.today();
        Date D2=system.today()+20;
        date D=VerifyDate.CheckDates(D1,D2);
        
    }
     @isTest static void testCheckDates1()
    {
        Date D1=system.today();
        Date D2=system.today()-20;
        date D=VerifyDate.CheckDates(D1,D2);
        
    }
     @isTest static void testCheckDates2()
    {
        Date D1=system.today();
        Date D2=system.today()+60;        
        date D=VerifyDate.CheckDates(D1,D2);
        
    }
  
}