@isTest 
public with sharing class VisitTriggerHandlerTest {
    @testSetup 
    public static void testSetup() {
        Account account = new Account();
        account.name = 'Test Account';
        insert account;

        Visit__c visit = new Visit__c();
        visit.Account__c = account.id;
        insert visit;
    }

    @isTest
    public static void test001() {
        Visit__c visit = [select id, name, Status__c, EndDatetime__c from Visit__c order by CreatedDate DESC limit 1];
        System.debug(visit);
        visit.Status__c = '終了';
        
        Test.startTest();
        update visit;
        Test.stopTest();

        Visit__c visitUpdated = [select id, name, Status__c, EndDatetime__c from Visit__c order by CreatedDate DESC limit 1];
        System.debug(visitUpdated);
        Assert.isNotNull(visitUpdated.EndDatetime__c);
    }
}