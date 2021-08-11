@isTest
public with sharing class TestRestrictContactByName {
   
    @isTest static void Test1(){
        Contact ob=new Contact(LastName='INVALIDNAME');
        

        Test.startTest();
        Database.SaveResult result=Database.insert(ob,false);
        Test.stopTest();
        system.assertEquals('The Last Name INVALIDNAME is not allowed for DML', 
                               result.getErrors()[0].getMessage());
    }

    // @isTest static void testOne() {
    //     List<Contact> listOfContacts = new List<Contact>();
    //     for(integer i = 0; i < 200; i++){
    //         Contact c = new Contact(FirstName = 'FNAME', LastName = 'INVALIDNAME');
    //         listOfContacts.add(c);
    //     }
    //     try{
    //         insert listOfContacts;
    //     }
    //     catch(DMLException ex){
    //         for(integer i = 0; i < 200; i++){
    //             System.assert(ex.getMessage().contains('The Last Name "'+listOfContacts[i].LastName+'" is not allowed for DML'));
    //         }
    //     }        
    // }    
}
