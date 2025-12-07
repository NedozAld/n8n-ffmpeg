FROM n8nio/n8n:latest

# Instala FFmpeg como root
USER root

RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# Corrige el PATH para que el usuario node encuentre el comando "n8n"
ENV PATH="/usr/src/app/node_modules/.bin:/home/node/.npm-global/bin:$PATH"

# Corrige permisos del archivo de configuración (evita el warning)
RUN mkdir -p /home/node/.n8n && \
    touch /home/node/.n8n/config && \
    chown -R node:node /home/node/.n8n && \
    chmod 600 /home/node/.n8n/config

# Vuelve al usuario node (seguro)
USER node

# Comando de inicio correcto
CMD ["n8n", "start"]
