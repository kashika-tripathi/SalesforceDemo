trigger StudentHistoryTrigger on Student__c ( after update) {

if(Trigger.isUpdate){
    List<Student_History__c> studentHistory=new List<Student_History__c>();
    
    Schema.SObjectType objType = Student__c.getSObjectType(); 
    Map<String, Schema.SObjectField> mapFields=Schema.SObjectType.Student__c.fields.getMap();

    for(Student__c student: Trigger.new){
        Student__c oldStudent=trigger.oldMap.get(student.Id);
        for(String str:mapFields.keyset()){
            if(student.get(str)!=oldStudent.get(str)){
                studentHistory.add(new Student_History__c(Name=str,
                    Field_Name__c=str, Old_Value__c=String.valueOf(oldStudent.get(str)), New_Value__c=String.valueOf(student.get(str)),Record_Id__c=String.valueOf(student.Id)));
            }
            
            
        }
    
    }
    insert(studentHistory);
}
}





