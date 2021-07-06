@istest
public class testUpdateOldSalary {
    @isTest static void testOldSalaryupdate(){
        testUpdateOldSalary.insertEmployee();
        List<employee__c> empUpdtList = new List<employee__c>();
        for(employee__c emp : [Select Salary__c from employee__c]){
            emp.Salary__c = 90000;
            empUpdtList.add(emp);
        }
        
        test.startTest();
        update empUpdtList;
        test.stopTest();
        
        for(employee__c employee :[select Previous_Salary__C from employee__c] ){
           system.assertEquals(String.valueOf(employee.Previous_Salary__C),'80000');
        }
    }
    
    static void insertEmployee(){
        List<employee__c> empInsertList = New List<employee__c>();
        for(integer i=0;i<5;i++){
            employee__c emp = New employee__c();
            emp.Name = 'Test' + String.valueOf(i);
            emp.Location__c = 'Test';
            emp.salary__c = 80000;
            empInsertList.add(emp);
        }
        
        insert empInsertList;
    } 
    
}