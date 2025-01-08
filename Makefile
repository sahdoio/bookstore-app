# Variables
DC=docker compose --file docker-compose.yml --env-file ./src/.env

.PHONY: up down sh logs setup test migrate

up:
	$(DC) up -d --build
	$(DC) exec bookstore-api composer install
	$(DC) exec bookstore-api-node npm install

setup: up

down:
	$(DC) down

sh:
	$(DC) exec bookstore-api bash

test:
	$(DC) exec bookstore-api vendor/bin/pest --coverage

test-report:
	$(DC) exec bookstore-api vendor/bin/pest --coverage-html=report

logs:
	$(DC) logs -f --tail=10

migrate:
	$(DC) exec bookstore-api php artisan migrate

npm:
	$(DC) exec bookstore-api-node npm install

vite:
	$(DC) exec bookstore-api-node npm run dev
