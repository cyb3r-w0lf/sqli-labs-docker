# Use the official PHP 7.4 image with Apache as base
FROM php:7.4-apache


# Install extra utilities, MariaDB server, and Supervisor
RUN apt-get update && apt-get install -y \
    vim \
    nano \
    unzip \
    mariadb-server \
    supervisor \
    && docker-php-ext-install mysqli \
    && apt-get clean 

# Enable Apache mod_rewrite for .htaccess support
RUN a2enmod rewrite

# Copy the SQLi-Labs project into Apache's document root
COPY ./ /var/www/html/

# Fix permissions so Apache can access the files
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html

# Copy Supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy our custom entrypoint script that initializes MySQL and starts supervisord
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose port 80 for Apache
EXPOSE 80

# Use our entrypoint script
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
