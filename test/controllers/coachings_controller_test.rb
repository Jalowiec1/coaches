require 'test_helper'

class CoachingsControllerTest < ActionController::TestCase
  setup do
    @coaching = coachings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coachings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coaching" do
    assert_difference('Coaching.count') do
      post :create, coaching: { coach_id: @coaching.coach_id, student_id: @coaching.student_id }
    end

    assert_redirected_to coaching_path(assigns(:coaching))
  end

  test "should show coaching" do
    get :show, id: @coaching
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coaching
    assert_response :success
  end

  test "should update coaching" do
    patch :update, id: @coaching, coaching: { coach_id: @coaching.coach_id, student_id: @coaching.student_id }
    assert_redirected_to coaching_path(assigns(:coaching))
  end

  test "should destroy coaching" do
    assert_difference('Coaching.count', -1) do
      delete :destroy, id: @coaching
    end

    assert_redirected_to coachings_path
  end
end
