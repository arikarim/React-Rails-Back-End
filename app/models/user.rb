class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable,
  #        :jwt_authenticatable,
  #        :registerable,
  #        jwt_revocation_strategy: JwtDenylist
   # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  has_many :posts
end
