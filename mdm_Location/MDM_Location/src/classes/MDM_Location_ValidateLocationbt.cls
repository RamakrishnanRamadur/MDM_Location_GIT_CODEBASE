global with sharing class MDM_Location_ValidateLocationbt implements Database.Batchable<MDM_BulkUpload__C>,Database.Stateful{
    
    boolean isValidRecord;
    boolean isValidRow;
    String validationErrMsg;
    String[] csvRecordData ;
    List < MDM_Location_Stage__c > locationStageList;
    List < MDM_Location__c > locationMasterList;
    global string batchStartdt;
    global string batchEnddt;
    global integer validrows;
    global integer invalidrows;
    global integer validrecords;
    global integer invalidrecords;
    global Set<string> AllIdfromSource;
    global String Query;
    global String UploadName;
    global list<MDM_BulkUpload__c> blList;
    global String locationSource;
    global String locationSourceName;
    global MDM_Location_ValidateLocationbt(){
        //blList=al;
    }
    
    global Iterable<MDM_BulkUpload__C> start(Database.BatchableContext BC){
        AllIdfromSource = new Set<String>();
        batchStartdt =  Datetime.now().format('MM/dd/yyyy hh:mm a');
        MDM_BulkUpload__C locblkLoc=  [SELECT Name,MDM_Source__c FROM MDM_BulkUpload__C where IsProcessed__c  = false limit 1]; 
        UploadName = locblkLoc.Name;
        //Location_Source__c ls = [SELECT Id, Name FROM Location_Source__c where id= : locblkLoc.Location_Source__c limit 1];
        locationSource = locblkLoc.MDM_Source__c ;
        
        blList= [SELECT ID,Name, Uploaded_Row_Original__c  FROM MDM_BulkUpload__C where name = : locblkLoc.name and IsProcessed__c  = false limit 5000]; 
        //Query ='SELECT Name, LocationInfoRaw__c  FROM Master_Location_BulkUploadLocation__c where name = : locblkLoc.name limit 100';
        //return Database.getQueryLocator(query);
        system.debug('Iterable<MDM_BulkUpload__C > start' + blList);
        return blList;
    }
    global void execute(Database.BatchableContext BC, List<MDM_BulkUpload__C> scope){
        validrows = 0;
        invalidrows = 0;
        validrecords = 0;
        invalidrecords = 0;
        
        MDM_Location_Stage__c locLocationStageObj;  
        MDM_Location__c locmasterLocationObj;
        locationStageList = New List < MDM_Location_Stage__c > ();
        locationMasterList = New List < MDM_Location__c > ();
        
        Set<String> locTypes =  getLocationTypes();   
        Set<String> locStatus =  getLocationStatus();
        List<MDM_Banner__c> locBanners = getBanners();
        List<MDM_OwningCompany__c> locOwningCompanies = getOwningCompanies();  
        List<MDM_TradeChannel__c> locTradeChannels = getTradeChannels();  
        List<MDM_TradeSubChannel__c> locTradeSubChannels = getTradeSubChannels();  
        List<MDM_Country__c> locCountries = getCountries();  
        List<MDM_State__c> locStates = getStates();  
        
        MDM_Source__c ls = [SELECT Id, Name FROM MDM_Source__c where id= : LocationSource limit 1];
        locationSourceName = ls.Name;
        
        Map<String, String>  countryMap  = new Map<String,String>();
        for(MDM_Country__c t : locCountries){
            countryMap.put(t.Name, t.ID);}
        
        Map<String, String>  locOwningCompaniesMap = new Map<String,String>();
        for(MDM_OwningCompany__c t : locOwningCompanies ){
            locOwningCompaniesMap .put(t.Name.toUpperCase(), t.ID);}
        
        Map<String, String>  locBannersMap = new Map<String,String>();
        for(MDM_Banner__c t : locBanners){
            locBannersMap.put(t.Name.toUpperCase(), t.ID);}
        
        Map<String, String>  locTradeChannelsMap = new Map<String,String>();
        for(MDM_TradeChannel__c t : locTradeChannels ){
            locTradeChannelsMap.put(t.Name.toUpperCase(), t.ID);}
        
        Map<String, String>  locTradeSubChannelsMap = new Map<String,String>();
        for(MDM_TradeSubChannel__c t : locTradeSubChannels ){
            locTradeSubChannelsMap.put(t.Name.toUpperCase(), t.ID);}
        
        system.debug('step 0 number of records ' + scope.size() );
        string delimitercharacter =getDelimitercharacter();
        for (Integer i = 0; i < scope.size(); i++){
            isValidRecord = true;
            IsValidRow = true;   
            validationErrMsg  = 'Error: ';
            string csvRecord =  scope[i].Uploaded_Row_Original__c;
            //csvRecord = csvRecord.replace('&#124;', '|');
            if((delimitercharacter == '&#124;') ||(delimitercharacter == '|'))
            {
                delimitercharacter = '\\|';
            }
            csvRecordData = csvRecord.split(delimitercharacter);
            system.debug('step 0.1 csvRecordData.size() ' + csvRecordData.size() ); 
            system.debug('step 0.1 csvRecordData.size() ' + csvRecord + ' : ' + 'delimitercharacter  '+ delimitercharacter ); 
            if(csvRecordData.size() != 19 )
            {
                validationErrMsg = validationErrMsg + ' Invalid Row: Number of columns: '+ i;
                IsValidRow = false;
            }
            if(!locTypes.contains(csvRecordData[0].toUpperCase()))
            {
                validationErrMsg = validationErrMsg + ' Invlaid Location Type,';
                system.debug('Error Invalid Location Type'+ csvRecordData[0]);
                IsValidRow = false;
            }
            //Location status validation
            if(!locStatus.contains(csvRecordData[2].toUpperCase()))
            {
                validationErrMsg = validationErrMsg + ' Invlaid Location Status,';
                system.debug('Error Invalid Location Status'+ csvRecordData[2]);
                IsValidRow = false;
            }  
            
            if(csvRecordData[3].trim() == '' )
            {
                validationErrMsg = validationErrMsg + ' Name Can not be blank ' + csvRecordData.size();
                IsValidRow = false;
            }
            string lat = csvRecordData[12].replace('.','');
            lat = lat.replace('+','');
            lat = lat.replace('-','');
            string lon = csvRecordData[13].replace('.','');
            lon = lon .replace('+','');
            lon = lon .replace('-','');
            system.debug('debug LAT' + lat  + ' ' +csvRecordData[12] ); 
            system.debug('debug LON' + lon  +' '  + csvRecordData[13]); 
            if(!lat.isNumericspace()|| !lon.isNumericspace() )
            {
                
                validationErrMsg = validationErrMsg + ' Invalid Row Longitude / Latitude is not number  @ '+ i;
                IsValidRow = false; 
                
            }
            system.debug('AllIdfromSource' + ' ' +AllIdfromSource ); 
            if(AllIdfromSource.contains(csvRecordData[18].trim()))
            {
                validationErrMsg = validationErrMsg + ' Invalid Row duplicate found '+ i;
                IsValidRow = false; 
                
            }
            locLocationStageObj = new MDM_Location_Stage__c(); 
            locmasterLocationObj = new MDM_Location__c();
            if(IsValidRow)
            {
                validrows= validrows + 1;
                string csvr = csvRecordData[0];
                csvr = String.valueOf(csvr).trim();
                
                //Create the stage object
                system.debug('step 1 Create scope[i] ' + csvRecord );
                system.debug('step 1 Create the stage object ' + csvr);
                
                
                locLocationStageObj.GoldenRecordID__c = scope[i].ID;
                locLocationStageObj.Location_Type__c = csvRecordData[0];
                locLocationStageObj.Location_Number__c = csvRecordData[1];
                locLocationStageObj.LocationStatus__c=csvRecordData[2];
                locLocationStageObj.Name = csvRecordData[3];
                locLocationStageObj.Address_1__c = csvRecordData[4];
                locLocationStageObj.Address_2__c = csvRecordData[5];
                locLocationStageObj.Address_3__c = csvRecordData[6];
                locLocationStageObj.City__c = csvRecordData[7];
                //locLocationStageObj.State__c = locclsLocationObj.State;  8
                //locLocationStageObj.Country__c = locclsLocationObj.Country;  9
                locLocationStageObj.Postal_Code__c = csvRecordData[10];
                locLocationStageObj.Store_Phone_Number__c = csvRecordData[11];
                if(csvRecordData[12] != ''){
                    locLocationStageObj.Latitude__c= decimal.valueOf(csvRecordData[12]);
                }
                if(csvRecordData[13] != ''){
                    locLocationStageObj.Longitude__c = decimal.valueOf(csvRecordData[13]);
                }
                //locLocationStageObj.OwningCompnay = csvRecordData[14];
                //locLocationStageObj.Banner = csvRecordData[15];
                //locLocationStageObj.TradeChannel = csvRecordData[16];
                //locLocationStageObj.TradeSubchannel = csvRecordData[17];
                locLocationStageObj.IdFromSource__c = csvRecordData[18];
                locLocationStageObj.UploadName__c = UploadName;
                locLocationStageObj.SourceSystem__c = locationSource;
                
                //set country
                csvr = String.valueOf(csvRecordData[9]).trim();
                if(countryMap.containsKey(csvr))
                {
                    locLocationStageObj.Country__c = countryMap.get(csvr);
                }
                else
                {
                    validationErrMsg = validationErrMsg + ' Invalid Country ['+ csvr + '],';
                    IsValidRecord = false;
                }                     
                //set state
                csvr = String.valueOf(csvRecordData[8]).trim();
                if(locStates.size() != 0)
                {
                    for( MDM_State__c  b : locStates)
                    {
                        if(b.Name == csvr )
                        {
                            locLocationStageObj.State__c = b.Id;
                        }
                    }
                }                    
                //set owningcomapny
                csvr = String.valueOf(csvRecordData[14]).trim();
                if(locOwningCompaniesMap.containsKey(csvr.toUpperCase())|| csvr == '')
                {
                    locLocationStageObj.OwningCompany__c  = locOwningCompaniesMap.get(csvr);
                }
                else
                {
                    validationErrMsg = validationErrMsg + '  Invalid Owning Company ['+ csvr + '],';
                    IsValidRecord = false;
                }                                        
                //set Banner
                csvr = String.valueOf(csvRecordData[15]).trim();
                if(locBannersMap.containsKey(csvr.toUpperCase()) || csvr == '')
                {
                    locLocationStageObj.Banner__c = locBannersMap.get(csvr);
                }
                else
                {
                    validationErrMsg = validationErrMsg + '  Invalid Banner ['+ csvr + '],';
                    IsValidRecord = false;
                }
                //set Tradechannel
                csvr = String.valueOf(csvRecordData[16]).trim(); 
                if(locTradeChannelsMap.containsKey(csvr.toUpperCase())|| csvr == '')
                {
                    locLocationStageObj.TradeChannel__c = locTradeChannelsMap.get(csvr);
                }
                else
                {
                    validationErrMsg = validationErrMsg + '  Invalid Trade Channel  ['+ csvr + '],';
                    IsValidRecord = false;
                } 
                //set Tradesubchannel 
                csvr = String.valueOf(csvRecordData[17]).trim();
                if(locTradeSubChannelsMap.containsKey(csvr.toUpperCase())|| csvr == '')
                {
                    locLocationStageObj.TradeSubChannel__c = locTradeSubChannelsMap.get(csvr);
                }
                else
                {
                    validationErrMsg = validationErrMsg + '  Invalid Trade Sub Channel ['+ csvr + '],';
                    IsValidRecord = false;
                } 
                // Create the location master object
                system.debug('step 1 Create the master object ' + csvr);                    
                //Location__c locmasterLocationObj = new Location__c();
                locmasterLocationObj.GoldenRecordID__c = scope[i].ID;                    
                locmasterLocationObj.Name = locLocationStageObj.Name;
                locmasterLocationObj.Location_Type__c = locLocationStageObj.Location_Type__c;
                locmasterLocationObj.Location_Number__c = locLocationStageObj.Location_Number__c;
                locmasterLocationObj.LocationStatus__c=locLocationStageObj.LocationStatus__c; //locclsLocationObj.LocationStatus;
                locmasterLocationObj.Address_1__c = locLocationStageObj.Address_1__c;
                locmasterLocationObj.Address_2__c = locLocationStageObj.Address_2__c;
                locmasterLocationObj.Address_3__c = locLocationStageObj.Address_3__c;
                locmasterLocationObj.City__c = locLocationStageObj.City__c;
                locmasterLocationObj.State__c= locLocationStageObj.State__c;
                locmasterLocationObj.Country__c= locLocationStageObj.Country__c;
                locmasterLocationObj.Postal_Code__c = locLocationStageObj.Postal_Code__c;
                locmasterLocationObj.Store_Phone_Number__c= locLocationStageObj.Store_Phone_Number__c;
                locmasterLocationObj.Latitude__c = locLocationStageObj.Latitude__c;
                locmasterLocationObj.Longitude__c = locLocationStageObj.Longitude__c;
                locmasterLocationObj.SourceSystem__c = locLocationStageObj.SourceSystem__c;
                
                locmasterLocationObj.TradeChannel__c=locLocationStageObj.TradeChannel__c;
                locmasterLocationObj.TradeSubChannel__c = locLocationStageObj.TradeSubchannel__c;
                locmasterLocationObj.OwningCompany__c = locLocationStageObj.OwningCompany__c;
                locmasterLocationObj.Banner__c = locLocationStageObj.Banner__c;  
                AllIdfromSource.add(locLocationStageObj.IdFromSource__c);
            }
            else // IsValidRow
            {
                IsValidRecord= false;
            }
            if(IsValidRecord){
                system.debug('step 3 IsValidRecord ' + IsValidRecord); 
                
                
                
                if(locationSourceName  == 'SalesForce') 
                {
                    system.debug('step 3.1 locationSourceName  ' + 'SalesForce'); 
                    validationErrMsg ='';
                    try
                    {
                        ///insert locmasterLocationObj;
                        ///validationErrMsg = 'Success: Validate and insert/update into Master';
                        locationMasterList.add(locmasterLocationObj);
                        
                    }
                    catch(DmlException e) {
                        validationErrMsg = 'Error:'+ e.getMessage();
                        System.debug('An unexpected error has occurred: ' + e.getMessage());
                    }
                    system.debug('step 3.2 record processed' +  validationErrMsg   );
                    //updateRecodsProcessed(scope[i].ID,validationErrMsg );
                    
                }
                else //non slaesforce scource
                {
                    system.debug('step 3.1 locationSourceName  Non ' +' SalesForce'); 
                    validationErrMsg ='';
                    try
                    {
                        ///insert locLocationStageObj;  
                        ///validationErrMsg = 'Success: Validate and insert/update into Stage';
                        locationStageList.add(locLocationStageObj);
                        
                    }
                    catch(DmlException e) {
                        validationErrMsg = 'Error:'+e.getMessage();
                        System.debug('An unexpected error has occurred: ' + e.getMessage());
                    }
                    system.debug('step 3.2 record processed' +  validationErrMsg   );
                    //updateRecodsProcessed(scope[i].ID,validationErrMsg );
                    
                }
            }    
            else // invalid record
            {
                invalidrows = invalidrows + 1;
                system.debug('step 3 invalid record ' + csvRecord + validationErrMsg   );
                //updateRecodsProcessed(scope[i].ID,'Error'+validationErrMsg );
                scope[i].Status_Message__c = validationErrMsg;
                scope[i].IsProcessed__c = true;
            }
            
            system.debug('locmasterLocationObj> insert' + locmasterLocationObj);
            
            
        }//for end
        
        if(locationSourceName  == 'SalesForce') {
            // insert master
            Database.SaveResult[] srList = Database.insert(locationMasterList, false);
            integer inx = 0;
            string dbmsgStr = '';
            System.debug('srList size  :' + srList.size());
            for (Database.SaveResult sr: srList) {
                System.debug('sr.isSuccess()  : ' + sr.isSuccess());
                if (sr.isSuccess()) {
                    validrecords = validrecords + 1;
                    // Operation was successful, so get the ID of the record that was processed
                    dbmsgStr  = 'Successfully inserted Location. Location ID:'  + sr.getId();
                    System.debug('Master Successfully inserted Location. Location ID: ' + sr.getId());
                    
                } else {
                    invalidrecords = invalidrecords+ 1;
                    // Operation failed, so get all errors
                    string errMsg = 'The following error has occurred.';
                    for (Database.Error err: sr.getErrors()) {
                        System.debug('The following error has occur red.');
                        errMsg = errMsg + err.getStatusCode() + ': ' + err.getMessage();
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                        errMsg = errMsg + err.getStatusCode() + 'Fields that affected this error: ' + err.getFields();
                        dbmsgStr  = errMsg ;
                    }// for get error
                    
                    //originalCSVRecords[inx].SF_ErrorMessage =  errMsg;
                    
                    
                } //isSuccess else end here
                for (MDM_BulkUpload__c  ll: scope) {
                    System.debug('Rama ll.id   :' + ll.id);
                    System.debug('Rama locationMasterList[inx].GoldenRecordID__c  :' + locationMasterList[inx].GoldenRecordID__c);
                    System.debug('Rama dbmsgStr  :' + dbmsgStr);  
                    if(ll.id == locationMasterList[inx].GoldenRecordID__c){
                        ll.Status_Message__c = dbmsgStr ;
                        ll.IsProcessed__c = true;
                    }
                }
                inx= inx + 1;
            }// for end
            Database.SaveResult[] SR1 = Database.update(scope);
            
            //update scope;
        }
        else{
            //insert  stage 
            Database.SaveResult[] srList = Database.insert(locationStageList, false);
            integer inx = 0;
            string dbmsgStr = '';
            for (Database.SaveResult sr: srList) {
                if (sr.isSuccess()) {
                    validrecords = validrecords+ 1;
                    // Operation was successful, so get the ID of the record that was processed
                    dbmsgStr  = 'Successfully inserted Location. Location ID:'  + sr.getId();
                    System.debug('Stage Successfully inserted Location. Location ID: ' + sr.getId());
                    
                } else {
                    invalidrecords = invalidrecords+ 1;
                    // Operation failed, so get all errors
                    string errMsg = 'STAGE The following error has occurred.';
                    for (Database.Error err: sr.getErrors()) {
                        System.debug('The following error has occur red.');
                        errMsg = errMsg + err.getStatusCode() + ': ' + err.getMessage();
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                        errMsg = errMsg + err.getStatusCode() + 'Fields that affected this error: ' + err.getFields();
                        dbmsgStr  = errMsg ;
                    }// for get error
                } //isSuccess else end here
                //originalCSVRecords[inx].SF_ErrorMessage =  errMsg;
                System.debug('Rama ll.id   :');
                for (MDM_BulkUpload__c  ll: scope) {
                    System.debug('Rama ll.id   :' + ll.id);
                    System.debug('Rama locationStageList[inx].GoldenRecordID__c  :' + locationStageList[inx].GoldenRecordID__c);
                    System.debug('Rama dbmsgStr  :' + dbmsgStr);                                
                    
                    if(ll.id == locationStageList[inx].GoldenRecordID__c){
                        ll.Status_Message__c = dbmsgStr ;
                        ll.IsProcessed__c = true;
                    }
                }
                inx= inx + 1;
                
            }// for end
            //update scope;
            Database.SaveResult[] SR2 = Database.update(scope);
        }
        
        //insert scope;
    }
    public void updateRecodsProcessed1(string Rawlocationrowid,string msg)
    {
        system.debug('step 3.3 record processed updateRecodsProcessed ' +  Rawlocationrowid + ' msg' + msg);
        MDM_BulkUpload__c  lobj  = [SELECT ID, Name,MDM_Source__c FROM MDM_BulkUpload__c where id = :Rawlocationrowid limit 1];
        lobj.IsProcessed__c = true;
        lobj.Status_Message__c = msg;
        update lobj;
        system.debug('step 3.4 record processed updateRecodsProcessed complete ' +  Rawlocationrowid + ' msg' + msg);
        
    }
    
    global void finish(Database.BatchableContext BC){
        try
        {
            batchEnddt =  Datetime.now().format('MM/dd/yyyy hh:mm a');
            // Get the ID of the AsyncApexJob representing this batch job
            // from Database.BatchableContext.
            // Query the AsyncApexJob object to retrieve the current job's information.
            AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :BC.getJobId()];
            // Send an email to the Apex job's submitter notifying of job completion.
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a.CreatedBy.Email};
                //String[] toAddresses = new String[] {'murali.pamidi@crossmark.com'};
                //String[] toAddresses = new String[] {'suneetha.paturi@crossmark.com'};
                String Msg1 = 'Your locations are validated.\n ';
            string Msg2 = '-------------------------------------------------- .\n ';
            String Msg3 = 'Name of the upload: '+ UploadName +' .\n ';
            String Msg4 =  'Batch Start date time:  '+ batchStartdt +' .\n ';
            String Msg5 = 'Batch End date time :  ' + batchEnddt +'.\n';
            
            validrows = [SELECT count() FROM MDM_BulkUpload__c  where name = :UploadName];
            invalidrows = [SELECT count() FROM MDM_BulkUpload__c  where name = :UploadName and IsProcessed__c  = true and status_message__C  like '%Invalid row%'];
            invalidrecords =[ SELECT count() FROM MDM_BulkUpload__c  where name = :UploadName and IsProcessed__c  = true and status_message__C  like '%Error%'];
            String Msg6= 'Numner of rows in file : '+ validrows+'.\n';
            String Msg7= 'Invalid rows in file : ' + invalidrows+'\n';
            String Msg8= '';// 'Valid records : ' + validrecords+'\n';
            String Msg9= 'Invalid records :' + invalidrecords+'\n';
            String Msg10='Mastering Location: Pending'+'\n';
            
            mail.setToAddresses(toAddresses);
            mail.setSubject('project.Name' + ' schedule locations status - ' + a.Status);
            mail.setPlainTextBody(Msg1+Msg2+Msg3+Msg4+Msg5+Msg6+Msg7+Msg8+Msg9+Msg10 ); 
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
        catch(System.EmailException ex){
            system.debug('============== email exception caught!!!=============');
        }
        
    }
    // get the Delimiter character
    public String getDelimitercharacter()       {
        string retStr = ',';
        MDM_Configuration__C lv = new MDM_Configuration__C();
        lv = [select  Value__c from MDM_Configuration__C where name = 'BatchUploadDelimiter' limit 1];
        retStr = lv.Value__c;
        return retStr;
    }
    
    
    // Get the reference data
    
    public Set<String> getLocationTypes()
    {
        
        Set<String> options= new Set<String>();     
        Schema.DescribeFieldResult fieldResult =  MDM_Location__c.Location_Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple)
        {
            
            options.add(f.getLabel().toUpperCase());
        }       
        return options;
    }
    // to get list of location types from location's picklist
    public List<MDM_Banner__c> getBanners()
    {
        
        List<MDM_Banner__c> chl =  new List<MDM_Banner__c>();
        chl = [SELECT Id, Name FROM MDM_Banner__c];     
        
        return chl;
    }
    public List<MDM_OwningCompany__c > getOwningCompanies()
    {
        
        List<MDM_OwningCompany__c > chl =  new List<MDM_OwningCompany__c >();
        chl = [SELECT Id, Name FROM MDM_OwningCompany__c ];     
        return chl;
    }
    public List<MDM_Country__c> getCountries()
    {
        
        List<MDM_Country__c> chl =  new List<MDM_Country__c>();
        chl = [SELECT Id, Name FROM MDM_Country__c];     
        
        return chl;
    }
    public List<MDM_State__c> getStates()
    {
        
        
        List<MDM_State__c> chl =  new List<MDM_State__c>();
        chl = [SELECT Id, Name FROM MDM_State__c];     
        
        return chl;
    }
    public List<MDM_TradeChannel__c> getTradeChannels()
    {
        
        
        List<MDM_TradeChannel__c> chl =  new List<MDM_TradeChannel__c>();
        chl = [SELECT Id, Name FROM MDM_TradeChannel__c];     
        
        return chl;
    }
    public List<MDM_TradeSubChannel__c> getTradeSubChannels()
    {
        
        
        List<MDM_TradeSubChannel__c> chl =  new List<MDM_TradeSubChannel__c>();
        chl = [SELECT Id, Name FROM MDM_TradeSubChannel__c];     
        
        return chl;
    }
    
    // to get list of location Status from location's picklist
    public Set<String> getLocationStatus()
    {
        
        Set<String> options= new Set<String>();     
        Schema.DescribeFieldResult fieldResult =  MDM_Location__c.LocationStatus__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        string upperLbl= '';
        for( Schema.PicklistEntry f : ple)
        {
            upperLbl = f.getLabel().toUpperCase();
            options.add(upperLbl);
        }       
        return options;
    }
    
    
}