@istest
public class MDM_AddLocationsExtTest {
    @istest
    Static void MDM_AddLocationsExt()
    {
        MDM_configuration__c mdc0 = new MDM_configuration__c();
        mdc0.name='DeleteStageRecordsBeforeInsert';
        mdc0.Value__c = 'true' ;
        insert mdc0;
        
        MDM_configuration__c mdc = new MDM_configuration__c();
        mdc.name='MDM_IntegrationUser';
        mdc.Value__c = 'Ramakrishnan.Ramadur@crossmark.com.mdmlocuat' ;
        insert mdc;
        
        MDM_configuration__c mdc1 = new MDM_configuration__c();
        mdc1.name='BatchUploadHeaderLine';
        mdc1.Value__c = 'Location Type|Location Number|Location Status|Location Name|Address line 1:|Address line 2:|Address line 3:|City|State|Country|Postal Code|Phone Number|Latitude|Longitude|Owning Company|Chain|TradeChannel|TradeSubchannel|IdFromSource' ;
        insert mdc1;
        
        MDM_configuration__c mdc2 = new MDM_configuration__c();
        mdc2.name='BatchUploadDelimiter';
        mdc2.Value__c = '|' ;
        insert mdc2;
        
        MDM_Source__c lsc = new MDM_Source__c();
        lsc.Name = 'SalesForce1';
        insert(lsc);
        
        MDM_Source__c lsc1 = new MDM_Source__c();
        lsc1.Name = 'Coke';
        insert(lsc1);
        
        MDM_Country__C cnt = new MDM_Country__C();
        cnt.Name = 'UNITED STATES';
        insert(cnt);
        
        MDM_State__C sta = new MDM_State__C();
        sta.Name = 'AK';
        sta.Country__c = cnt.id;
        insert(sta);
        
        MDM_Banner__c bnr= new MDM_Banner__c();
        bnr.Name = 'TEST_BANNER';
        insert(bnr);
        
        MDM_OwningCompany__c ocp = new MDM_OwningCompany__c();
        ocp.Name = 'TEST_OWNINGCOMPANY';
        insert(ocp);
        
        MDM_TradeChannel__c tch = new MDM_TradeChannel__c();
        tch.Name = 'TEST_TRADECHANNEL';
        insert(tch);
        
        string loc_csvFilenameString ='TESTFILE123456789123456789123456789.CSV';
        string loc_locationListName='TEST_NAMELIST';
        string loc_LocationSourceValue = lsc.id;
        
        MDM_Location__c oLocation = new MDM_Location__c();
        oLocation.name = 'TEST_NAME';
        oLocation.Address_1__c = 'TEST Home Address_1' ;
        oLocation.Address_2__c = 'TEST Home Address_2__c' ;
        oLocation.Address_3__c = 'TEST Home Address_3__c' ;
        oLocation.Banner__c   = bnr.id;
        oLocation.City__c     = 'TEST_City';
        oLocation.Country__c  = cnt.id;
        oLocation.Latitude__c     = 0.0;
        oLocation.Location_Number__c  = '1001';
        oLocation.Location_Type__c    = 'Business';
        oLocation.Longitude__c    = 0.0;
        oLocation.OwningCompany__c   = ocp.id;
        oLocation.Postal_Code__c  = '452369';
        oLocation.State__c    = sta.id; 
        oLocation.Store_Phone_Number__c   = '12345896'; 
        oLocation.TradeChannel__c     = tch.id;
        //oLocation.TradeSubChannel__c  = '';
        oLocation.LocationStatus__c  = 'OPEN';
        oLocation.DataOverrideFlag__c  = true; 
        oLocation.ValidateUpsert__c  = true; 
        //ApexPages.StandardController controller1;
        //controller1 =  ApexPages.StandardController(oLocation);
        PageReference pageRef = Page.MDM_AddLocation;
        Test.setCurrentPage(pageRef);
        Test.startTest();
        //insert oLocation;
        ApexPages.StandardController sc = new ApexPages.standardController(oLocation);
        MDM_Location_AddLocationsExt alxt = new MDM_Location_AddLocationsExt(sc);
        alxt.saveAndReturn();
        alxt.Save();
        alxt.Cancel();
        //MDM_Source__c srcID = [SELECT Id FROM MDM_Source__c where Name = 'SalesForce'];
        //srcID.Name='SalesForce1';
        MDM_Source__c lsc11 = new MDM_Source__c();
        lsc11.Name = 'SalesForce';
        insert(lsc11);
        alxt.saveAndReturn();
        alxt.Save();
        alxt.Cancel();
        Test.stopTest();
         
    } 
    /*@istest
    Static void MDM_AddLocationsExtException()
    {
        MDM_configuration__c mdc0 = new MDM_configuration__c();
        mdc0.name='DeleteStageRecordsBeforeInsert';
        mdc0.Value__c = 'true' ;
        insert mdc0;
        
        MDM_configuration__c mdc = new MDM_configuration__c();
        mdc.name='MDM_IntegrationUser';
        mdc.Value__c = 'Ramakrishnan.Ramadur@crossmark.com.mdmlocuat' ;
        insert mdc;
        
        MDM_configuration__c mdc1 = new MDM_configuration__c();
        mdc1.name='BatchUploadHeaderLine';
        mdc1.Value__c = 'Location Type|Location Number|Location Status|Location Name|Address line 1:|Address line 2:|Address line 3:|City|State|Country|Postal Code|Phone Number|Latitude|Longitude|Owning Company|Chain|TradeChannel|TradeSubchannel|IdFromSource' ;
        insert mdc1;
        
        MDM_configuration__c mdc2 = new MDM_configuration__c();
        mdc2.name='BatchUploadDelimiter';
        mdc2.Value__c = '|' ;
        insert mdc2;
        
        MDM_Source__c lsc = new MDM_Source__c();
        lsc.Name = 'SalesForce';
        insert(lsc);
        
        MDM_Source__c lsc1 = new MDM_Source__c();
        lsc1.Name = 'Coke';
        insert(lsc1);
        
        MDM_Country__C cnt = new MDM_Country__C();
        cnt.Name = 'UNITED STATES';
        insert(cnt);
        
        MDM_State__C sta = new MDM_State__C();
        sta.Name = 'AK';
        sta.Country__c = cnt.id;
        insert(sta);
        
        MDM_Banner__c bnr= new MDM_Banner__c();
        bnr.Name = 'TEST_BANNER';
        insert(bnr);
        
        MDM_OwningCompany__c ocp = new MDM_OwningCompany__c();
        ocp.Name = 'TEST_OWNINGCOMPANY';
        insert(ocp);
        
        MDM_TradeChannel__c tch = new MDM_TradeChannel__c();
        tch.Name = 'TEST_TRADECHANNEL';
        insert(tch);
        
        string loc_csvFilenameString ='TESTFILE123456789123456789123456789.CSV';
        string loc_locationListName='TEST_NAMELIST';
        string loc_LocationSourceValue = lsc.id;
        
        MDM_Location__c oLocation = new MDM_Location__c();
        oLocation.name = 'TEST_NAME';
        oLocation.Address_1__c = 'TEST Home Address_1' ;
        oLocation.Address_2__c = 'TEST Home Address_2__c' ;
        oLocation.Address_3__c = 'TEST Home Address_3__c' ;
        oLocation.Banner__c   = bnr.id;
        oLocation.City__c     = 'TEST_City';
        oLocation.Country__c  = cnt.id;
        oLocation.Latitude__c     = 0.0;
        oLocation.Location_Number__c  = '1001';
        oLocation.Location_Type__c    = 'Business';
        oLocation.Longitude__c    = 0.0;
        oLocation.OwningCompany__c   = ocp.id;
        oLocation.Postal_Code__c  = '452369';
        oLocation.State__c    = sta.id; 
        oLocation.Store_Phone_Number__c   = '12345896'; 
        oLocation.TradeChannel__c     = tch.id;
        //oLocation.TradeSubChannel__c  = '';
        oLocation.LocationStatus__c  = 'OPEN';
        oLocation.DataOverrideFlag__c  = true; 
        oLocation.ValidateUpsert__c  = true; 
        //ApexPages.StandardController controller1;
        //controller1 =  ApexPages.StandardController(oLocation);
        PageReference pageRef = Page.AddLocation;
        Test.setCurrentPage(pageRef);
        Test.startTest();
        insert oLocation;
        ApexPages.StandardController sc = new ApexPages.standardController(oLocation);
        MDM_AddLocationsExt alxt = new MDM_AddLocationsExt(sc);
        alxt.saveAndReturn();
        alxt.Save();
        alxt.Cancel();
        Test.stopTest();
     
    } 
    */
}