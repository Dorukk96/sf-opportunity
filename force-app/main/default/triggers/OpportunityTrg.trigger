trigger OpportunityTrg on Opportunity (after insert) {


    // US (User Story): 1551 (Opportunity Trigger for Git testing) (Added new things)
    if (Trigger.isInsert && Trigger.isAfter) {
        OpportunityTriggerHandler.updateOppPriority(Trigger.new);
        // New things added here
    }

    if (Trigger.isUpdate && Trigger.isBefore) {
        // Implement some logic here.
    }
}