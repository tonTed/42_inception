up:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

re: down up

fclean:
	docker system prune -a

build:
	docker-compose -f srcs/docker-compose.yml build

exec-nginx:
	docker exec -it nginx sh

exec-mariadb:
	docker exec -it mariadb sh

exec-wp:
	docker exec -it wordpress sh

run-nginx:
	docker run -it --rm -p 443:80 srcs-nginx

run-mariadb:
	docker run -it --rm -p 3306:3306 srcs-mariadb

Phony: up down re nginx