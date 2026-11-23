trigger CaseFollowUpTask on Case (after insert) {
    List<Task> tasks = new List<Task>();

    for (Case c : Trigger.new) {
        if (c.Priority == 'High') {
            tasks.add(new Task(
                Subject = 'Follow up on high priority case',
                WhatId = c.Id,
                OwnerId = c.OwnerId,
                ActivityDate = Date.today().addDays(1),
                Priority = 'High',
                Status = 'Not Started'
            ));
        }
    }

    if (!tasks.isEmpty()) {
        insert tasks;
    }
}
