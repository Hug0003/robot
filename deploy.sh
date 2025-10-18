#!/bin/bash

# Script de déploiement pour Raspberry Pi
echo "🚀 Déploiement de l'application sur Raspberry Pi..."

# Variables
APP_NAME="portfolio3d"
WEB_DIR="/var/www/$APP_NAME"
NGINX_SITES="/etc/nginx/sites-available"
NGINX_ENABLED="/etc/nginx/sites-enabled"

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Vérifier si on est root
if [ "$EUID" -ne 0 ]; then
    log_error "Veuillez exécuter ce script en tant que root (sudo)"
    exit 1
fi

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null; then
    log_warning "Node.js n'est pas installé. Installation en cours..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt-get install -y nodejs
fi

# Vérifier si npm est installé
if ! command -v npm &> /dev/null; then
    log_error "npm n'est pas installé"
    exit 1
fi

log_info "Installation des dépendances..."
npm install

if [ $? -ne 0 ]; then
    log_error "Erreur lors de l'installation des dépendances npm"
    exit 1
fi

log_info "Construction de l'application..."
npm run build

if [ $? -ne 0 ]; then
    log_error "Erreur lors de la construction de l'application"
    exit 1
fi

# Créer le répertoire web
log_info "Création du répertoire web..."
mkdir -p $WEB_DIR

# Copier les fichiers du build
log_info "Copie des fichiers..."
cp -r dist/* $WEB_DIR/

# Donner les bonnes permissions
log_info "Configuration des permissions..."
chown -R www-data:www-data $WEB_DIR
chmod -R 755 $WEB_DIR

# Installer Nginx si nécessaire
if ! command -v nginx &> /dev/null; then
    log_info "Installation de Nginx..."
    apt update
    apt install nginx -y
fi

# Copier la configuration Nginx
log_info "Configuration de Nginx..."
cp nginx.conf $NGINX_SITES/$APP_NAME

# Créer le lien symbolique
log_info "Activation du site..."
ln -sf $NGINX_SITES/$APP_NAME $NGINX_ENABLED/

# Supprimer la configuration par défaut si elle existe
if [ -f "$NGINX_ENABLED/default" ]; then
    rm $NGINX_ENABLED/default
fi

# Tester la configuration Nginx
log_info "Test de la configuration Nginx..."
nginx -t

if [ $? -eq 0 ]; then
    log_success "Configuration Nginx valide"
    # Redémarrer Nginx
    systemctl restart nginx
    systemctl enable nginx
    log_success "Nginx redémarré"
    
    # Afficher l'IP de la Raspberry Pi
    IP=$(hostname -I | awk '{print $1}')
    log_success "Déploiement terminé !"
    echo ""
    log_info "📱 Votre application est accessible à l'adresse :"
    echo -e "${GREEN}   http://$IP${NC}"
    echo ""
    log_info "🔧 Commandes utiles :"
    echo "   - Redémarrer Nginx: sudo systemctl restart nginx"
    echo "   - Voir les logs: sudo tail -f /var/log/nginx/error.log"
    echo "   - Mettre à jour: git pull && npm run build && sudo ./deploy.sh"
else
    log_error "Erreur dans la configuration Nginx"
    exit 1
fi
