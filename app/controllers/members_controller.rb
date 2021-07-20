class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {user: current_user, message: "Yeppa You did it" }
  end
end
