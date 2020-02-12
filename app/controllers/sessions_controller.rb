class SessionsController < ApplicationController
  def new
  end

  def create
    # @user = User.find_by_email(params[:email])

    # If the user exists AND the password entered is correct.
    user = User.authenticate_with_credentials(params[:email], params[:password])
    puts ">"*80
    puts params[:email]
    if user
      @user = user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      flash[:error] = 'An error occured!'
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
end