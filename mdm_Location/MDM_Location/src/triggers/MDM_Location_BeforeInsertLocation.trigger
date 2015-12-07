trigger MDM_Location_BeforeInsertLocation on MDM_Location__c (before Insert, before update) {
    //string loggedinUser= UserInfo.getUserName();
    //MDM_Location_configuration__c  lmc =  [select id , name, value__c from MDM_Location_configuration__c where name = 'MDM_IntegrationUser' limit 1];
    //string intuser = lmc.value__c;
    //Location_Source__c srcID = [SELECT Id FROM Location_Source__c where Name = 'SalesForce'];
    //if(loggedinUser.trim().toUpperCase() != intuser.trim().toUpperCase() ) 
    boolean isBoomiMDMUpsert = trigger.new[0].isBoomiMDMUpsert__c;
    boolean ValidateUpsert = trigger.new[0].ValidateUpsert__c;
    trigger.new[0].EstablishSourceLinkOnly__C =  false;
    if(!isBoomiMDMUpsert)
    {
        // if not insert / update  from boomi MDM set this true ValidateUpsert__c all rows should be validated
        trigger.new[0].ValidateUpsert__c = true ;
    }
    else
    {
        // if insert / update from boomi MDM do not set this ValidateUpsert__c. Let it be as it set by boomi mdm. 
        // if ValidateUpsert__c is true, Need to send for validate again set this also true EstablishSourceLinkOnly__C else set as false.
       if(ValidateUpsert)
       {
           trigger.new[0].EstablishSourceLinkOnly__C =  true;
       }
     
    }
    trigger.new[0].isBoomiMDMUpsert__C= false;
}