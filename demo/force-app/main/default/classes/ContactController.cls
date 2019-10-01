public with sharing class ContactController {

    @AuraEnabled
    public static List<Contact> findAll() {
        return [SELECT id, name, phone FROM Contact LIMIT 50];
    }

    @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name, phone FROM Contact WHERE name LIKE :name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(Id recordId) {
        return [SELECT id, name, phone,Account.Name FROM Contact WHERE Id =: recordId];
    } 
       
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        System.debug(' ----- '+returnList);
        return returnList;
    }    


}