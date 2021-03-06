require 'test_helper'

class AttendeeApplicationMailerTest < ActionMailer::TestCase

  test "welcome_email" do
    attendee_application = attendee_applications(:one)
    # Send the email, then test that it got queued
    email = AttendeeApplicationMailer.welcome_email(attendee_application).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['railsgirlshh@gmail.com'], email.from
    assert_equal [attendee_application.email], email.to
    assert_equal 'Rails Girls Hamburg Workshop', email.subject
    assert_equal read_fixture('attendee_application_welcome_email').join, email.body.to_s
  end

  test "accepted_email" do
    attendee_application = attendee_applications(:one)
    # Send the email, then test that it got queued
    email = AttendeeApplicationMailer.accepted_email(attendee_application).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['railsgirlshh@gmail.com'], email.from
    assert_equal [attendee_application.email], email.to
    assert_equal 'Teilnahme am Rails Girls Hamburg Workshop', email.subject
    assert_equal read_fixture('attendee_application_accepted_email').join, email.body.to_s
  end

  test "rejected_email" do
    attendee_application = attendee_applications(:one)
    # Send the email, then test that it got queued
    email = AttendeeApplicationMailer.rejected_email(attendee_application).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['railsgirlshh@gmail.com'], email.from
    assert_equal [attendee_application.email], email.to
    assert_equal 'Keine Teilnahme am Rails Girls Hamburg Workshop', email.subject
    assert_equal read_fixture('attendee_application_rejected_email').join, email.body.to_s
  end
end
