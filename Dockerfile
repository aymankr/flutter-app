# Utilisez l'image officielle de Dart pour construire l'application
FROM google/dart:latest AS build

# Définissez le répertoire de travail
WORKDIR /app

# Copiez les fichiers du projet dans le conteneur
COPY . .

# Installez les dépendances Flutter
RUN dart pub get

# Activez le support web pour Flutter
RUN flutter config --enable-web

# Construisez l'application Flutter pour le web
RUN flutter build web

# Utilisez une image nginx pour servir l'application web
FROM nginx:alpine

# Copiez les fichiers de build de Flutter dans le répertoire nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# Exposez le port 80
EXPOSE 80

# Démarrez nginx
CMD ["nginx", "-g", "daemon off;"]
