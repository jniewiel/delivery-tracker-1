class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to("/deliveries")
    else
      redirect_to("/users/sign_in")
    end
  end

end
