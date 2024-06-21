class UsersController < ApplicationController

  def sign_in
    redirect_to("/users/sign_in")
  end

end
