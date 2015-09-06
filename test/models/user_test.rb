require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Cooper Webb', email: 'minicoop175@gmail.com')
  end
  
  test 'should be valid' do
    assert @user.valid?
  end
  
  test 'lolol' do
    assert 1 > 0
  end
    
end
