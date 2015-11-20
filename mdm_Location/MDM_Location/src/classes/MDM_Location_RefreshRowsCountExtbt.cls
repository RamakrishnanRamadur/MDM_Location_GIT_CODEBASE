global with sharing class MDM_Location_RefreshRowsCountExtbt  implements Database.Batchable<MDM_Location_Statistic__C  >,Database.Stateful{    
    global list<MDM_Location_Statistic__C > blList;
    global string srcSalesforce='SalesForce';
    global string srcSalesforceID='';
    global string srcSalestrak='SalesTrak';
    global string srcSalestrakID='';
    global string srcCoke='Coke';
    global string srccokeID='';
    global string srcTDLINX='TDLinx';
    global string srcTDLINXID='';
    global string conCANADA='CANADA';
    global string conCANADAID='';
    global string conUNITEDSTATES='UNITED STATES';
    global string conUNITEDSTATESID='';
    global MDM_Location_RefreshRowsCountExtbt (){
    }
    
    global Iterable<MDM_Location_Statistic__C  > start(Database.BatchableContext BC){
        mdm_country__c  cobj;
        cobj =   [SELECT id,name FROM mdm_country__c  where name = :conUNITEDSTATES  limit 1];
        conUNITEDSTATESID = cobj.Id;
        cobj =   [SELECT id,name FROM mdm_country__c  where name = :conCANADA  limit 1];
        conCANADAID = cobj.Id;
        
        MDM_SOURCE__c  sobj;
        sobj =   [SELECT id,name FROM MDM_SOURCE__c  where name = :srcSalesforce  limit 1];
        srcSalesforceID = sobj.Id;
        sobj =   [SELECT id,name FROM MDM_SOURCE__c  where name = :srcSalestrak  limit 1];
        srcSalestrakID = sobj.Id;
        sobj =   [SELECT id,name FROM MDM_SOURCE__c  where name = :srcCoke  limit 1];
        srccokeID = sobj.Id;
        sobj =   [SELECT id,name FROM MDM_SOURCE__c  where name = :srcTDLINX  limit 1];
        srcTDLINXID = sobj.Id;
        
        string batchStartdt =  Datetime.now().format('MM/dd/yyyy hh:mm a');
        blList= [SELECT ID,Name, MeasureCode__c,CustomObject__c FROM MDM_Location_Statistic__C ]; 
        return blList;
    }
    global void execute(Database.BatchableContext BC, List<MDM_Location_Statistic__C  > scope){
        for (Integer i = 0; i < scope.size(); i++){
            string customobject= scope[i].Customobject__C;
            string measurecode = scope[i].MeasureCode__c;
            UpdateCounts(measurecode,customobject);
        }
        
    }
    global void finish(Database.BatchableContext BC){
        try
        {
            /*    integer cnt = blList.Size();
string Msg = 'Your locations file is loaded for validation.';


// Get the ID of the AsyncApexJob representing this batch job
// from Database.BatchableContext.
// Query the AsyncApexJob object to retrieve the current job's information.
AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :BC.getJobId()];
// Send an email to the Apex job's submitter notifying of job completion.
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {a.CreatedBy.Email};
mail.setToAddresses(toAddresses);
//mail.setSubject(filename + '  Upload status  - ' + a.Status);
string Msg1 =  'Upload Date' + Datetime.now().format('MM/dd/yyyy hh:mm a') + ' .\n';
string Msg2 =  'Name of the upload: '+ filename  +  ' .\n';
String Msg3 =  'Number of records in file:' + cnt +  ' .\n'; 
String Msg4 =  'Upload status :' + a.Status +  ' .\n';
String Msg5 =  'Mastering Location: Pending' +  ' .\n';
mail.setPlainTextBody(Msg1+Msg2+Msg3+Msg4+Msg5 ); 
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); */
        }
        catch(System.EmailException ex){
            system.debug('============== email exception caught!!!=============');
        }
        //kick of the validation process
        //MDM_Location_ValidateLocationbt  objValidatebatch = new MDM_Location_ValidateLocationbt();
        //Database.executebatch(objValidatebatch,100);
    }
    public MDM_Location_RefreshRowsCountExtbt(ApexPages.StandardController controller) {
        
        
    }
    public void UpdateCounts(string measureCode, string customobject)
    {
        
        
        
        decimal cnt;
        if(customobject == 'MDM_Country')
        {cnt = [SELECT count() from MDM_Country__C];}
        else if(customobject == 'MDM_State')
        {cnt = [SELECT count() from MDM_State__C];}
        else if(customobject == 'MDM_TradeChannel')
        {cnt = [SELECT count() from MDM_Tradechannel__C];}
        else if(customobject == 'MDM_TradeSubChannel')
        {cnt = [SELECT count() from MDM_TradeSubChannel__C];}
        else if(customobject == 'MDM_Banner')
        {cnt = [SELECT count() from MDM_Banner__C];}
        else if(customobject == 'MDM_OwningCompany')
        {cnt = [SELECT count() from MDM_OwningCompany__C];}
        
        else if(customobject == 'MDM_Location')
        {
            if(measureCode=='NO_OF_US_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where country__c =: conUNITEDSTATESID] ;
            }
            else if(measureCode=='NO_OF_CANADA_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where country__c =: conCANADAID] ;
            }
            else if(measureCode=='NO_OF_NON_US_OR_CANADA_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where country__c != :conCANADAID and country__c != :conUNITEDSTATESID] ;
            }
            else if(measureCode=='NO_OF_OPEN_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where LocationStatus__c =: 'Open'] ;
            }
            else if(measureCode=='NO_OF_CLOSED_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where LocationStatus__c =: 'Closed'] ;
            }
            else if(measureCode=='NO_OF_FUTURE_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where LocationStatus__c =: 'Future'] ;
            }
            else if(measureCode=='NO_OF_DELETED_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where LocationStatus__c =: 'Deleted'] ;
            }
            else if(measureCode=='NO_OF_REPLACED_LOCATIONS')
            {
                cnt = [SELECT count() from MDM_Location__C where LocationStatus__c =: 'Replaced'] ;
            }
            else if(measureCode=='NO_OF_LOCATIONS_SRCSALESFORCE')
            {
                cnt = [SELECT count() from MDM_Location__C where SourceSystem__c =: srcSalesforceID] ;
            }
            else if(measureCode=='NO_OF_LOCATIONS_SRCSALESTRAK')
            {
                cnt = [SELECT count() from MDM_Location__C where SourceSystem__c =: srcSalestrakID] ;
            }
            else if(measureCode=='NO_OF_LOCATIONS_SRCCOKE')
            {
                cnt = [SELECT count() from MDM_Location__C where SourceSystem__c =: srccokeID] ;
            }
            else if(measureCode=='NO_OF_LOCATIONS_SRCTDLINX')
            {
                cnt = [SELECT count() from MDM_Location__C where SourceSystem__c =: srcTDLINXID] ;
            }             
            else if(measureCode=='NO_OF_LOCATIONS')  
            {
                cnt = [SELECT count() from MDM_Location__C] ;
                
            }
            else
            {
                cnt = -999;
            }
            
            
        }
        else if(customobject == 'MDM_Location_Stage')
        {
            if(measureCode=='NO_OF_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C] ;
            }
            else if(measureCode=='NO_OF_OPEN_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c =: 'Open'] ;
            }
            else if(measureCode=='NO_OF_CLOSED_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c =: 'Closed'] ;
            }
            else if(measureCode=='NO_OF_FUTURE_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c =: 'Future'] ;
            }
            else if(measureCode=='NO_OF_DELETED_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c =: 'Deleted'] ;
            }
            else if(measureCode=='NO_OF_REPLACED_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c =: 'Replaced'] ;
            }
            else if(measureCode=='NO_OF_WAITINGFORMDM_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where TransferredToMDM__c =: false] ;
            }
            else if(measureCode=='NO_OF_MOVEDTOMDM_LOCATIONS_STAGE')
            {
                cnt = [SELECT count() from MDM_Location_Stage__C where TransferredToMDM__c =: true] ;
            }
            
            else
            {
                cnt = -999;
            }
        }
        
        else if(customobject == 'MDM_GRID_X_SourceID')
        {
            if(measureCode=='NO_OF_GRID_X_SOURCEID')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c];
            }
            else if(measureCode=='NO_OF_GOLDEN_SRCSALESFORCE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcSalesforceID ];
            }
            else if(measureCode=='NO_OF_GOLDEN_SRCSALESTRAK')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcSalestrakID ];
            }
            else if(measureCode=='NO_OF_GOLDEN_SRCCOKE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srccokeID ];
            }
            else if(measureCode=='NO_OF_GOLDEN_SRCTDLINX')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcTDLINXID ];
            }
            else if(measureCode=='NO_OF_QUARANTINE_SRCSALESFORCE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcSalesforceID ];
            }
            else if(measureCode=='NO_OF_QUARANTINE_SRCSALESTRAK')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Quarantine' and MDM_Source__c = :srcSalestrakID ];
            }
            else if(measureCode=='NO_OF_QUARANTINE_SRCCOKE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Quarantine' and MDM_Source__c = :srccokeID ];
            }
            else if(measureCode=='NO_OF_QUARANTINE_SRCTDLINX')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Quarantine' and MDM_Source__c = :srcTDLINXID ];
            }
            
            else if(measureCode=='NO_OF_PENDING_SRCSALESFORCE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Quarantine' and MDM_Source__c = :srcSalesforceID ];
            }
            else if(measureCode=='NO_OF_PENDING_SRCSALESTRAK')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Pending' and MDM_Source__c = :srcSalestrakID ];
            }
            else if(measureCode=='NO_OF_PENDING_SRCCOKE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Pending' and MDM_Source__c = :srccokeID ];
            }
            else if(measureCode=='NO_OF_PENDING_SRCTDLINX')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Pending' and MDM_Source__c = :srcTDLINXID ];
            }
            
            else if(measureCode=='NO_OF_TOTAL_SRCSALESFORCE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where  MDM_Source__c = :srcSalesforceID ];
            }
            else if(measureCode=='NO_OF_TOTAL_SRCSALESTRAK')
            {
                cnt =   [SELECT count() from MDM_GRID_X_SOURCEID__c where   MDM_Source__c = :srcSalestrakID ];
            }
            else if(measureCode=='NO_OF_TOTAL_SRCCOKE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where  MDM_Source__c = :srccokeID ];
            }
            else if(measureCode=='NO_OF_TOTAL_SRCTDLINX')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Source__c = :srcTDLINXID ];
            }
            
            else if(measureCode=='NO_OF_GOLDEN_NOGRID_SRCSALESFORCE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcSalesforceID
                       and GoldenRecordID__c =''] ;
            }
            else if(measureCode=='NO_OF_GOLDEN_NOGRID_SRCSALESTRAK')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcSalestrakID
                       and GoldenRecordID__c =''];
            }
            else if(measureCode=='NO_OF_GOLDEN_NOGRID_SRCCOKE')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srccokeID
                       and GoldenRecordID__c =''];
            }
            else if(measureCode=='NO_OF_GOLDEN_NOGRID_SRCTDLINX')
            {
                cnt = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c = 'Golden' and MDM_Source__c = :srcTDLINXID
                       and GoldenRecordID__c ='' ];
            }
            else
            {
                cnt = -999;
            }
            
        }
        else
        {cnt = -111;} 
        MDM_Location_Statistic__C  obj;
        try{
            obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = :measureCode  limit 1];
            obj.Count__c = cnt;
            update obj;
        }
        catch (Exception e) {
            system.debug('UpdateCounts error NO_OF_LOCATIONS ');
        }
        
    }
}