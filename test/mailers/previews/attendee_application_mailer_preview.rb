# Preview all emails at http://localhost:3000/rails/mailers/attendee_application_mailer
class AttendeeApplicationMailerPreview < ActionMailer::Preview
 def welcome_email
    AttendeeApplicationMailer.welcome_email(AttendeeApplication.first)
 end

 def accepted_email
    AttendeeApplicationMailer.accepted_email(AttendeeApplication.first)
 end

 def rejected_email
    AttendeeApplicationMailer.rejected_email(AttendeeApplication.first)
 end

end
