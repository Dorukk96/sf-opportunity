trigger OpportunityTrg on Opportunity (after insert) {


    // US (User Story): 1551 (Opportunity Trigger for Git testing) (Added new things)
    if (Trigger.isInsert && Trigger.isAfter) {
        OpportunityTriggerHandler.updateOppPriority(Trigger.new);
        // New things added here
        // I add new things
        // I add new things again
        // I added new things one more time here.
        // That's it. Now!!
    }
}