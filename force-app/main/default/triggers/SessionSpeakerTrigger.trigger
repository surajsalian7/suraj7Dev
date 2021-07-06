trigger SessionSpeakerTrigger on Session_Speaker__c (before insert, before update, after insert) {

    if(trigger.isInsert && trigger.isAfter){
        //SendConfirmationEmail.sendEmail(trigger.New);
    }
    
    if(trigger.isInsert && trigger.isBefore){
        RejectDoubleBooking.Reject(trigger.new);       
    }
    
}