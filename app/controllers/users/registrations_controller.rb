class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(sign_up_params)

    if user.save
    token = user.generate_jwt
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  # private

  # def respond_with(resource, _opts = {})
  #   register_success && return if resource.persisted?

  #   register_failed
  # end

  # def register_success
  #   render json: { message: 'Signed up sucessfully.', user: current_user }
  # end

  # def register_failed
  #   render json: { message: 'Something went wrong.' }
  # end
end
