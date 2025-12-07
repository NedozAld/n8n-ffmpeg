FROM n8nio/n8n:latest

# Instala FFmpeg
USER root
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# Crea el directorio .n8n con permisos correctos
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Vuelve al usuario node (seguro)
USER node

# NO creamos ningún archivo config vacío → n8n lo crea solo con JSON válido al primer arranque

# Comando correcto
CMD ["n8n", "start"]
