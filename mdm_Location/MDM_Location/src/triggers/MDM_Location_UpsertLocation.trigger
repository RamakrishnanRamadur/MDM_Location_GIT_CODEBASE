trigger MDM_Location_UpsertLocation on MDM_Location__c (after Insert, after update) {
    
    MDM_Source__c srcID = [SELECT Id FROM MDM_Source__c where Name = 'SalesForce'];
    // trigger.new[0].SourceSystem__c=srcID.ID ;
    List<MDM_Location_Stage__c> listLocations = new List<MDM_Location_Stage__c>();
    //if(trigger.isInsert){
    for (MDM_Location__c oLocation : trigger.new) {
        MDM_Location_Stage__c oLocation_Stage = new MDM_Location_Stage__c();
        oLocation_Stage.name = oLocation.Name;
        oLocation_Stage.Address_1__c = oLocation.Address_1__c ;
        oLocation_Stage.Address_2__c = oLocation.Address_2__c ;
        oLocation_Stage.Address_3__c = oLocation.Address_3__c ;
        oLocation_Stage.Banner__c   = oLocation.Banner__c;
        oLocation_Stage.City__c     = oLocation.City__c;
        oLocation_Stage.Country__c  = oLocation.Country__c;
        oLocation_Stage.Latitude__c     = oLocation.Latitude__c;
        oLocation_Stage.Location_Number__c  = oLocation.Location_Number__c;
        oLocation_Stage.Location_Type__c    = oLocation.Location_Type__c;
        oLocation_Stage.Longitude__c    = oLocation.Longitude__c;
        oLocation_Stage.OwningCompany__c   = oLocation.OwningCompany__c;
        oLocation_Stage.Postal_Code__c  = oLocation.Postal_Code__c;
        oLocation_Stage.State__c    = oLocation.State__c;
        oLocation_Stage.Store_Phone_Number__c   = oLocation.Store_Phone_Number__c;
        oLocation_Stage.TradeChannel__c     = oLocation.TradeChannel__c;
        oLocation_Stage.TradeSubChannel__c  = oLocation.TradeSubChannel__c;
        oLocation_Stage.LocationStatus__c  = oLocation.LocationStatus__c;
        oLocation_Stage.DataOverrideFlag__c  = oLocation.DataOverrideFlag__c;
        oLocation_Stage.SourceSystem__c= srcID.ID;// oLocation.SourceSystem__c;
        String str = oLocation.id;
        oLocation_Stage.IdFromSource__c = str;
        //additional fields 
        oLocation_Stage.TDLinxNumber__c= oLocation.TDLinxNumber__c; 
        oLocation_Stage.GeoLevel__c= oLocation.GeoLevel__c; 
        oLocation_Stage.GeoScore__c= oLocation.GeoScore__c; 
        oLocation_Stage.CensusBlock__c= oLocation.CensusBlock__c; 
        oLocation_Stage.Census_Tract__c= oLocation.Census_Tract__c; 
        oLocation_Stage.GooglePlaceID__c= oLocation.GooglePlaceID__c; 
        oLocation_Stage.ReplacedByID__c= oLocation.ReplacedByID__c;
        oLocation_Stage.DMA__c= oLocation.DMA__c;
        oLocation_Stage.MSA__c= oLocation.MSA__c;
        oLocation_Stage.FIP__c= oLocation.FIP__c;
        oLocation_Stage.Effective_Start_Date__c= oLocation.Effective_Start_Date__c;
        oLocation_Stage.Effective_End_Date__c= oLocation.Effective_End_Date__c;
        oLocation_Stage.Time_Zone__c= oLocation.Time_Zone__c;
        oLocation_Stage.UTCOffset__c= oLocation.UTCOffset__c;
        oLocation_Stage.EstablishSourceLinkOnly__C= oLocation.EstablishSourceLinkOnly__C;
        if(oLocation.ValidateUpsert__c == true)
        {
            listLocations.add(oLocation_Stage);
            //oLocation.ValidateUpsert__c= false;
            //Database.update(oLocation);
        }
    }
    //  }  if insert only
    if (listLocations.isEmpty() == false) {
        Database.insert(listLocations);
    }
}