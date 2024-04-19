-- Configurações de ambiente e comportamento do PostgreSQL
SET statement_timeout = 0;  -- Define o tempo limite para execução de consultas como ilimitado
SET lock_timeout = 0;  -- Define o tempo limite para aquisição de bloqueios como ilimitado
SET idle_in_transaction_session_timeout = 0;  -- Define o tempo limite para sessões inativas em transações como ilimitado
SET client_encoding = 'UTF8';  -- Define a codificação de caracteres do cliente como UTF-8
SET standard_conforming_strings = on;  -- Habilita o uso de strings conformes ao padrão
SET check_function_bodies = false;  -- Desativa a verificação dos corpos das funções
SET client_min_messages = warning;  -- Define o nível mínimo de mensagens do cliente como aviso
SET row_security = off;  -- Desativa a segurança de linha

-- Criação e configuração da extensão PL/pgSQL
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;  -- Cria a extensão PL/pgSQL se ela ainda não existir
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';  -- Adiciona um comentário à extensão PL/pgSQL

-- Configuração do caminho de busca padrão
SET search_path = public, pg_catalog;  -- Define o caminho de busca padrão para objetos no banco de dados

-- Configurações adicionais
SET default_tablespace = '';  -- Define o espaço de tabela padrão como vazio
SET default_with_oids = false;  -- Desativa a inclusão de OIDs em novas tabelas por padrão

-- Criação da tabela "visitors"
CREATE TABLE visitors (
    site_id integer,
    site_name text,
    visitor_count integer
);

-- Altera o proprietário da tabela "visitors" para o usuário "postgres"
ALTER TABLE visitors OWNER TO postgres;

-- Concede todos os privilégios ao usuário "postgres" para o banco de dados "admdimdim"
GRANT ALL PRIVILEGES ON DATABASE admdimdim TO postgres;

-- Insere um novo registro na tabela "visitors" com valores específicos
INSERT INTO visitors (site_id, site_name, visitor_count) VALUES (1, 'fiap.example.com.br', 0);
