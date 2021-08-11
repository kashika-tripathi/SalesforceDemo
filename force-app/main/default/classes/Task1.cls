public with sharing class Task1 {
    public Task1() {
        

    }
    
public List<Student__c> getStudents() {
    List<Student__c> results = Database.query(
        'SELECT City__c, State__c, Name, Class__c ' +
        'FROM Student__c ' 
        
    );
    return results;
}

public List<Mentor__c> getMentors() {
    List<Mentor__c> results = Database.query(
        'SELECT  Name, Designation__c ' +
        'FROM Mentor__c ' 
        
    );
    return results;
}
}

// public String firstListVauleId {get;set;}

// public List<SelectOption> getfirstListOptions()
// {
//     List<SelectOption> options = new List<SelectOption>();
//     // add items add needed. you can make database queries.
//     options=Database.query(
//         'SELECT Name ' +
//         'FROM Institute__c ') ;
//     return options;
// }


      


