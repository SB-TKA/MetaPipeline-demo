public with sharing class VisitTriggerHandler {
    public VisitTriggerHandler() {
    }

    /**
     * before insert
     */
    public void onBeforeInsert(List<Visit__c> newList){
    }

    /**
     * before insert
     */
    public void onBeforeUpdate(Map<Id, Visit__c> newMap, Map<Id, Visit__c> oldMap){
        for(String key : newMap.keySet()){
            Visit__c newObj = newMap.get(key);
            Visit__c oldObj = oldMap.get(key);

            if(newObj.Status__c != oldObj.Status__c && newObj.Status__c == '終了'){
                System.debug(newObj);
                if(newObj.EndDatetime__c == null){
                    newObj.EndDatetime__c = Datetime.now();
                }
            }
        }
    }

    /**
     * after insert
     */
    public void onAfterInsert(Map<Id, Visit__c> newMap){
    }

    /**
     * after update
     */
    public void onAfterUpdate(Map<Id, Visit__c> newMap, Map<Id, Visit__c> oldMap){
    }
}

