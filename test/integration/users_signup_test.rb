require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div.alert-danger', text: 'The form contains 4 errors.'
    assert_select 'div#error_explanation ul li', count: 4
    assert_select 'li', text: 'Name can\'t be blank', count: 1
    assert_select 'li', text: 'Email is invalid', count: 1
    assert_select 'li', text: 'Password confirmation doesn\'t match Password', count: 1
    assert_select 'li', text: 'Password is too short (minimum is 6 characters)', count: 1
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert_select 'div.alert-success', text: 'Welcome to the Sample App!'
  end

end
