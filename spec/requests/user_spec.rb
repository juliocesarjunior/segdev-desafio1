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
              
              # FORMATO SCHEMA ESPERADO
              let(:schema) { user_schema }

              #EXEMPLO PARA APARECER
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

            parameter name: 'email', in: :query, type: :string, description: 'Email', value: 'test@admin.com'
            parameter name: 'password', in: :query, type: :string, description: 'Password', value: '1234567890'
            
            response(200, 'successful') do
                
                # FORMATO SCHEMA ESPERADO
                let(:schema) { user_schema }

                #EXEMPLO PARA APARECER
                examples RequestUserHelpers.user_example

                run_test!
            end
        end
    end


end
