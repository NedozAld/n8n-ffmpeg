FROM n8nio/n8n:latest

# Cambia al usuario root para instalar paquetes
USER root

# Actualiza e instala FFmpeg (y opcionales como curl/wget si los necesitas)
RUN apk update && apk add --no-cache \
    ffmpeg \
    curl \
    wget \
  && rm -rf /var/cache/apk/*

# Vuelve al usuario node para seguridad
USER node

# Comando por defecto de n8n
CMD ["n8n", "start"]
