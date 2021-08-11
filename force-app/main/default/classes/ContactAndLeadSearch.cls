public with sharing class ContactAndLeadSearch {
    public ContactAndLeadSearch() {


    }
    public static List<List< SObject>> searchContactsAndLeads(String str){
        list<list<sobject>> result = [FIND :str IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];

        return result;
    }
}
