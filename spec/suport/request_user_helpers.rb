module RequestUserHelpers


    def self.user_example
        {
            'application/json' => {
                message: "Login efetuado com sucesso!",
                token: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJlbWFpbCI6ImFkbWluQGFkbWluLmNvbSIsImV4cGlyZXNfaW4iOjE3MTY3MzUwMjd9.2hkpiKetoXcMPN10g2w24GT8DbzHThAhlx07qy9LXug",
            }
        }
    end

    def self.user_schema
        {
            type: :object,
            properties: {
               message: { type: :string },
               token: { type: :string },
               user: {
                    type: :object,
                    properties: {
                        id: { type: :integer },
                        email: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string }
                    }
                },
            }
        }
    end


    def self.user_params_parameter(overrides = {})
        {
            name: :user_params, in: :body, schema: {
                type: :object,
                properties: {
                    user: {
                        type: :object,
                        properties: {
                            email: { type: :string, default: 'email@email.com' },
                            password: { type: :string, default: '1234567890' },
                            password_confirmation: { type: :string, default: '1234567890' },
                            
                        },
                        required: [:email, :status, :password, :password_confirmation]
                    }
                }
            }.merge(overrides)
        }
    end
end