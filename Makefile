up:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

re: down up

nginx:
	docker exec -it nginx sh

Phony: up down re nginx