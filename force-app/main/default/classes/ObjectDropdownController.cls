public with sharing class ObjectDropdownController {
    public ObjectDropdownController() {

    }

    @auraenabled
   
    public static List<String> getItems(){
        List<String> objects=new List<String>();
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();  
        for(SObjectType sot:gd){
            objects.add(sot.getDescribe().getName());
            objects.sort();  
        }
        return objects;
    }

    @auraenabled

    public static List<String> getObjectField(String objectName){
        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        List<string> fieldsNames = new list<string>();
        
        Map <String, Schema.SObjectField> fieldMap = 
     schemaMap.get(objectName).getDescribe().fields.getMap();
        for(Schema.SObjectField sfield : fieldMap.Values())
        {
            schema.describefieldresult dfield = sfield.getDescribe();
            fieldsNames.add(dfield.getName());
            
        }
        return fieldsNames;
     }


    //  @AuraEnabled
    //  public static List<Sobject> getFieldRecords(String objectName, List<String> fields){
    //      //fields.add('Id');
    //      String q = 'Select Id From ' + objectName;
    //      List<Sobject> records = Database.query(q);
        
    //      return records;
    //   }

      @AuraEnabled
      public static List<List<String>> getFieldRecords(String query, List<String> selectedValues){
          //fields.add('Id');
          List<List<String>> result=new List<List<String>>();
          List<sObject> rec=Database.query(query);
          for(sObject o: rec){
              List<String> fieldValues=new List<String>();
              for(String j:selectedValues){
                  fieldValues.add(String.valueOf(o.get(j)));
              }
              result.add(fieldValues);
          }
      
         
          return result;
       }
     }

   
     
