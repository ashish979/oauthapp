class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    auth = request.env["omniauth.auth"].except("extra")
    @user = User.from_omniauth(auth)
    Identity.find_or_create(@user.email, auth)
    if @user.persisted?
      sign_in @user, :event => :authentication
      redirect_to root_path
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
