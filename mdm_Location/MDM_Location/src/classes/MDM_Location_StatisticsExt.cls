public with sharing class MDM_Location_StatisticsExt {
    
    public MDM_Location_StatisticsExt() {
        
    }
    public string srcSalestrakID
    {
        public get;
        public set ;
    }
    public string srcSalesforceID
    {
        public get;
        public set ;
    }    
    public string srcTDLINXID
    {
        public get;
        public set ;
    }    
    public string srccokeID
    {
        public get;
        public set ;
    } 
    public Decimal NO_OF_BANNER { public get; public set ; } 
    public Decimal NO_OF_OWNINGCOMPANIES { public get;    public set ;    } 
    public Decimal NO_OF_TRADECHANNELS    { public get;    public set ;    } 
    public Decimal NO_OF_TRADESUBCHANNELS    { public get;    public set ;    } 
    public Decimal NO_OF_COUNTRIES    { public get;    public set ;    } 
    public Decimal NO_OF_STATES    { public get;    public set ;    } 
    public Decimal NO_OF_SOURCES    { public get;    public set ;    }  
    public Decimal NO_OF_US_LOCATIONS { public get; public set ; } 
    public Decimal NO_OF_CANADA_LOCATIONS  { public get; public set ; }
    public Decimal NO_OF_NON_US_OR_CANADA_LOCATIONS  { public get; public set ; }
    public Decimal NO_OF_OPEN_LOCATIONS  { public get; public set ; }
    public Decimal NO_OF_CLOSED_LOCATIONS  { public get; public set ; }
    public Decimal NO_OF_FUTURE_LOCATIONS  { public get; public set ; }
    public Decimal NO_OF_DELETED_LOCATIONS     { public get; public set ; }
    public Decimal NO_OF_REPLACED_LOCATIONS    { public get; public set ; }
    public Decimal NO_OF_LOCATIONS_SRCSALESFORCE     { public get; public set ; }
    public Decimal NO_OF_LOCATIONS_SRCSALESTRAK     { public get; public set ; }
    public Decimal NO_OF_LOCATIONS_SRCCOKE    { public get; public set ; }
    public Decimal NO_OF_LOCATIONS_SRCTDLINX  { public get; public set ; }
    public Decimal NO_OF_LOCATIONS   { public get; public set ; }
    public Decimal NO_OF_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_OPEN_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_CLOSED_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_FUTURE_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_DELETED_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_REPLACED_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_WAITINGFORMDM_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_MOVEDTOMDM_LOCATIONS_STAGE  { public get; public set ; }
    public Decimal NO_OF_GRID_X_SOURCEID  { public get; public set ; }
    public Decimal NO_OF_GOLDEN_SRCSALESFORCE  { public get; public set ; }
    Public Decimal NO_OF_GOLDEN_SRCSALESTRAK  { public get; public set ; }
    public Decimal NO_OF_GOLDEN_SRCCOKE  { public get; public set ; }
    public Decimal NO_OF_GOLDEN_SRCTDLINX  { public get; public set ; }
    public Decimal NO_OF_QUARANTINE_SRCSALESFORCE    { public get; public set ; }
    public Decimal NO_OF_QUARANTINE_SRCSALESTRAK   { public get; public set ; }
    public Decimal NO_OF_QUARANTINE_SRCCOKE    { public get; public set ; }
    public Decimal NO_OF_QUARANTINE_SRCTDLINX    { public get; public set ; }
    public Decimal NO_OF_PENDING_SRCSALESFORCE    { public get; public set ; }
    public Decimal NO_OF_PENDING_SRCSALESTRAK   { public get; public set ; }
    public Decimal NO_OF_PENDING_SRCCOKE    { public get; public set ; }
    public Decimal NO_OF_PENDING_SRCTDLINX    { public get; public set ; }
    Public Decimal NO_OF_TOTAL_SRCSALESFORCE    { public get; public set ; }
    public Decimal NO_OF_TOTAL_SRCSALESTRAK    { public get; public set ; }
    public Decimal NO_OF_TOTAL_SRCCOKE   { public get; public set ; }
    public Decimal NO_OF_TOTAL_SRCTDLINX    { public get; public set ; }
    Public Decimal NO_OF_GOLDEN_NOGRID_SRCSALESFORCE    { public get; public set ; }
    public Decimal NO_OF_GOLDEN_NOGRID_SRCSALESTRAK    { public get; public set ; }
    public Decimal NO_OF_GOLDEN_NOGRID_SRCCOKE    { public get; public set ; }
    public Decimal NO_OF_GOLDEN_NOGRID_SRCTDLINX    { public get; public set ; }  
    
    
    
    public MDM_Location_StatisticsExt(ApexPages.StandardController controller) {
        string srcSalesforce='SalesForce';
        string srcSalestrak='SalesTrak';
        string srcCoke='Coke';
        string srcTDLINX='TDLinx';
        string conCANADA='CANADA';
        string conCANADAID='';
        string conUNITEDSTATES='UNITED STATES';
        string conUNITEDSTATESID='';
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
        NO_OF_BANNER = [Select count() from MDM_BANNER__C];
        NO_OF_OWNINGCOMPANIES = [Select count() from MDM_OwningCompany__c];
        NO_OF_TRADECHANNELS = [Select count() from MDM_TRADECHANNEL__c];
        NO_OF_TRADESUBCHANNELS = [Select count() from MDM_TRADESUBCHANNEL__c];
        NO_OF_COUNTRIES = [Select count() from MDM_COUNTRY__c];
        NO_OF_STATES = [Select count() from MDM_STATE__c];
        NO_OF_SOURCES = [Select count() from MDM_Source__c];
        NO_OF_US_LOCATIONS =  [SELECT count() from MDM_Location__C where country__c = : conUNITEDSTATESID] ;
        NO_OF_CANADA_LOCATIONS = [SELECT count() from MDM_Location__C where country__c = : conCANADAID] ;
        NO_OF_NON_US_OR_CANADA_LOCATIONS = [SELECT count() from MDM_Location__C where country__c <>  :conCANADAID and country__c <>  :conUNITEDSTATESID] ;
        NO_OF_OPEN_LOCATIONS  = [SELECT count() from MDM_Location__C where LocationStatus__c = : 'Open'] ;
        NO_OF_CLOSED_LOCATIONS = [SELECT count() from MDM_Location__C where LocationStatus__c = : 'Closed'] ;
        NO_OF_FUTURE_LOCATIONS = [SELECT count() from MDM_Location__C where LocationStatus__c = : 'Future'] ;
        NO_OF_DELETED_LOCATIONS    = [SELECT count() from MDM_Location__C where LocationStatus__c = : 'Deleted'] ;
        NO_OF_REPLACED_LOCATIONS    = [SELECT count() from MDM_Location__C where LocationStatus__c = : 'Replaced'] ;
        NO_OF_LOCATIONS_SRCSALESFORCE    = [SELECT count() from MDM_Location__C where SourceSystem__c = : srcSalesforceID] ;
        NO_OF_LOCATIONS_SRCSALESTRAK    = [SELECT count() from MDM_Location__C where SourceSystem__c = : srcSalestrakID] ;
        NO_OF_LOCATIONS_SRCCOKE   = [SELECT count() from MDM_Location__C where SourceSystem__c = : srccokeID] ;
        NO_OF_LOCATIONS_SRCTDLINX = [SELECT count() from MDM_Location__C where SourceSystem__c = : srcTDLINXID] ;
        NO_OF_LOCATIONS  = [SELECT count() from MDM_Location__C] ;
        NO_OF_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C] ;
        NO_OF_OPEN_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c = : 'Open'] ;
        NO_OF_CLOSED_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c = : 'Closed'] ;
        NO_OF_FUTURE_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c = : 'Future'] ;
        NO_OF_DELETED_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c = : 'Deleted'] ;
        NO_OF_REPLACED_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where LocationStatus__c = : 'Replaced'] ;
        NO_OF_WAITINGFORMDM_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where TransferredToMDM__c = : false] ;
        NO_OF_MOVEDTOMDM_LOCATIONS_STAGE = [SELECT count() from MDM_Location_Stage__C where TransferredToMDM__c = : true] ;
        NO_OF_GRID_X_SOURCEID = [SELECT count() from MDM_GRID_X_SOURCEID__c];
        NO_OF_GOLDEN_SRCSALESFORCE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcSalesforceID ];
        NO_OF_GOLDEN_SRCSALESTRAK = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcSalestrakID ];
        NO_OF_GOLDEN_SRCCOKE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srccokeID ];
        NO_OF_GOLDEN_SRCTDLINX = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcTDLINXID ];
        NO_OF_QUARANTINE_SRCSALESFORCE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcSalesforceID ];
        NO_OF_QUARANTINE_SRCSALESTRAK = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Quarantine' and MDM_Source__c =  :srcSalestrakID ];
        NO_OF_QUARANTINE_SRCCOKE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Quarantine' and MDM_Source__c =  :srccokeID ];
        NO_OF_QUARANTINE_SRCTDLINX = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Quarantine' and MDM_Source__c =  :srcTDLINXID ];
        NO_OF_PENDING_SRCSALESFORCE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Quarantine' and MDM_Source__c =  :srcSalesforceID ];
        NO_OF_PENDING_SRCSALESTRAK = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Pending' and MDM_Source__c =  :srcSalestrakID ];
        NO_OF_PENDING_SRCCOKE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Pending' and MDM_Source__c =  :srccokeID ];
        NO_OF_PENDING_SRCTDLINX = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Pending' and MDM_Source__c =  :srcTDLINXID ];
        NO_OF_TOTAL_SRCSALESFORCE = [SELECT count() from MDM_GRID_X_SOURCEID__c where  MDM_Source__c =  :srcSalesforceID ];
        NO_OF_TOTAL_SRCSALESTRAK  = [SELECT count() from MDM_GRID_X_SOURCEID__c where   MDM_Source__c =  :srcSalestrakID ];
        NO_OF_TOTAL_SRCCOKE =  [SELECT count() from MDM_GRID_X_SOURCEID__c where  MDM_Source__c =  :srccokeID ];
        NO_OF_TOTAL_SRCTDLINX = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Source__c =  :srcTDLINXID ];
        NO_OF_GOLDEN_NOGRID_SRCSALESFORCE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcSalesforceID
                  and GoldenRecordID__c = ''] ;
        NO_OF_GOLDEN_NOGRID_SRCSALESTRAK = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcSalestrakID
                  and GoldenRecordID__c = ''];
        NO_OF_GOLDEN_NOGRID_SRCCOKE = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srccokeID
                  and GoldenRecordID__c = ''];
        NO_OF_GOLDEN_NOGRID_SRCTDLINX = [SELECT count() from MDM_GRID_X_SOURCEID__c where MDM_Integration_Status__c =  'Golden' and MDM_Source__c =  :srcTDLINXID
                  and GoldenRecordID__c = '' ];
        
        
    }
    
//Reason for the code commented.. 
//All these numbers needs to be retrived from the custom object. populated by batch process.
//Since the SOQL size limitation (50000 rows on count) even the bacth may have problem with is. Need to test with large data.
//will try in stage environment with approval
    /*public Decimal NO_OF_BANNER
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_BANNER' limit 1];
x = obj.Count__c;
x = [Select count from mdm_banner__C];

}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}  
public Decimal NO_OF_OWNINGCOMPANIES
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_OWNINGCOMPANIES' limit 1];
x = obj.Count__c;
}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}
public Decimal NO_OF_TRADESUBCHANNELS
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_TRADESUBCHANNELS' limit 1];
x = obj.Count__c;
}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}
public Decimal NO_OF_TRADECHANNELS
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_TRADECHANNELS' limit 1];
x = obj.Count__c;
}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}
public Decimal NO_OF_SOURCES
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_SOURCES' limit 1];
x = obj.Count__c;
}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}
public Decimal NO_OF_STATES
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_STATES' limit 1];
x = obj.Count__c;
}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}
public Decimal NO_OF_COUNTRIES
{
public get 
{ 
Decimal  x;
MDM_Location_Statistic__C  obj;
try{
obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_COUNTRIES' limit 1];
x = obj.Count__c;
}
catch (Exception e) {
x=-9999;
}
return x;
}
public set; 
}

    public Decimal NO_OF_US_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_US_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_CANADA_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_CANADA_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_NON_US_OR_CANADA_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_NON_US_OR_CANADA_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_OPEN_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_OPEN_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_CLOSED_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_CLOSED_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_FUTURE_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_FUTURE_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_DELETED_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_DELETED_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_REPLACED_LOCATIONS
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_REPLACED_LOCATIONS' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_LOCATIONS_SRCTDLINX
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_LOCATIONS_SRCTDLINX' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_LOCATIONS_SRCCOKE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_LOCATIONS_SRCCOKE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_LOCATIONS_SRCSALESTRAK
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_LOCATIONS_SRCSALESTRAK' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_LOCATIONS_SRCSALESFORCE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_LOCATIONS_SRCSALESFORCE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_OPEN_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_OPEN_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_CLOSED_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_CLOSED_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_FUTURE_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_FUTURE_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_DELETED_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_DELETED_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_REPLACED_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_REPLACED_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_WAITINGFORMDM_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_WAITINGFORMDM_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_MOVEDTOMDM_LOCATIONS_STAGE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_MOVEDTOMDM_LOCATIONS_STAGE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_GOLDEN_SRCSALESFORCE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_SRCSALESFORCE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GOLDEN_SRCSALESTRAK
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_SRCSALESTRAK' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GOLDEN_SRCCOKE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_SRCCOKE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GOLDEN_SRCTDLINX
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_SRCTDLINX' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_QUARANTINE_SRCSALESFORCE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_QUARANTINE_SRCSALESFORCE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_QUARANTINE_SRCSALESTRAK
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_QUARANTINE_SRCSALESTRAK' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_QUARANTINE_SRCCOKE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_QUARANTINE_SRCCOKE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_QUARANTINE_SRCTDLINX
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_QUARANTINE_SRCTDLINX' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_PENDING_SRCSALESFORCE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_PENDING_SRCSALESFORCE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_PENDING_SRCSALESTRAK
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_PENDING_SRCSALESTRAK' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_PENDING_SRCCOKE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_PENDING_SRCCOKE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_PENDING_SRCTDLINX
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_PENDING_SRCTDLINX' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    public Decimal NO_OF_TOTAL_SRCSALESFORCE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_TOTAL_SRCSALESFORCE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_TOTAL_SRCSALESTRAK
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_TOTAL_SRCSALESTRAK' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_TOTAL_SRCCOKE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_TOTAL_SRCCOKE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_TOTAL_SRCTDLINX
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_TOTAL_SRCTDLINX' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    
    
    
    
    
    public Decimal NO_OF_GOLDEN_NOGRID_SRCSALESFORCE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_NOGRID_SRCSALESFORCE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GOLDEN_NOGRID_SRCSALESTRAK
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_NOGRID_SRCSALESTRAK' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GOLDEN_NOGRID_SRCCOKE
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_NOGRID_SRCCOKE' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GOLDEN_NOGRID_SRCTDLINX
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GOLDEN_NOGRID_SRCTDLINX' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    public Decimal NO_OF_GRID_X_SOURCEID
    {
        public get 
        { 
            Decimal  x;
            MDM_Location_Statistic__C  obj;
            try{
                obj =   [SELECT count__c FROM MDM_Location_Statistic__C  where MeasureCode__c = 'NO_OF_GRID_X_SOURCEID' limit 1];
                x = obj.Count__c;
            }
            catch (Exception e) {
                x=-9999;
            }
            return x;
        }
        public set; 
    }
    
    */
    
    
    public PageReference Cancel()
    {
        PageReference page = new PageReference('/');
        page.setRedirect(true);
        return page;
    }
    
    public void insertHelper(){
        
        MDM_Location_RefreshRowsCountExtbt slb= new MDM_Location_RefreshRowsCountExtbt();
        Database.executeBatch(slb,1);
    }
    public void Refreshcounts() {
        //string name ='rama';
        try {
            
            insertHelper();
            
        } catch (System.DmlException e) {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR, e.getDMLMessage(0));
            ApexPages.addMessage(errorMessage);
            
        } catch (Exception e) {
            ApexPages.Message errorMessage1 =   new ApexPages.Message(ApexPages.severity.ERROR,e.getMessage());
            ApexPages.addMessage(errorMessage1);
        }
        
        
    } 
    
}