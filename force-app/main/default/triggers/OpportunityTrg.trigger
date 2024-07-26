trigger OpportunityTrg on Opportunity (after insert) {


    // US: 1551
    if (Trigger.isInsert && Trigger.isAfter) {
        OpportunityTriggerHandler.updateOppPriority(Trigger.new);
    }
}