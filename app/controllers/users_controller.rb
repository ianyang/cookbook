class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      flash[:success] = "Welcome to the Cook Book app!"
      sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end

  def forgotpassword #get
  end

  def create_remember_token #get
    @params = params[:q]

    if ( @user = User.find_by_email(@params) )
      redirect_to 'http://www.google.com'
    else
      flash[:error] = "Email not found"
      redirect_to '/forgotpassword'
    end

    #finds users with email
    #if found, then
      #1. generate random number
      #2. set random numnber as remember token of user
      #3. sends out email
    #if email not found, then display error and render forgotpassword again

  end

  def reset #get
    #reset takes in params in remember token, and has forms to reset password
    #if not found, then display message
    #submit update
  end

  def update #post
    #update attributes of that user
  end

end

