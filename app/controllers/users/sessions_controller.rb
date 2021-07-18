class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  # private

  # def respond_with(resource, _opts = {})
  #   if current_user
  #     render json: {resource: resource, message: 'You are logged in.'}, status: :ok
  #   else
  #     render json: { message: 'Theres no user, You are not logged in.' }, status: :unauthorized
  #   end
  # end

  # def respond_to_on_destroy
  #   log_out_success && return if current_user

  #   log_out_failure
  # end

  # def log_out_success
  #   render json: { message: 'You are logged out.' }, status: :ok
  # end

  # def log_out_failure
  #   render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  # end
end
