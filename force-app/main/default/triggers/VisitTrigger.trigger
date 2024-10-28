trigger VisitTrigger on Visit__c (before insert, before update, after insert, after update, before delete) {

	VisitTriggerHandler handler = new VisitTriggerHandler();
	if (Trigger.isBefore && Trigger.isInsert) {
		handler.onBeforeInsert(Trigger.new);
	} else if (Trigger.isBefore && Trigger.isUpdate) {
		handler.onBeforeUpdate(Trigger.newMap, Trigger.oldMap);
	} else if (Trigger.isAfter && Trigger.isInsert) {
		handler.onAfterInsert(Trigger.newMap);
	} else if (Trigger.isAfter && Trigger.isUpdate) {
		handler.onAfterUpdate(Trigger.newMap, Trigger.oldMap);
	}
}