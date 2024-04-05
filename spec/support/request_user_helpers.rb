module RequestUserHelpers


    def self.user_example
        {
            'application/json' => {
                token: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.cur2kIbFqR8WAnjVG9uuFrs-kEmllisZ-tRU-h8DD0w",
            }
        }
    end

    def self.user_register_example
      {
        'application/json' => {
          message: "Usuário registrado com sucesso",
        }
      }
    end

    def self.user_register_erro_example
      {
        'application/json' => {
          error: {
            message: "Email has already been taken"
          }
        }
      }
    end

        def self.change_password_example
      {
        'application/json' => {
          message: "Senha atualizada com sucesso",
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
          created_at: { type: :string },
          updated_at: { type: :string }
        }
      }
    }
  }
end


    def self.id_parameter
      {
        name: :id,
        in: :path,
        type: :integer,
        required: true,
        description: 'User ID - O valor ficar "1" pq sera retorando o usuario logado', 
        value: '1'
      }
    end

    def self.password_parameter
      {
        name: :user_params, in: :body, schema: {
          type: :object,
          properties: {
            password: { type: :string, default: '123456' },
            password_confirmation: { type: :string, default: '123456' }
          },
          required: [ :password, :password_confirmation ]
        }
      }
    end


    def self.user_params_parameter(overrides = {})
      {
        name: :user_params, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string, default: 'email@email.com' },
            password: { type: :string, default: '1234567890' },
            password_confirmation: { type: :string, default: '1234567890' },
          },
          required: [:email, :password, :password_confirmation]
        }.merge(overrides)
      }
    end
end