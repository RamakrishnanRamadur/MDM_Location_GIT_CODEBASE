@IsTest
public class MDM_BulkUploadLocationTest {
    @istest
    Static void MDM_BulkUploadLocationTest()
    {
        
        MDM_Configuration__c mdc = new MDM_Configuration__c();
        mdc.name='MDM_IntegrationUser';
        mdc.Value__c = 'Ramakrishnan.Ramadur@crossmark.com.mdmlocuat' ;
        insert mdc;
        
        MDM_Configuration__c mdc0 = new MDM_Configuration__c();
        mdc0.name='DeleteStageRecordsBeforeInsert';
        mdc0.Value__c = 'true' ;
        insert mdc0;
        
        MDM_Configuration__c mdc1 = new MDM_Configuration__c();
        mdc1.name='BatchUploadHeaderLine';
        mdc1.Value__c = 'Location Type|Location Number|Location Status|Location Name|Address line 1:|Address line 2:|Address line 3:|City|State|Country|Postal Code|Phone Number|Latitude|Longitude|Owning Company|Chain|TradeChannel|TradeSubchannel|IdFromSource' ;
        insert mdc1;
        
        MDM_Configuration__c mdc2 = new MDM_Configuration__c();
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
        string fileContent = 'Location Type|Location Number|Location Status|Location Name|Address line 1:|Address line 2:|Address line 3:|City|State|Country|Postal Code|Phone Number|Latitude|Longitude|Owning Company|Chain|TradeChannel|TradeSubchannel|IdFromSource\r\n';
        fileContent +='Business||Open|ARCTIC GROCERY|229 PISOKAK ST|||BARROW|AK|UNITED STATES|99723|1231231234|71.288200|-156.799500|TEST_OWNINGCOMPANY|TEST_BANNER|||{63108099-9A1B-4D09-AB4E-66867C75F56F}\r\n';
        fileContent +='Business|1001|Open|CO OP MARKET GROCERY & DELI|526 GAFFNEY RD|||FAIRBANKS|AK|UNITED STATES|997014914|1231231234|64.837100|-147.716300|TEST_OWNINGCOMPANY|TEST_BANNER|TEST_TRADECHANNEL||{6E8013CC-1805-4345-9282-608311A9596A}\r\n';
        fileContent +='Business||Open|ARCTIC GROCERY|229 PISOKAK ST|||BARROW|AK|UNITED STATES|99723|1231231234|71.288200|-156.799500|INDEPENDENT|INDEPENDENT (USA)|||{63108099-9A1B-4D09-AB4E-66867C75F56F1}\r\n';
        fileContent +='Business||Open|ARCTIC GROCERY|229 PISOKAK ST|||BARROW|AK|UNITED STATES|99723|1231231234|71.288200|-156.799500|INDEPENDENT|INDEPENDENT (USA)|||{63108099-9A1B-4D09-AB4E-66867C75F56F2}\r\n';
        fileContent +='Business|1002|Open|CO OP MARKET GROCERY & DELI|526 GAFFNEY RD|||FAIRBANKS|AK|UNITED STATES|997014914|1231231234|||TEST_OWNINGCOMPANY|TEST_BANNER|TEST_TRADECHANNEL||{6E8013CC-1805-4345-9282-608311A9596A}\r\n';        
        fileContent +='Business1|1002|Open1||526 GAFFNEY RD|||FAIRBANKS|AK|UNITED STATES|997014914|1231231234|aa|aa|TEST_OWNINGCOMPANY|TEST_BANNER|TEST_TRADECHANNEL||{6E8013CC-1805-4345-9282-608311A9596A}\r\n'; 
        fileContent +='Business1|1002|Open1||526 GAFFNEY RD|||FAIRBANKS|AK|UNITED STATES|997014914|1231231234|aa|aa|TEST_OWNINGCOMPANY|TEST_BANNER|TEST_TRADECHANNEL||{6E8013CC-1805-4345-9282-608311A9596B}\r\n'; 
        fileContent +='Business1|1002|Open1||526 GAFFNEY RD|||FAIRBANKS|AK|UNITED STATES|997014914|1231231234|aa|aa|TEST_OWNINGCOMPANY|TEST_BANNER|TEST_TRADECHANNEL|||{6E8013CC-1805-4345-9282-608311A9596A}\r\n'; 
        fileContent +='Business||Open|CHINIK TRADITIONAL STORE|104 DRIFTWOOD DR|||NOME|AK1|UNITED STATES1|997620030|1231231234|64.543800|-163.029400|INDEPENDENT JEWELLERS|INDEPENDENT (USA)|454|5644|{A5515897-395F-4FB7-B7B7-5051E367528D}';
        Blob loc_csvFileBody= Blob.valueOf(fileContent);
        
        
        Test.startTest();
        ApexPages.StandardController controller;
        MDM_Location_BulkUploadLocationExt blext = new MDM_Location_BulkUploadLocationExt(controller);
        blext.inx =0;
        boolean isDebug=blext.IsDebug;
        blext.csvFileBody= loc_csvFileBody;
        blext.csvFilenameString= loc_csvFilenameString;
        blext.locationListName= loc_locationListName;
        blext.LocationSourceValue = loc_LocationSourceValue;
        blext.importCSVFile();
        loc_LocationSourceValue = lsc1.id;
        blext.LocationSourceValue = loc_LocationSourceValue;
        blext.importCSVFile(); 
        
        //upload status page test
        string oUPloadNamesValue = '';
        ApexPages.StandardController controller1;
        MDM_Location_BulkUploadStatusExt busext = new MDM_Location_BulkUploadStatusExt(controller1);
        SelectOption[] oUPloadNames = busext.UPloadNames;
        system.debug('oUPloadNames  ' + oUPloadNames);
        SelectOption oUPloadNameSelected = oUPloadNames[0];
        oUPloadNamesValue= oUPloadNameSelected.getValue();
        busext.UPloadNamesValue= oUPloadNamesValue;
        string ouploadname = busext.uploadName;
        string oupLoadFilename = busext.uploadFileName;
        string oupLoadDate = busext.uploadDate;
        integer numofrec = busext.NumberofSelectedUPloadrows;
        system.debug('numofrec   : ' + numofrec);
        PageReference p1 = busext.Next();
        busext.Previous();
        busext.getDisablePrevious();
        busext.getDisableNext();
        busext.checkSelectedValue();
        busext.getPageNumber();
        busext.getTotalPages();
        PageReference p2 =busext.Exporttoexcel();
        boolean oIsDebug =busext.IsDebug;
        string selectedRecordtype = 'All';
        boolean oenableExportButton = busext.enableExportButton;
        busext.RelaodGrid();      
        
        Test.stopTest();  
    }
}