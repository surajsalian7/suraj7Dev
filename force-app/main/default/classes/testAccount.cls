public class testAccount {
    public static List<Account> allAccounts(){
        List<Account> accList = [SELECT Id, name from Account];
        system.debug(accList.size());
        return accList;
        //suraj
    }
}