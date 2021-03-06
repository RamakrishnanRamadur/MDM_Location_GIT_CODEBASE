@IsTest
public class MDM_Location_StatisticsExtTest {
    @istest 
    Static void MDM_Location_StatisticsExtTest()
    {
        MDM_Source__c lsc = new MDM_Source__c();
        lsc.Name = 'SalesForce';
        insert(lsc);
        MDM_Source__c lsc1 = new MDM_Source__c();
        lsc1.Name = 'SalesTrak';
        insert(lsc1);
        MDM_Source__c lsc2 = new MDM_Source__c();
        lsc2.Name = 'TDLinx';
        insert(lsc2);
        MDM_Source__c lsc3 = new MDM_Source__c();
        lsc3.Name = 'Coke';
        insert(lsc3);
        
        
        MDM_Country__C cnt = new MDM_Country__C();
        cnt.Name = 'UNITED STATES';
        insert(cnt);
        MDM_Country__C cnt1 = new MDM_Country__C();
        cnt1.Name = 'CANADA';
        insert(cnt1);
        
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
        
       /* MDM_Location_Statistic__C stsobj = new MDM_Location_Statistic__C();
        stsobj.CustomObject__c ='MDM_Location';
        stsobj.MeasureCode__c ='NO_OF_NON_US_OR_CANADA_LOCATIONS';
        stsobj.Count__c = -90; 
        insert(stsobj);*/
        
     /*   MDM_Location_Statistic__C stsob = new MDM_Location_Statistic__C();
        stsob.CustomObject__c ='MDM_Location';
        stsob.MeasureCode__c ='NO_OF_LOCATIONS_SRCSALESTRAK';
        stsob.Count__c = -90; 
        insert(stsob);
        MDM_Location_Statistic__C 	stsobj2	= new MDM_Location_Statistic__C();
                stsobj2.CustomObject__c ='MDM_Location';
        stsobj2.MeasureCode__c ='NO_OF_LOCATIONS_SRCSALESTRAK';
        stsobj2.Count__c = -90; 
        insert(stsobj2); 
*/
 		MDM_Location_Statistic__C 	stsobj1	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj2	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj3	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj4	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj5	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj6	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj7	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj8	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj9	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj10	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj11	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj12	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj13	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj14	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj15	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj16	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj17	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj18	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj19	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj20	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj21	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj22	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj23	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj24	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj25	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj26	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj27	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj28	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj29	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj30	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj31	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj32	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj33	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj34	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj35	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj36	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj37	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj38	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj39	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj40	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj41	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj42	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj43	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj44	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj45	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj46	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj47	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj48	= new MDM_Location_Statistic__C();
        MDM_Location_Statistic__C 	stsobj49	= new MDM_Location_Statistic__C();
        
        stsobj1.CustomObject__c ='MDM_Location';
        stsobj1.MeasureCode__c ='NO_OF_NON_US_OR_CANADA_LOCATIONS';
        stsobj1.Count__c = -90; 
        insert(stsobj1);
        stsobj2.CustomObject__c ='MDM_Location';
        stsobj2.MeasureCode__c ='NO_OF_LOCATIONS_SRCSALESTRAK';
        stsobj2.Count__c = -90; 
        insert(stsobj2); 
        stsobj3.CustomObject__c ='MDM_Location';
        stsobj3.MeasureCode__c ='NO_OF_CANADA_LOCATIONS';
        stsobj3.Count__c = -90; 
        insert(stsobj3);
        stsobj4.CustomObject__c ='MDM_Location';
        stsobj4.MeasureCode__c ='NO_OF_LOCATIONS_SRCSALESFORCE';
        stsobj4.Count__c = -90;
        insert(stsobj4);
        stsobj5.CustomObject__c ='MDM_Location';
        stsobj5.MeasureCode__c ='NO_OF_FUTURE_LOCATIONS';
        stsobj5.Count__c = -90;
        insert(stsobj5);
        stsobj6.CustomObject__c ='MDM_Location';
        stsobj6.MeasureCode__c ='NO_OF_LOCATIONS_SRCTDLINX';
        stsobj6.Count__c = -90;
        insert(stsobj6);
        stsobj7.CustomObject__c ='MDM_Location';
        stsobj7.MeasureCode__c ='NO_OF_DELETED_LOCATIONS';
        stsobj7.Count__c = -90; 
        insert(stsobj7);
        stsobj8.CustomObject__c ='MDM_Location';
        stsobj8.MeasureCode__c ='NO_OF_OPEN_LOCATIONS';
        stsobj8.Count__c = -90;
        insert(stsobj8);
        stsobj9.CustomObject__c ='MDM_Location';
        stsobj9.MeasureCode__c ='NO_OF_LOCATIONS_SRCCOKE';
        stsobj9.Count__c = -90;
        insert(stsobj9);
        stsobj10.CustomObject__c ='MDM_Location';
        stsobj10.MeasureCode__c ='NO_OF_US_LOCATIONS';
        stsobj10.Count__c = -90;
        insert(stsobj10);
        stsobj11.CustomObject__c ='MDM_Location';
        stsobj11.MeasureCode__c ='NO_OF_REPLACED_LOCATIONS';
        stsobj11.Count__c = -90;
        insert(stsobj11);
        stsobj12.CustomObject__c ='MDM_Location';
        stsobj12.MeasureCode__c ='NO_OF_LOCATIONS';
        stsobj12.Count__c = -90;
        insert(stsobj12);
        stsobj13.CustomObject__c ='MDM_Location_Stage';
        stsobj13.MeasureCode__c ='NO_OF_OPEN_LOCATIONS_STAGE';
        stsobj13.Count__c = -90; 
        insert(stsobj13);
        stsobj14.CustomObject__c ='MDM_Location_Stage';
        stsobj14.MeasureCode__c ='NO_OF_MOVEDTOMDM_LOCATIONS_STAGE';
        stsobj14.Count__c = -90; 
        insert(stsobj14);
        stsobj15.CustomObject__c ='MDM_Location_Stage';
        stsobj15.MeasureCode__c ='NO_OF_WAITINGFORMDM_LOCATIONS_STAGE';
        stsobj15.Count__c = -90; 
        insert(stsobj15);
        stsobj16.CustomObject__c ='MDM_Location_Stage';
        stsobj16.MeasureCode__c ='NO_OF_REPLACED_LOCATIONS_STAGE';
        stsobj16.Count__c = -90;
        insert(stsobj16);
        stsobj17.CustomObject__c ='MDM_Location_Stage';
        stsobj17.MeasureCode__c ='NO_OF_CLOSED_LOCATIONS_STAGE';
        stsobj17.Count__c = -90; 
        insert(stsobj17);
        stsobj18.CustomObject__c ='MDM_Location_Stage';
        stsobj18.MeasureCode__c ='NO_OF_FUTURE_LOCATIONS_STAGE';
        stsobj18.Count__c = -90; 
        insert(stsobj18);
        stsobj19.CustomObject__c ='MDM_Location_Stage';
        stsobj19.MeasureCode__c ='NO_OF_LOCATIONS_STAGE';
        stsobj19.Count__c = -90; 
        insert(stsobj19);
        stsobj20.CustomObject__c ='MDM_Location_Stage';
        stsobj20.MeasureCode__c ='NO_OF_DELETED_LOCATIONS_STAGE';
        stsobj20.Count__c = -90; 
        insert(stsobj20);
        stsobj21.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj21.MeasureCode__c ='NO_OF_TOTAL_SRCCOKE';
        stsobj21.Count__c = -90;
        insert(stsobj21);
        stsobj22.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj22.MeasureCode__c ='NO_OF_GOLDEN_SRCSALESTRAK';
        stsobj22.Count__c = -90;
        insert(stsobj22);
        stsobj23.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj23.MeasureCode__c ='NO_OF_GOLDEN_SRCSALESFORCE';
        stsobj23.Count__c = -90;
        insert(stsobj23);
        stsobj24.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj24.MeasureCode__c ='NO_OF_GOLDEN_NOGRID_SRCSALESFORCE';
        stsobj24.Count__c = -90; 
        insert(stsobj24);
        stsobj25.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj25.MeasureCode__c ='NO_OF_GOLDEN_SRCTDLINX';
        stsobj25.Count__c = -90;
        insert(stsobj25);
        stsobj26.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj26.MeasureCode__c ='NO_OF_TOTAL_SRCTDLINX';
        stsobj26.Count__c = -90;
        insert(stsobj26);
        stsobj27.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj27.MeasureCode__c ='NO_OF_QUARANTINE_SRCTDLINX';
        stsobj27.Count__c = -90;
        insert(stsobj27);
        stsobj28.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj28.MeasureCode__c ='NO_OF_QUARANTINE_SRCCOKE';
        stsobj28.Count__c = -90;
        insert(stsobj28);
        stsobj29.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj29.MeasureCode__c ='NO_OF_PENDING_SRCSALESFORCE';
        stsobj29.Count__c = -90; 
        insert(stsobj29);
        stsobj30.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj30.MeasureCode__c ='NO_OF_PENDING_SRCTDLINX';
        stsobj30.Count__c = -90;
        insert(stsobj30);
        stsobj31.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj31.MeasureCode__c ='NO_OF_GOLDEN_NOGRID_SRCCOKE';
        stsobj31.Count__c = -90; 
        insert(stsobj31);
        stsobj32.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj32.MeasureCode__c ='NO_OF_QUARANTINE_SRCSALESTRAK';
        stsobj32.Count__c = -90;
        insert(stsobj32);
        stsobj33.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj33.MeasureCode__c ='NO_OF_GOLDEN_SRCCOKE';
        stsobj33.Count__c = -90; 
        insert(stsobj33);
        stsobj34.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj34.MeasureCode__c ='NO_OF_GRID_X_SOURCEID';
        stsobj34.Count__c = -90;
        insert(stsobj34);
        stsobj35.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj35.MeasureCode__c ='NO_OF_PENDING_SRCCOKE';
        stsobj35.Count__c = -90;
        insert(stsobj35);
        stsobj36.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj36.MeasureCode__c ='NO_OF_GOLDEN_NOGRID_SRCSALESTRAK';
        stsobj36.Count__c = -90;
        insert(stsobj36);
        stsobj37.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj37.MeasureCode__c ='NO_OF_TOTAL_SRCSALESTRAK';
        stsobj37.Count__c = -90; 
        insert(stsobj37);
        stsobj38.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj38.MeasureCode__c ='NO_OF_TOTAL_SRCSALESFORCE';
        stsobj38.Count__c = -90; 
        insert(stsobj38);
        stsobj39.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj39.MeasureCode__c ='NO_OF_PENDING_SRCSALESTRAK';
        stsobj39.Count__c = -90;
        insert(stsobj39);
        stsobj40.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj40.MeasureCode__c ='NO_OF_GOLDEN_NOGRID_SRCTDLINX';
        stsobj40.Count__c = -90; 
        insert(stsobj40);
        stsobj41.CustomObject__c ='MDM_GRID_X_SourceID';
        stsobj41.MeasureCode__c ='NO_OF_QUARANTINE_SRCSALESFORCE';
        stsobj41.Count__c = -90;
        insert(stsobj41);
        stsobj42.CustomObject__c ='MDM_Banner';
        stsobj42.MeasureCode__c ='NO_OF_BANNER';
        stsobj42.Count__c = -90; 
        insert(stsobj42);
        stsobj43.CustomObject__c ='MDM_OwningCompany';
        stsobj43.MeasureCode__c ='NO_OF_OWNINGCOMPANIES';
        stsobj43.Count__c = -90;
        insert(stsobj43);
        stsobj44.CustomObject__c ='MDM_TradeChannel';
        stsobj44.MeasureCode__c ='NO_OF_TRADECHANNELS';
        stsobj44.Count__c = -90; 
        insert(stsobj44);
        stsobj45.CustomObject__c ='MDM_TradeSubChannel';
        stsobj45.MeasureCode__c ='NO_OF_TRADESUBCHANNELS';
        stsobj45.Count__c = -90; 
        insert(stsobj45);
        stsobj46.CustomObject__c ='MDM_Country';
        stsobj46.MeasureCode__c ='NO_OF_COUNTRIES';
        stsobj46.Count__c = -90; 
        insert(stsobj46);
        stsobj47.CustomObject__c ='MDM_State';
        stsobj47.MeasureCode__c ='NO_OF_STATES';
        stsobj47.Count__c = -90; 
        insert(stsobj47);
        stsobj48.CustomObject__c ='MDM_Source';
        stsobj48.MeasureCode__c ='NO_OF_SOURCES';
        stsobj48.Count__c = -90; 
        insert(stsobj48); 
        
        Test.startTest();
        ApexPages.StandardController controller;
        MDM_Location_StatisticsExt blext = new MDM_Location_StatisticsExt(controller);
        //blext.Refreshcounts();
        MDM_Location_RefreshRowsCountExtbt slb= new MDM_Location_RefreshRowsCountExtbt();
        Database.executeBatch(slb,50);
        Test.stopTest(); 
    }
}