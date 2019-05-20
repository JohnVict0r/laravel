initialize:
	- docker-compose up -d
	- docker exec -it projeto cp .env.example .env
	- docker exec -it projeto composer install
	- docker exec -it projeto php artisan key:generate
	- docker exec -it projeto bash -c "cd public && ln -s ../storage/app/public storage"
	- docker exec -it projeto php artisan migrate
	- docker exec -it projeto php artisan db:seed
	- docker-compose stop

start:
	- docker-compose up

stop:
	- docker-compose stop

sh:
	- docker exec -it projeto  sh

bash:
	- docker exec -it projeto  bash