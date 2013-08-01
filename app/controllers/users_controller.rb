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

  def password_reset #post
    @params = params[:q]
    if ( @user = User.find_by_email(@params) )
      @user.create_remember_token
      @user.save
      UserMailer.reset_email(@user).deliver
      redirect_to '/signin'
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

    if @user = User.find_by_remember_token(params[:remember_token])
      render '/reset'
    else
      redirect_to '/not_found'
    end

    #reset takes in params in remember token, and has forms to reset password
    #if not found, then display message
    #submit update

  end

  def update #post
    #update attributes of that user
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      @user.create_remember_token
      flash[:success] = "Password updated successfully"
      sign_in @user
      redirect_to @user
    else
      @link = "/resetpassword/"+@user.remember_token.to_s
      redirect_to @link
      flash[:error] = "Password problem. Please try again"
    end

  end

  def not_found
  end

end

