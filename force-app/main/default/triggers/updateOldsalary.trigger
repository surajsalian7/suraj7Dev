trigger updateOldsalary on employee__c (before update) {
    //This trigger adds the old salary in comments
    
    if(trigger.isbefore && trigger.isUpdate){
    	updateSalaryCommentHandler.updateSalaryComment(Trigger.newMap,Trigger.oldMap);
    }

}