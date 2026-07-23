public with sharing class SalesRecordTriggerHandler {

    public static void handleBefore(
        List<Sales_Record__c> newRecords,
        Map<Id, Sales_Record__c> oldMap
    ) {

        for (Sales_Record__c sale : newRecords) {

            sale.Excluded__c = false;
            sale.Exclusion_Reason__c = null;

            // Excluded Category
            if (sale.Category__c == 'Excluded_Category') {
                sale.Excluded__c = true;
                sale.Exclusion_Reason__c = 'Excluded Category';
            }

            // Online Category
            else if (sale.Category__c == 'Online') {
                sale.Excluded__c = true;
                sale.Exclusion_Reason__c = 'Online Sale';
            }

            // Return Sale
            else if (sale.Is_Return__c == true) {
                sale.Excluded__c = true;
                sale.Exclusion_Reason__c = 'Returned Sale';
            }
        }
    }
}