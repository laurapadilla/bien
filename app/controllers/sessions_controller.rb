class SessionsController < ApplicationController

  def new
    # login form
  end

  def create
    # actually try to log in
      @form_data = params.require(:session)

      # pull out username and password from form form data
      @username = @form_data[:username]
      @password = @form_data[:password]

      # let's check the user is who they say they are
      @user = User.find_by(username: @username).try(:authenticate, @password)

      # if user is present, send them to homepage
      # if not, show the the login form
      if @user
        # save this user to that user's session
        session[:user_id] = @user.id

        redirect_to root_path
      else
        render "new"
      end
  end

  def destroy
    # log out
    # remove the session completely
    reset_session

    # redirect to login page
    redirect_to new_session_path, status: :see_other
  end

end
