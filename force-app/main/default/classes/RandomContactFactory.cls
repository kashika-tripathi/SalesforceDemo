public with sharing class RandomContactFactory {
public RandomContactFactory() {

}
public static List<contact> generateRandomContacts (Integer num, String lastName){
    List<Contact> ob=new List<Contact>();
    for(Integer i=0;i<num;i++){
        // FirstName='test'+i;
        // LastName=lastName;
        Contact c=new Contact(FirstName='test'+i, LastName=lastName);
        ob.add(c);
    }
    return ob;

}


    
    
}
