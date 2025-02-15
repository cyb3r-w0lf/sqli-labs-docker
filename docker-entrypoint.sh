#!/bin/bash
set -e

# If the data directory hasn't been initialized, do so.
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MySQL database... \n"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

echo "Starting temporary MySQL instance to execute initialization queries...\n"
# Start MySQL temporarily in the background.
mysqld_safe --datadir=/var/lib/mysql &
  
# Wait until MySQL is available (up to ~60 seconds).
RETRIES=30
until mysqladmin ping --silent; do
    echo "Waiting for MySQL to be available...\n"
    sleep 2
    RETRIES=$((RETRIES-1))
    if [ $RETRIES -le 0 ]; then
        echo "MySQL did not start in time.\n"
        exit 1
    fi
done

# Run the SQL query to set the root password and create the database.
mysql --user=root --password=root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password AS PASSWORD('root');
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS security;
EOF

echo "Shutting down temporary MySQL instance...\n"
mysqladmin --user=root --password=root shutdown

echo "Starting Supervisor (which will launch both Apache and MySQL)...\n"
exec /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf

