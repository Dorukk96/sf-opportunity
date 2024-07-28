@isTest
public class OpportunityTriggerHandlerTest {

    @isTest
    static void testUpdateOppPriority() {
        // Step 1: Create test accounts
        Account a1 = new Account(Name = 'High Account');
        Account a2 = new Account(Name = 'Medium Account');
        Account a3 = new Account(Name = 'Low Account');

        insert new List<Account>{a1, a2, a3};
        
        // Create opportunity records related to certain account
        Opportunity highOpp = new Opportunity(
            AccountId = a1.Id,
            Name = 'High Opp', 
            CloseDate = Date.today().addDays(2),
            StageName = 'Prospecting',
            Amount = 13000
        ); 

        Opportunity mediumOpp = new Opportunity(
            AccountId = a2.Id,
            Name = 'Medium Opp', 
            CloseDate = Date.today().addDays(3),
            StageName = 'Prospecting',
            Amount = 7000
        ); 

        Opportunity lowOpp = new Opportunity(
            AccountId = a3.Id,
            Name = 'Low Opp', 
            CloseDate = Date.today().addDays(6),
            StageName = 'Prospecting',
            Amount = 2000
        ); 

        insert new List<Opportunity>{ highOpp, mediumOpp, lowOpp };

        // Triggering Opportunity
        Opportunity trgOpp1 =  new Opportunity(
            AccountId = a1.Id,
            Name = 'Triggering Opp 1',
            CloseDate = Date.today().addDays(6),
            StageName = 'Prospecting',
            Amount = 10
        );

        Opportunity trgOpp2 =  new Opportunity(
            AccountId = a2.Id,
            Name = 'Triggering Opp 2',
            CloseDate = Date.today().addDays(6),
            StageName = 'Prospecting',
            Amount = 10
        );

        Opportunity trgOpp3 =  new Opportunity(
            AccountId = a3.Id,
            Name = 'Triggering Opp 3',
            CloseDate = Date.today().addDays(6),
            StageName = 'Prospecting',
            Amount = 10
        );

        List<Opportunity> opportunityList = new List<Opportunity>{ trgOpp1, trgOpp2, trgOpp3 };
        insert opportunityList;

        // Execute the function which we want to test
        Test.startTest();
        OpportunityTriggerHandler.updateOppPriority(opportunityList);
        Test.stopTest();

        // Get each Opportunity
        String highOppPriority = [
            SELECT Id, Priority__c 
            FROM Opportunity 
            WHERE Name = 'Triggering Opp 1'
        ].Priority__c;

        String mediumOppPriority = [
            SELECT Id, Priority__c 
            FROM Opportunity 
            WHERE Name = 'Triggering Opp 2'    
        ].Priority__c;

        String lowOppPriority = [
            SELECT Id, Priority__c 
            FROM Opportunity 
            WHERE Name = 'Triggering Opp 3'
        ].Priority__c;

        // Assertions
        Assert.areEqual('High', highOppPriority);
        Assert.areEqual('Medium', mediumOppPriority);
        Assert.areEqual('Low', lowOppPriority);
    }
}
