class SessionsController < ApplicationController
  def new
  end
  
  # Login
  # Stores the user in a session variable if the authentication is successful.  
  # it redirects the user to the root of the website (the posts controller) or
  # renders the new action again
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.authenticate(email, password)
        
    if user 
      session[:user_id] = user.id
      flash[:notice] = "You've been logged in."
      redirect_to :root 
    else
      flash[:error] = "Wrong credentials, please try again."
      render :action => "new"
    end
    
  end
  
  # logout
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out"
    redirect_to :root
  end

end
