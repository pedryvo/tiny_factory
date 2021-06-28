# test/integration_test.rb

require "test_helper"

class IntegrationTest < Minitest::Test
  def setup
    TinyFactory.define :user do
      first_name { "Alexandre" }
      last_name { "Ruban" }
      email { "#{first_name}@hey.com".downcase }
    end
  end

  def test_attributes_for
    attributes = attributes_for(:user)

    assert_kind_of Hash, attributes

    assert_equal "Alexandre",         attributes[:first_name]
    assert_equal "Ruban",             attributes[:last_name]
    assert_equal "alexandre@hey.com", attributes[:email]
  end

  def test_build
    user = build(:user)

    assert_kind_of User, user
    assert user.new_record?

    assert_equal "Alexandre",         user.first_name
    assert_equal "Ruban",             user.last_name
    assert_equal "alexandre@hey.com", user.email
  end

  def test_create
    user = create(:user)

    assert_kind_of User, user
    assert user.persisted?

    assert_equal "Alexandre",         user.first_name
    assert_equal "Ruban",             user.last_name
    assert_equal "alexandre@hey.com", user.email
  end
end