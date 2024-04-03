require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end


require 'swagger_helper'
require 'factory_bot_rails'

RSpec.describe 'Users', type: :request do

    path '/register' do
          post('create user') do
          tags "products"
          consumes 'application/json'
          produces 'application/json'

          parameter RequestUserHelpers.user_params_parameter

          response(201, 'successful') do
              
              # FORMATO SCHEMA ESPERADO
              let(:schema) { user_schema }

              #EXEMPLO PARA APARECER
              examples RequestUserHelpers.product_example

              run_test!
          end
      end
    end

    path '/login' do
        post('login') do
            tags 'Authentication Client'
            consumes 'application/json'
            produces 'application/json'

            parameter name: 'email', in: :query, type: :string, description: 'Email', value: 'test@admin.com'
            parameter name: 'password', in: :query, type: :string, description: 'Password', value: '1234567890'
            
            response(200, 'successful') do
                
                # FORMATO SCHEMA ESPERADO
                let(:schema) { auth_schema }

                #EXEMPLO PARA APARECER
                examples RequestAuthHelpers.auth_example

                run_test!
            end
        end
    end


end
