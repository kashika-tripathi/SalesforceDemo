public with sharing class Query {
    
    @auraenabled
    public static List<sObjects> getItems () {
        List<sObjects> CI = [Select Name from sObjects ];
        return CI;
    }
  
}
