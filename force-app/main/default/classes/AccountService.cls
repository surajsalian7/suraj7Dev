global class AccountService {

   Webservice static String createAccount(String name, String phone, String website) 
   {
       Account a = new Account();
       a.Name = name;
       a.Phone = phone;
       a.Website = website;
       
       insert a;
       
       if(a.Id != null) {
           return 'Success';
       }
       else {
           return 'Failure';
       }
   
   
   }

}