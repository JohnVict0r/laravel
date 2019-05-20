FROM ambientum/php:7.2

# Reset user to root
USER root

COPY composer.json ./
COPY database ./database

RUN composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts

COPY ./ ./

RUN cp .env.example .env
RUN php artisan key:generate
RUN php artisan storage:link