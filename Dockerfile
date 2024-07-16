FROM cryptpad/cryptpad:version-2024.6.0
WORKDIR /cryptpad/lib/plugins
RUN git clone https://github.com/cryptpad/sso/

# Entweder hier die Konfiguration reinkopieren mit
#
# COPY sso.example.js /cryptpad/config/sso.js
#
# oder beim Erstellen des Containers die Datei vom Host in den Container
# einbinden mit
#
# docker run -v /path/to/sso.example.js:/cryptpad/config/sso.js:ro -d cryptpad
#
# oder falls eine docker-compose.yaml verwendet wird, kann die Datei auch dort
# eingebunden werden
#
# ```
# services:
#   cryptpad: # Beispielname
#     volumes:
#       # Pfad auf dem Host:Ziel im Container:ro
#       # wobei ":ro" optional ist und für "read-only" steht
#       - /path/to/sso.example.js:/cryptpad/config/sso.js:ro
# ```
#
# Container Image bauen mit
#
# docker build -t cryptpad .
#
# Wenn es auf Dockerhub hochgeladen werden soll (dann vorzugsweise OHNE
# eingebette Config wie in Zeile 7 beschrieben), dann braucht man einen Account
# auf Dockerhub und muss sich einloggen mit "docker login". Der Name des Images
# muss dann mit dem Dockerhub-Username beginnen, z.B. "docker build -t
# username/cryptpad .". Das Image kann dann mit "docker push username/cryptpad"
# hochgeladen werden.
#
# Alternativ kann die Dockerfile auch direkt in docker-compose.yaml verwendet
# werden
#
# ```
# services:
#   cryptpad:
#     build:
#       context: .
#       dockerfile: Dockerfile
#     volumes:
#       - /path/to/sso.example.js:/cryptpad/config/sso.js:ro
# ```
#
# Dabei muss die Dockerfile im selben Verzeichnis (neben) der
# docker-compose.yaml liegen.
#
#
