class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_invitation.subject
  #
  def account_invitation(user)

  		@user = user

  		user = user.receiver

    	mail to: user.email , subject: "Invitation Request."

  end
end
