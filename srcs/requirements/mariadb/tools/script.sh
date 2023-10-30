#!/bin/bash

# Définir les variables d'environnement
# export DB_NAME="TONTED"
# export DB_USER="TONTED"
# export DB_PASSWORD="TONTED"
# export ROOT_PASSWORD="root"

# Démarrer le service MariaDB
service mysql start

# Attendre que le service MariaDB démarre
sleep 5

# Créer la base de données
mysql -u root -p${ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Créer l'utilisateur et attribuer des privilèges
mysql -u root -p${ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -p${ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'localhost';"

# Rafraîchir les privilèges
mysql -u root -p${ROOT_PASSWORD} -e "FLUSH PRIVILEGES"

# Arrêter le service MariaDB
mysqladmin -u root -p${ROOT_PASSWORD} shutdown

exec mysqld_safe