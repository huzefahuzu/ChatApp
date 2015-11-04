require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_invitation" do
    mail = UserMailer.account_invitation
    assert_equal "Account invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
