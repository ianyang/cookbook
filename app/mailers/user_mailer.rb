class UserMailer < ActionMailer::Base
  default from: "ian@ianyang.co"

  def welcome_email(user)
      @user = user
      @url  = 'http://localhost:3000/signin'
      mail(to: @user.email, subject: 'Welcome to Le Cook Book App')
  end

end