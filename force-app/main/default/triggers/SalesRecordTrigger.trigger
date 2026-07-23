trigger SalesRecordTrigger on Sales_Record__c (
    before insert,
    before update
) {
    SalesRecordTriggerHandler.handleBefore(
        Trigger.new,
        Trigger.oldMap
    );
}