#!/bin/bash

# Fonction pour afficher un message en vert
log_success() {
  echo -e "\033[32m$1\033[0m"  # Vert
}

# Fonction pour afficher un message en jaune
log_wait() {
  echo -e "\033[33m$1\033[0m"  # Jaune
}

# Fonction pour afficher un message en bleu
log_info() {
  echo -e "\033[34m$1\033[0m"  # Bleu
}

# Démarrer le service MariaDB
log_info "Démarrage du service MariaDB..."
service mysql start

# Attendre que le service MariaDB démarre
sleep 1
log_info "Attente du démarrage du service MariaDB..."
while true; do
    if mysqladmin ping -h localhost -u root -p  --silent; then
        break
    fi
    log_info "En attente du démarrage du service MariaDB..."
    sleep 1
done
log_success "Le service MariaDB est démarré avec succès."

# Créer la base de données
sleep 1
log_info "Création de la base de données..."
mysql -u root -p  -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
log_success "Base de données créée avec succès."

# Créer l'utilisateur et attribuer des privilèges
sleep 1
log_info "Création de l'utilisateur et attribution des privilèges..."
mysql -u root -p  -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'wordpress.srcs_inception' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -p  -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'wordpress.srcs_inception';"
log_success "Utilisateur créé et privilèges attribués avec succès."

# Rafraîchir les privilèges
sleep 1
log_info "Rafraîchissement des privilèges..."
mysql -u root -p  -e "FLUSH PRIVILEGES"
log_success "Privilèges rafraîchis avec succès."

# Arrêter le service MariaDB
sleep 1
log_info "Arrêt du service MariaDB..."
mysqladmin -u root -p  shutdown

exec mysqld_safe
