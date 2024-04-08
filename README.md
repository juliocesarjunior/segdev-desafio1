# Segdev - Backend Desafio 1

A tarefa é criar um microserviço de usuários em Ruby on Rails (CRUD de usuários, geração de token seguro e troca de password (não precisa enviar o e-mail)). Sim, o desafio é subjetivo! Nele será avaliada a interpretação do problema, a solução desenvolvida, a legibilidade do código e o zelo com a entrega/descrição da solução.

## Configurando o sistema
Para configurar o sistema no seu computador você precisa do ruby configurado no seu computador.

* Ruby: 3.2.1
* Rails: 7.0.8

Siga os passos abaixo para configurar o sistema no seu computador.
1. Instale todas as dependências do Rails (gems) executando o comando: `bundle install`
2. Configure o arquivo database.yml localizado na pasta config com seu usuário e senha do banco de dados.
3. Com o banco de dados configurado, crie os bancos de dados executando:  `rails db:create`
4. Execute as migrações do banco de dados com o comando: `rails db:migrate`

# Iniciando o projeto
Agora com tudo configurado, basta executa `rails s`

## Documentação Swagger
Para acessar a documentação Swagger da API, siga os passos abaixo:
```bash
	http://localhost:3000/api-doc
```

## Acesso via API
Para acessar a API, você pode utilizar programas como o Postman, Restfox, Insomnia, entre outros.

### Criar Usuario:
Endpoint para Criação:
POST `/register`

Exemplo do corpo da solicitação:
```bash
{
  "email": "email@email.com",
  "password": "1234567890",
  "password_confirmation": "1234567890"
}
```

### Autenticação:
Endpoint para autenticação:
POST `/login`

Exemplo do corpo da solicitação:
```bash
{
  "email": "email@email.com",
  "password": "1234567890"
}
```

### Troca de password:
Troca a senha de um usuario específico por ID:
GET `/users/{id}/update_password`
```bash
{
  "password": "123456",
  "password_confirmation": "123456"
}
```

## Testes com RSpec
Para executar os testes automatizados nos modelos, utilize o seguinte comando:
```bash
	bundle exec rspec spec/models
```
Apenas Testes RSpec nos Modelos:
1. Usuarios
