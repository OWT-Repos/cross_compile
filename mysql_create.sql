-- Create database used in the software
CREATE DATABASE datalog;

-- Create user used in the software
CREATE USER 'admin' @'%' IDENTIFIED BY 'password';

-- Grant user privileges in the database
GRANT ALL PRIVILEGES ON datalog.* TO 'admin' @'%';