class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)
    @user.identities.where(provider: auth.provider, uid: auth.uid).first_or_create
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    auth = request.env["omniauth.auth"].except("extra")
    @user = User.from_omniauth(auth)
    @user.identities.where(provider: auth.provider, uid: auth.uid).first_or_create
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
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
