# Define a mailer class for sending emails
class EventMailer < ApplicationMailer
    def notification(recipient_email,event_type)
      mail(to: recipient_email, subject: "Notification for  #{event_type}")
    end
end
  