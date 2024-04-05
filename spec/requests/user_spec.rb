require 'swagger_helper'
require 'factory_bot_rails'

RSpec.describe 'Users', type: :request do

    path '/register' do
          post('create user') do
          tags 'Register User'
          consumes 'application/json'
          produces 'application/json'

          parameter RequestUserHelpers.user_params_parameter

        response(201, 'successful') do
            let(:user_params) { { email: 'email@email.com', password: '1234567890',  password_confirmation: '1234567890' } }
            examples RequestUserHelpers.user_register_example

            run_test!
        end
      end
    end

    path '/login' do
            post('login') do
              tags 'Authentication User'
              consumes 'application/json'
              produces 'application/json'

              parameter name: 'email', in: :query, type: :string, description: 'Email', value: 'email@email.com'
              parameter name: 'password', in: :query, type: :string, description: 'Password', value: '1234567890'

              response(200, 'successful') do
                let(:schema) { user_schema }
                examples RequestUserHelpers.user_example
                run_test!
            end
        end
    end
    

    path '/users/{id}/update_password' do
        put('update password') do
          tags "Change Password"
          consumes 'application/json'
          produces 'application/json'

          parameter name: :id, in: :path, type: :string, description: 'User ID', required: true, value: '1'
          parameter name: :password, in: :query, type: :string, description: 'New Password', required: true
          parameter name: :password_confirmation, in: :query, type: :string, description: 'New Password Confirmation', required: true

            response(200, 'successful') do
                let(:user) { create(:user) }
                let(:id) { user.id }
                let(:password) { 'new_password' } 
                let(:password_confirmation) { 'new_password' } 

                examples RequestUserHelpers.change_password_example

                run_test!
            end
        end
    end    


end
