trigger MDM_Location_BeforeInsertLocation on MDM_Location__c (before Insert, before update) {
    //string loggedinUser= UserInfo.getUserName();
    //MDM_Location_configuration__c  lmc =  [select id , name, value__c from MDM_Location_configuration__c where name = 'MDM_IntegrationUser' limit 1];
    //string intuser = lmc.value__c;
    //Location_Source__c srcID = [SELECT Id FROM Location_Source__c where Name = 'SalesForce'];
    //if(loggedinUser.trim().toUpperCase() != intuser.trim().toUpperCase() ) 
    boolean isBoomiMDMUpsert = trigger.new[0].isBoomiMDMUpsert__c;
    if(!isBoomiMDMUpsert)
    {
        trigger.new[0].ValidateUpsert__c = true ;
    }
    trigger.new[0].isBoomiMDMUpsert__C= false;
}