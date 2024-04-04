class UserController < ApplicationController
	#before_action :set_user, only: [:change_password]

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

  def change_password
    if @current_user.update(password: params[:new_password])
      render json: { message: 'Senha alterada com sucesso' }
    else
      render json: { error: 'Erro ao alterar a senha' }, status: :unprocessable_entity
    end
  end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.permit(:email, :password, :password_confirmation)
	end
end
