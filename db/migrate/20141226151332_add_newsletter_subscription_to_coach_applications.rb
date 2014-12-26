class AddNewsletterSubscriptionToCoachApplications < ActiveRecord::Migration
  def change
    add_column :coach_applications, :newsletter_subscription, :boolean, default: false
  end
end
