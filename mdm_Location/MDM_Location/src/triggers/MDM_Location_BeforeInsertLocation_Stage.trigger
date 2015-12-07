trigger MDM_Location_BeforeInsertLocation_Stage on MDM_Location_Stage__c (before insert) {
    for( MDM_Location_Stage__c c : Trigger.new )
    {
        string strSourceSystem = c.SourceSystem__c;
        string strIdFromSource = c.IdFromSource__c;
        string deleteStageRecordsBeforeInsert = 'true';
        //  MDM_Location_Configuration__C lv = new MDM_Location_Configuration__C();
        //  lv = [select  Value__c from MDM_Location_Configuration__C where name = 'DeleteStageRecordsBeforeInsert' limit 1];
        //  deleteStageRecordsBeforeInsert = lv.Value__c;
        //  if(DeleteStageRecordsBeforeInsert.toUpperCase() == 'TRUE')
        //  {
        system.debug('Stage before insert'+ strSourceSystem + ' : ' + strIdFromSource );
        List<MDM_Location_Stage__c>  rlist = new List<MDM_Location_Stage__c>();
        rlist =   [SELECT Id FROM MDM_Location_Stage__c where SourceSystem__c =:strSourceSystem.trim()  AND IdFromSource__c =:strIdFromSource.trim() ];
        delete rlist;   
        //  }
    }
}