class UserMailer < ActionMailer::Base
  default from: "ian@ianyang.co"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/signin'
    mail(to: @user.email, subject: 'Welcome to Le Cook Book App')
  end

  def reset_email(user)
    @user = user
    @url = "http://localhost:3000/resetpassword/"+@user.remember_token.to_s
    mail(to: @user.email, subject: 'Resetting your Password')
  end

end