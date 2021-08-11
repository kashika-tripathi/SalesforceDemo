public with sharing class ContactSearch {
    public ContactSearch() {

    }
    public static List<Contact> searchForContacts(String lName,String pCode){
        return [SELECT ID,Name FROM Contact WHERE lastName =:lName AND MailingPostalCode =:pCode];
   }
}
