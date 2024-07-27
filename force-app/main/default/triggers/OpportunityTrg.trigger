trigger OpportunityTrg on Opportunity (after insert) {


    // US (User Story): 1551 (Opportunity Trigger for Git testing) (Added new things)
    if (Trigger.isInsert && Trigger.isAfter) {
        OpportunityTriggerHandler.updateOppPriority(Trigger.new);
        // New things added here
        // Hello new branch - 1
        // Hello new branch - 2
        // Hello new branch - 3
        // Hello new branch - 4
        // Hello new branch - 5
        // Hello new branch - 6
        // Hello new branch - 7
        // Hello new branch - 8
        // Hello new branch - 9
        // Hello new branch - 10
        // Hello new branch - 11
        // Hello new branch - 12
        // Hello new branch - 13
        // Hello new branch - 14
        // Hello new branch - 15
        // Hello new branch - 16
    }
}