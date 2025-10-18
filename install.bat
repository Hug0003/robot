@echo off
echo 🚀 Installation automatique du projet React...
echo.

echo 📦 Vérification de Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js n'est pas installé !
    echo 📥 Veuillez télécharger Node.js depuis https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Node.js détecté
echo.

echo 📦 Installation des dépendances npm...
npm install

if %errorlevel% neq 0 (
    echo ❌ Erreur lors de l'installation des dépendances
    pause
    exit /b 1
)

echo ✅ Dépendances installées avec succès !
echo.
echo 🎉 Installation terminée !
echo.
echo 🚀 Pour lancer en développement : npm run dev
echo 🏗️ Pour construire : npm run build
echo.
pause
