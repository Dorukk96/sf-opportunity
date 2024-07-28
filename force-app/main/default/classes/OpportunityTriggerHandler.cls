public with sharing class OpportunityTriggerHandler {
    
    // implement logic 
    // US: 1551 | CreatedBy: Doruk SITKIBUTUN | CreatedDate: 25/07/2024
    public static void updateOppPriority(List<Opportunity> oppList) {

        // Initialize an empty set which contains all the account IDs.
        Set<Id> accountIds = new Set<Id>();
        
        for (Opportunity eachOpp : oppList) {
            accountIds.add(eachOpp.AccountId);
        }

        Map<Id, Decimal> accIdsToTotalOppAmount = new Map<Id, Decimal>(); 
        for (AggregateResult aggRes : [SELECT AccountId, SUM(Amount) totalAmount 
                                       FROM Opportunity 
                                       WHERE isClosed = false
                                       AND AccountId 
                                       IN :accountIds
                                       GROUP BY AccountId]) {

            accIdsToTotalOppAmount.put((Id) aggRes.get('AccountId'), (Decimal) aggRes.get('totalAmount'));
            
        }

        // Now we are updating the priority field based on the Amount field.
        List<Opportunity> oppListToUpdate = new List<Opportunity>();
        for (Opportunity eachOpp : [SELECT Id, AccountId, Priority__c 
                                    FROM Opportunity
                                    WHERE AccountId 
                                    IN :accountIds
                                    AND isClosed = false]) {
            
            if (!accIdsToTotalOppAmount.isEmpty()) {
                Decimal totalOpenOppAmount = accIdsToTotalOppAmount.get(eachOpp.AccountId);
                if (totalOpenOppAmount != null) {
                    if (totalOpenOppAmount > 10000) {
                        eachOpp.Priority__c = 'High';
                    } else if (totalOpenOppAmount > 5000) {
                        eachOpp.Priority__c = 'Medium';
                    } else {
                        eachOpp.Priority__c = 'Low';
                    }

                    oppListToUpdate.add(eachOpp);
                }
            }
        }

        if (!oppListToUpdate.isEmpty()) {
            update oppListToUpdate;
        }

    }

}