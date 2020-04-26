public class NewCaseListController{
      
     public List<Case> getNewCases() {
        List<Case> results = Database.query(
            'SELECT Id, CaseNumber, Status ' +
            'FROM Case ' +
            'WHERE Status = \'New\' ');

        return results;
     }
}