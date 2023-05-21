# Use uma imagem base do Ruby
FROM ruby:3.1.0

# Instale as dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configure o diretório de trabalho do projeto
WORKDIR /app

# Instale as gems do projeto
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copie o código do projeto para o contêiner
COPY . .

# Exponha a porta que o servidor Rails estará ouvindo
EXPOSE 3000

# Configure o comando padrão para executar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
