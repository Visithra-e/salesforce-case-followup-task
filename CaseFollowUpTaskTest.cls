@isTest
private class CaseFollowUpTaskTest {

    @isTest
    static void highPriorityCaseCreatesTask() {
        Case c = new Case(Subject = 'Urgent issue', Status = 'New', Priority = 'High');
        insert c;
        Integer taskCount = [SELECT COUNT() FROM Task WHERE WhatId = :c.Id];
        System.assertEquals(1, taskCount);
    }

    @isTest
    static void lowPriorityCaseCreatesNoTask() {
        Case c = new Case(Subject = 'General question', Status = 'New', Priority = 'Low');
        insert c;
        Integer taskCount = [SELECT COUNT() FROM Task WHERE WhatId = :c.Id];
        System.assertEquals(0, taskCount);
    }

    @isTest
    static void bulkInsert200Cases() {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 200; i++) {
            cases.add(new Case(Subject = 'Case ' + i, Status = 'New', Priority = 'High'));
        }
        insert cases;
        Integer taskCount = [SELECT COUNT() FROM Task WHERE Subject = 'Follow up on high priority case'];
        System.assertEquals(200, taskCount);
    }
}
