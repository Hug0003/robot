#!/bin/bash

echo "🚀 Installation automatique du projet React..."
echo

# Vérifier Node.js
echo "📦 Vérification de Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js n'est pas installé !"
    echo "📥 Veuillez installer Node.js depuis https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js détecté"
echo

# Installer les dépendances
echo "📦 Installation des dépendances npm..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Erreur lors de l'installation des dépendances"
    exit 1
fi

echo "✅ Dépendances installées avec succès !"
echo
echo "🎉 Installation terminée !"
echo
echo "🚀 Pour lancer en développement : npm run dev"
echo "🏗️ Pour construire : npm run build"
echo
