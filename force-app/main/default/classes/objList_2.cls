public with sharing class objList_2{
    @AuraEnabled 
    public static list<ObjectWrapper> objdata(){
        
     
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();
        list<ObjectWrapper> sobjects = new list<ObjectWrapper>();
        for(String globalDescribeKey : globalDescribeMap.keySet()) {
            ObjectWrapper obj = new ObjectWrapper();
            obj.label =globalDescribeMap.get(globalDescribeKey).getDescribe().getLabel();
            obj.value=globalDescribeMap.get(globalDescribeKey).getDescribe().getName();
            sobjects.add(obj);
        }
        System.debug(sobjects);
       
        return sobjects;
        
    }
    
    @AuraEnabled
    public static list<filedsWrapper> filedsdata(){
        Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType sobjType = gd.get('Account');
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
        list<filedsWrapper> filedsList = new list<filedsWrapper>();
        for(String fieldName : MapofField.keySet()) 
        {
            filedsWrapper fileds = new filedsWrapper();
           fileds.label = MapofField.get(fieldName).getDescribe().getName();
           fileds.value = MapofField.get(fieldName).getDescribe().getName();
           filedsList.add(fileds);
             
        }
        system.debug(filedsList);
        return filedsList;
        
        
        
    }
    
    
    
    public class ObjectWrapper{
        @AuraEnabled public String label{get;set;}  
        @AuraEnabled public String value{get;set;}  
    }
    
    
     public class filedsWrapper{
        @AuraEnabled public String label{get;set;}  
        @AuraEnabled public String value{get;set;}  
    }
    
}