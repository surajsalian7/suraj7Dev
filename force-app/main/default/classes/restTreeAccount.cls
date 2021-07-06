public class restTreeAccount {
    //counter will add reference for new accounts
    private static Integer counter = 1;

    public class TreeAccount{
        public Attr attributes;
        public String Name;
        public String Phone;
        public String Website;

        public TreeAccount(String n,String p,String w){
            this.Name = n;
            this.Phone = p;
            this.Website = w;
            this.attributes = new Attr();
        }
    }

    public class Attr{
        public String referenceId;
        public String type;
        public Attr(){
            this.referenceId = 'ref' + String.valueOf(counter++);
            this.type = 'Account';
        }
    }

    public static String generateTreeJson (list<Account> accounts) {
        list<TreeAccount> records = new list <TreeAccount>();

        for (Account acc :accounts ){
            records.add(new TreeAccount(acc.name,acc.phone,acc.website));
        }   

        return '{\"records\":'+Json.serialize(records)+'}';
    }
}