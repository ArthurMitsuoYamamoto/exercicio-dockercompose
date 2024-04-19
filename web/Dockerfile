# Define a imagem base como python:3.9-slim
FROM python:3.9-slim

# Atualiza os repositórios de pacotes do sistema operacional
RUN apt-get update -y

# Instala as dependências necessárias para o psycopg2 (um adaptador de banco de dados PostgreSQL para Python)
RUN apt-get install libpq-dev python-dev -y

# Cria um novo grupo chamado 'flaskgroup'
RUN groupadd flaskgroup && \
    # Cria um novo usuário chamado 'flask' pertencente ao grupo 'flaskgroup', com diretório inicial /home/flask/app/web e shell /bin/bash
    useradd -m -g flaskgroup -s /bin/bash flask

# Adiciona permissões para o usuário 'flask' executar comandos com sudo sem precisar de senha
RUN echo "flask ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Cria o diretório /home/flask/app/web dentro do contêiner
RUN mkdir -p /home/flask/app/web

# Define o diretório de trabalho dentro do contêiner como /home/flask/app/web
WORKDIR /home/flask/app/web

# Copia o arquivo requirements.txt do host para o diretório /home/flask/app/web no contêiner
COPY requirements.txt /home/flask/app/web

# Instala as dependências do Python listadas no arquivo requirements.txt usando o pip
RUN pip install --no-cache-dir -r requirements.txt

# Define o usuário e grupo dono do diretório /home/flask como 'flask:flaskgroup'
RUN chown -R flask:flaskgroup /home/flask

# Define o usuário padrão do contêiner como 'flask'
USER flask

# Define o ponto de entrada do contêiner como gunicorn, configurando-o para executar a aplicação Flask na porta 8000
ENTRYPOINT ["/usr/local/bin/gunicorn", "--bind", ":8000", "app:app", "--reload", "--workers", "16"]
