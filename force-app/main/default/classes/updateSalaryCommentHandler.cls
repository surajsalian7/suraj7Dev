public class updateSalaryCommentHandler {
    public static void updateSalaryComment(Map<id,employee__c> newMap, Map<id,employee__c> oldMap){
        for(employee__c emp: newMap.values()){
            //system.debug(oldMap.get(emp.id).salary__c);
            if(emp.Salary__c <> oldMap.get(emp.id).salary__c){
                	emp.Previous_Salary__c =  String.valueOf(oldMap.get(emp.id).salary__c); 
            }
        }
    }
}