public with sharing class MDM_Location_AddLocationsExt {
    private ApexPages.StandardController controller;
    
    public MDM_Location_AddLocationsExt(ApexPages.StandardController controller) {
        this.controller = controller;
    }
    public PageReference saveAndReturn()
    {
        PageReference cancel = controller.cancel();
        try
        {
            MDM_Location__c t = (MDM_Location__c)controller.getRecord();
            MDM_Source__c srcID = [SELECT Id FROM MDM_Source__c where Name = 'SalesForce'];
            t.SourceSystem__c =  srcID.ID;
            if(srcID == null)
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'MDM Source missing SalesForce as a Source.');
                ApexPages.addMessage(myMsg);
                return null;
            }
            controller.save();
            
        }
        catch(Exception e){
            System.debug('==Exception Message==='+e.getMessage());
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
            ApexPages.addMessage(myMsg);
            return null;
        }
        return cancel;
    }
    public PageReference Cancel()
    {
        PageReference page = new PageReference('/');
        page.setRedirect(true);
        return page;
    }
    public pageReference save(){    
        PageReference pageRef = controller.save();
        Map<string,string> URLParameters = ApexPages.currentPage().getParameters();
        if(URLParameters.containsKey('retURL')){
            pageRef = new PageReference(URLParameters.get('retURL'));
        }       
        return pageRef;
    }  
}