public with sharing class InstituteController {
public InstituteController() {

}
public String selectedInstitute{get;set;}
public List<Mentor__c> mentors{get;set;}
public String selectedMentor{get;set;}
public List<Student__c> studentList{get;set;}


public List<SelectOption> getListOfInstitute(){
List<SelectOption> items = new List<SelectOption>();
items.add(new SelectOption(' ','Select'));
for(Institute__c obj:[Select id,Name from Institute__c]){
    items.add(new SelectOption(obj.Id,obj.Name));
}
return items;
}

public void getStudents(){

studentList=[Select Name, class__c,city__c,state__c,id from Student__c where Mentor__c=:selectedMentor];
}

public void getMentors() {
mentors=[Select Name,Designation__c,id from Mentor__c where Institute__c=:selectedInstitute];

}

}

