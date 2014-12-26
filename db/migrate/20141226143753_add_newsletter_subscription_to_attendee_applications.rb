class AddNewsletterSubscriptionToAttendeeApplications < ActiveRecord::Migration
  def change
    add_column :attendee_applications, :newsletter_subscription, :boolean, default: false
  end
end
