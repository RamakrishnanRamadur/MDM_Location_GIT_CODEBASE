public class MDM_Location_BulkUploadStatusExt {
    public integer totalrowsinupload   { public get; public set ; }
    public integer totalinvalidrowsinupload   { public get; public set ; }
    public integer totalinvalidrecordsinupload   { public get; public set ; }
    public integer totalvalidrecordsinupload   { public get; public set ; }
private integer counter=0;  //keeps track of the offset
    private integer list_size=200; //sets the page size or number of rows
    public integer total_size; //used to show user the total size of the list
    public PageReference Next() { //user clicked next button
        if(counter  == getTotalPages())
        {
            return null;
        }
        counter += list_size;
        return null;
    }
    public PageReference Previous() { //user clicked previous button
        if (counter < 1) return null;
        counter -= list_size;
        return null;
    }
    public Boolean getDisablePrevious() { 
        //this will disable the previous and beginning buttons
        if (getPageNumber() < 2) return true; else return false;
    }
    
    public Boolean getDisableNext() { //this will disable the next and end buttons
      if(getPageNumber()  == getTotalPages())
         return true; else return false;
    }
    public void checkSelectedValue(){        
        system.debug('Selected value is: ' + selectedRecordtype );        
    } 
    public Integer getPageNumber() {
        return counter/list_size + 1;
    }
    public Integer getTotalPages() {
        total_size = [select count()  FROM MDM_BulkUpload__c where name = : SelectedUPloadNamesValue]; //set the total size in the constructor
        integer maxv = total_size/list_size;
        if(maxv == 0)
        {
            return 1;
        }
        else {
            if((maxv * list_size) == total_size)
            {
                return (total_size/list_size);
            }
            else
            {
                return (total_size/list_size + 1);
            }
        }
    }
    public String selectedRecordtype { get; set; }
    public Boolean IsDebug { public get
    { return false; }
                            Private set; }
    public Boolean enableExportButton { 
        public get{
            if(Uploadlocations.size()  >0)
            {return true;}
            else
            {return false;}
        }
        
    }
    
    public string uploadName
    {
        public get
        {
            string retStr = '';
            if(SelectedUPloadNamesValue != null )
            {
                String[] strAry= SelectedUPloadNamesValue.split('\\|');
                if(strAry.size()>2 )
                {
                    retStr = strAry[0];
                }
            }
            return retStr;
        }
        public set;
    } 
    public string uploadFileName
    {
        public get
        {
            string retStr = '';
            if(SelectedUPloadNamesValue != null )
            {
                String[] strAry= SelectedUPloadNamesValue.split('\\|');
                if(strAry.size()>2 )
                {
                    retStr = strAry[1];
                }
            }
            return retStr;
        }
        public set;
    } 
    public string uploadDate
    {
        public get
        {
            string retStr = '';
            if(SelectedUPloadNamesValue != null )
            {
                String[] strAry= SelectedUPloadNamesValue.split('\\|');
                if(strAry.size()>2 )
                {
                    retStr = strAry[2];
                }
            }
            return retStr;
        }
        public set;
    } 
    
    public PageReference Exporttoexcel() {  
        PageReference pageRef= new PageReference('/apex/MDM_UploadStatusExport');
        if(Uploadlocations.Size() > 0)
        {
            pageRef.setredirect(false);       
            return pageRef;          
        }
        
        return new PageReference('');
    }
    public SelectOption[] UPloadNames{  
        public get
        {
            SelectOption[] uploadNames;
            uploadNames= new SelectOption[]{};
                uploadNames.add(new SelectOption(String.valueOf('--Select--'),String.valueOf('--Select--')));
            for (AggregateResult   ar: [SELECT   Name, COUNT(Id) FROM MDM_BulkUpload__c  GROUP BY Name]) {
                uploadNames.add(new SelectOption(String.valueOf(ar.get('Name')),String.valueOf(ar.get('Name'))));
                
            }
            return uploadNames;
        } 
        private set;
    }
     
    public List <MDM_BulkUpload__c> Uploadlocations
    {
        
        public get{
            string locationSource = '';
            
            List<MDM_BulkUpload__c  >  uploadlocations = new List< MDM_BulkUpload__c  >();
            if(selectedRecordtype == 'All' )
            {
                uploadlocations = [SELECT Name,Id,Uploaded_Row_Original__C,Status_Message__c FROM MDM_BulkUpload__c  where Name = : SelectedUPloadNamesValue  limit :list_size offset:counter   ];
            }
            else
            {
                uploadlocations = [SELECT Name,Id,Uploaded_Row_Original__C,Status_Message__c FROM MDM_BulkUpload__c  where Name = : SelectedUPloadNamesValue and Status_Message__c like 'Error%'  limit :list_size offset:counter  ];
            }
            return  uploadlocations;
        }
        public set;
        
    }
    
    public string UPloadNamesValue
    {
        get;
        set;
    }
    public string SelectedUPloadNamesValue
    {
        get;
        set;
    }
    public integer NumberofSelectedUPloadrows
    {
        public get{
            integer ret = 0;
            if(selectedRecordtype != 'All' )
            {
                ret =  [SELECT count()  FROM MDM_BulkUpload__c where name = : SelectedUPloadNamesValue limit :list_size ];
            }
            else
            {
                ret = [SELECT count()  FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue and Status_Message__c like 'Error%' limit :list_size];
            }
            return ret;
            
        }
        public set;
    }
    
    public MDM_Location_BulkUploadStatusExt(ApexPages.StandardController controller) {
        SelectedUPloadNamesValue = UPloadNamesValue;
        total_size = [select count()  FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue]; //set the total size in the constructor
    }
    
    public void RelaodGrid() {
        SelectedUPloadNamesValue = UPloadNamesValue;
        List<MDM_BulkUpload__c>  uploadlocations = new List< MDM_BulkUpload__c>();
        if(selectedRecordtype == 'All' )
        {
            Uploadlocations = [SELECT Name,Id,Uploaded_Row_Original__c,Status_Message__c FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue   limit :list_size offset:counter  ];//  where uploadName__c = : SelectedUPloadNamesValue ];
            
        }
        else
        {
            Uploadlocations = [SELECT Name,Id,Uploaded_Row_Original__c,Status_Message__c FROM MDM_BulkUpload__c  where Name = : SelectedUPloadNamesValue and Status_Message__c like 'Error%' limit :list_size offset:counter ];//  where uploadName__c = : SelectedUPloadNamesValue ];
        }
      totalrowsinupload = [select count()  FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue];
      totalinvalidrowsinupload = [select count()  FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue and   status__C = 'INVALID ROW'];
      totalinvalidrecordsinupload = [select count()  FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue and   status__C = 'INVALID RECORD'];
      totalvalidrecordsinupload = [select count()  FROM MDM_BulkUpload__c  where name = : SelectedUPloadNamesValue and   status__C = 'VALID RECORD'];
        
    } 
}