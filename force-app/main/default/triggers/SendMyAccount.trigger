trigger SendMyAccount on Account (after insert)
{
    
    for(Account a:Trigger.new) 
    {
        SendAccount.createAccount(a.name, a.Phone, a.Website); 
    }
    
    
     //SendAccountNew.createAccount(Trigger.New); 
}