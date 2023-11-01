#!/bin/bash

# Démarrer le service MariaDB
service mysql start

# Attendre que le service MariaDB démarre
sleep 5

# Créer la base de données
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Créer l'utilisateur et attribuer des privilèges
mysql -u root -p -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'wordpress.srcs_inception' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'wordpress.srcs_inception';"

# Rafraîchir les privilèges
mysql -u root -p -e "FLUSH PRIVILEGES"

# Arrêter le service MariaDB
mysqladmin -u root -p shutdown

exec mysqld_safe
