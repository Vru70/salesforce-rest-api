/**
 * @author            : Vrushabh Uprikar
 * @last modified on  : 03-15-2021
 * @last modified by  : Vrushabh Uprikar
 * Modifications Log 
 * Ver   Date         Author             Modification
 * 1.0   03-15-2021   Vrushabh Uprikar   Initial Version
**/
public with sharing class postContactData 
{

    public static HttpResponse makePostCallout( String fname, 
                                                String lname,
                                                String email) 
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://hook.integromat.com/3ct0hfnogi3nthu1zvclhsyropq8i4ql');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Map<String, String> load = new Map<String, String>();
        load.put('FirstName',fname);
        load.put('LastName',lname);
        load.put('Email',email);
        request.setBody(JSON.serialize(load));
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 200) 
        {
            System.debug('The status code returned was not expected: ' +
            response.getStatusCode() + ' ' + response.getStatus());
        } else 
        {
            System.debug(response.getBody());
        }
        return response;
    }

}
