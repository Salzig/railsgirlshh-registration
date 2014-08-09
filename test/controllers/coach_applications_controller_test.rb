require 'test_helper'

class CoachApplicationsControllerTest < ActionController::TestCase
  setup do
    @event = events(:minimal_event)
    @coach_application = coach_applications(:one)
  end

  test "should get new" do
    get :new, event_id: @event.id
    assert_response :success
  end

  test "should create coach_application" do
    assert_difference('CoachApplication.count') do
      post :create, event_id: @coach_application.event_id, coach_application: { application_text: @coach_application.application_text, email: @coach_application.email, event_id: @coach_application.event_id, first_name: @coach_application.first_name, last_name: @coach_application.last_name, other_text: @coach_application.other_text }
    end

    assert_redirected_to root_path
  end

  test "should not get new if registration is closed" do
    @event.coach_reg_end= Date.today-1
    @event.save
    get :new, event_id: @event.id
    assert_redirected_to root_path
  end

  test "should not create coach_application if registration is closed" do
    @event.coach_reg_end= Date.today-1
    @event.save

    assert_no_difference('CoachApplication.count') do
      post :create, event_id: @coach_application.event_id, coach_application: { application_text: @coach_application.application_text, email: @coach_application.email, event_id: @coach_application.event_id, first_name: @coach_application.first_name, last_name: @coach_application.last_name, other_text: @coach_application.other_text}
    end

    assert_redirected_to root_path
  end

  test "should get self_care" do
    get :self_care, event_id: @coach_application.event_id, token: @coach_application.token
    assert_response :success
  end

  test "should cancel coach_application" do
    assert_difference('CoachApplication.canceled.count') do
      post :cancel, event_id: @event.id, token: @coach_application.token
    end

    assert_redirected_to root_path
  end
end