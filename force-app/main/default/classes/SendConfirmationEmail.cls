public class SendConfirmationEmail {
    Public static void sendEmail(List<Session_Speaker__c> sesSpeaker ){
        List<Session_Speaker__c> sessionSpeakers =
            [SELECT Session__r.Name,
             Session__r.Date__c,
             Speaker__r.Last_Name__c,
             Speaker__r.Email__c
             FROM Session_Speaker__c WHERE Id IN :sesSpeaker
             AND Speaker__r.Email__c <> NULL];
        
        if(sessionSpeakers.size() > 0) {
            String[] addresses = new String[]{},
                subjects = new String[]{},
                    messages = new String[]{};
                        for(Session_Speaker__c sessionSpeaker: sessionSpeakers)	{
                            addresses.add(sessionSpeaker.Speaker__r.Email__c);
                            subjects.add('Speaker Confirmation');
                            messages.add('Dear ' + sessionSpeaker.Speaker__r.Name +
                                         ',\nYour session "' + sessionSpeaker.Session__r.Name + '" on ' +
                                         sessionSpeaker.Session__r.Date__c + ' is confirmed.\n\n' +
                                         'Thanks for speaking at the conference!');
                        }
            EmailManager.sendMail(addresses, subjects, messages);
        }
    }
}