/**
 * @author            : Vrushabh Uprikar
 * @last modified on  : 03-15-2021
 * @last modified by  : Vrushabh Uprikar
 * Modifications Log 
 * Ver   Date         Author             Modification
 * 1.0   03-15-2021   Vrushabh Uprikar   Initial Version
**/
@RestResource(urlMapping='/Account/*') // it exposes rest class as rest api resource
global with sharing class restApiAccount 
{

    @HttpDelete
    global static void doDelete() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static Account doGet() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone,VIN_Number__c, Shipping_Change_Counter__c FROM Account WHERE Id = :accountId];
        return result;
    }
  
    @HttpPost
    global static String doPost(String name,String phone, String VIN) 
    {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.VIN_Number__c = VIN;
        account.Shipping_Change_Counter__c = 0;
        insert account;
        return 'Succsess Id: '+account.Id;
    }
}