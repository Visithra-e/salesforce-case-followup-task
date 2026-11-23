# Salesforce Case Follow-Up Task

An Apex trigger that automatically creates a follow-up Task for the case owner whenever a High priority Case is created.

## Why I built it
In customer support, urgent cases need a quick follow-up. This project automates that step so no High priority case is forgotten.

## Features
- After-insert trigger on the Case object
- Creates a Task due the next day, assigned to the case owner
- Bulk-safe: one insert outside the loop
- Apex test class with 3 tests, including a 200-record bulk test
- Report: Open Follow-up Tasks by Owner

## How it works
1. A Case is created with High priority.
2. The trigger collects a Task for each High priority case.
3. All tasks are inserted in one DML statement.

## How to test
1. Create a Case with the subject "Refund not received".
2. Open the case and check **Activity**. A follow-up task appears.
3. Create a Case with the subject "Where is my order". No task is created.

## Files
- `CaseFollowUpTask.trigger` - the trigger
- `CaseFollowUpTaskTest.cls` - the test class

## Screenshots
<img width="635" height="304" alt="Followup Task Case" src="https://github.com/user-attachments/assets/ef624ba3-e3f6-4f35-85e7-a788aeaf2b7b" />
 <img width="629" height="305" alt="Followup Task Dashboard" src="https://github.com/user-attachments/assets/51024cfb-10fb-4843-971c-75e76c3625b3" />
 <img width="628" height="248" alt="Test Class Results" src="https://github.com/user-attachments/assets/3ffbc0cb-d81b-4b49-b8ff-ee929e88b3b2" />

## What I learned
- When to use after insert instead of before insert
- Keeping DML outside loops to stay within governor limits
- Writing bulk tests and building reports

## Built with
Salesforce Developer Org, Apex

Related project: [Salesforce Case Auto-Priority](https://github.com/Visithra-e/salesforce-case-auto-priority)
