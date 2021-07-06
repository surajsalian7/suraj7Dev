@RestResource(urlMapping='/v1/getAccount')
   global with sharing class getAccount {
     @Httpget
      global static list<account> fetchAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        Id accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        list<account> lstaccount =[Select id ,name from account where id=:accId ];
        
        return lstaccount ;
      }
   }