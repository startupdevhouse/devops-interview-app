# README

To start this app on production environment:

1. Create database by rake db:create command or using postgres

To connect database to the application you need to set ENV variables, example below:

POSTGRES_PASSWORD=password
POSTGRES_USER=user
POSTGRES_DB=db_name
DATABASE_HOST=database_host
DATABASE_PORT=5432
DATABASE_SOCKET=

2. Run `rake db:migrate` to create database tables


