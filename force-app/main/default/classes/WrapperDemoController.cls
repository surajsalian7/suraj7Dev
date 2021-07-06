public class WrapperDemoController{

    //wrapper class
    public class TableRow{
        public String Name {get;set;}
        public String Phone {get;set;}
        public String Sla {get;set;}
    }
   
    public List<TableRow> RowList {get; set;}

    //constructor
    public WrapperDemoController(){

        RowList = new List<TableRow>();
        TableRow tr;

        for(Contact con : [SELECT Name, Phone, Account.SLA__c FROM Contact limit 10]){
            tr = new TableRow();
            tr.Name = con.Name;
            tr.Phone = con.Phone;
            tr.Sla = con.Account.SLA__c;
            RowList.add(tr);
        }
    }
}