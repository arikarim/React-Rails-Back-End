class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {user: current_user, message: "If you see this, you're in!" }
  end
end
