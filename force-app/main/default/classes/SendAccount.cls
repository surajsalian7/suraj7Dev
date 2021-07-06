public class SendAccount {
     
    String clientId ='3MVG9YDQS5WtC11rIOE0hqD2LrfBTLbbP1XPCPLpt37Y9wB0Dxj.XNuuLMaCLl2F.ggKdAoFA7xEgOzdQK7O6';
    String clientsecret='4791050302940526847';
    String username='surajsalian70@yahoo.com';
    //Password+Security Token
    String password='Suraj@9823P0x71MeUyU7Lcv0VQ9t74jXA';


    public class deserializeResponse {
        public String id;
        public String access_token;
    }

    public String ReturnAccessToken(SendAccount Acc){
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        //String reqbody = 'grant_type=authorization_code&client_id='+clientId+'&client_secret='+clientSecret+'&code='+resp1.access_token+'&redirect_uri=https://surajsalian7-dev-ed.my.salesforce.com';

        Http h= new Http();
        HttpRequest req= new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        //Destination org instance
        req.setEndpoint('https://ap4.salesforce.com/services/oauth2/token');
        HttpResponse res=h.send(req);
        
        System.debug(res.getBody()+'Response body');

        deserializeResponse resp1=(deserializeResponse)JSON.deserialize(res.getBody(),deserializeResponse.class);

        System.debug(resp1+'- deserializeresponse');
        
        
        /*
        String reqbody1 = 'client_id='+clientId+'&response_type=code&redirect_uri=https://ap4.salesforce.com/services/oauth2/callback&scope=refresh_token';
        Http h1= new Http();
        HttpRequest req1= new HttpRequest();
        req1.setBody(reqbody1);
        req1.setMethod('POST');
        req1.setEndpoint('https://ap4.salesforce.com/services/oauth2/authorize');
        HttpResponse res1=h1.send(req1);
        System.debug(res1.getBody()+'Refresh body');
        */
        
        return resp1.access_token;
    }

    @future(callout=true)

    public static void createAccount(String Accname, String Phone, String Website){
        SendAccount acc1= new SendAccount();
        String accessToken=acc1.ReturnAccessToken(acc1);
        System.debug(accessToken+'###AT');
        
            if(accessToken!=null){
                //Change url to your Destination Org
                String endPoint='https://ap4.salesforce.com/services/data/v32.0/sobjects/Account'; 
                String jsonstr='{"Name":"'+ Accname +'","Phone":"'+ Phone +'","Website":"'+ Website +'"}';
                Http h2= new Http();
                HttpRequest req2= new HttpRequest();
                req2.setHeader('Authorization','Bearer ' + accessToken);
                req2.setHeader('Content-Type','application/json');
                req2.setHeader('accept','application/json');
                req2.setBody(jsonstr);
                req2.setMethod('POST');
                req2.setEndpoint(endPoint);
                HttpResponse res2=h2.send(req2);
                System.debug(res2+'##Suraj##');

                deserializeResponse deresp=(deserializeResponse)System.JSON.deserialize(res2.getBody(),deserializeResponse.class);

                System.debug('### Deserialized Response ###'+deresp);
            }

    }

}