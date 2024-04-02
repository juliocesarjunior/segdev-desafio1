class AuthController < ApplicationController
  def register
    user = User.new(user_params)
    if user.save
      render json: { message: 'Usuário registrado com sucesso' }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, 'your_secret_key', 'HS256')
      render json: { token: token }
    else
      render json: { error: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
