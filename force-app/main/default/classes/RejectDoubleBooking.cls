Public Class RejectDoubleBooking {
    Public static void Reject(List<Session_Speaker__c> sesSpeaker){
        
        list<Id> speakerIds = new List<Id>();
        List<Id> sessionIds = new List<Id>();
        
        For(Session_Speaker__c newItem : sesSpeaker) {
            speakerIds.add(newItem.Speaker__c);   
            sessionIds.add(newItem.Session__c); 
            
            // newItem.addError('Cannot add Speakers');
        }
    }
}