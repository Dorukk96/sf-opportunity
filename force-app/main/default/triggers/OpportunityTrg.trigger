trigger OpportunityTrg on Opportunity (after insert) {


    // US (User Story): 1551 (Opportunity Trigger for Git testing) (Added new things)
    if (Trigger.isInsert && Trigger.isAfter) {
        OpportunityTriggerHandler.updateOppPriority(Trigger.new);
        // New things added here
        // I add new things
        // I add new things again
        // I added new things one more time here.
        // That's it. Now!
        // Again I'm adding 6, 7, 8 and you can see after 5
        // 7
        // 8
        // This is a new line 9
        // This is a new line 10
        // This branch is replica branch
    }
}