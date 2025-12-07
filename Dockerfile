FROM n8nio/n8n:latest

# Cambia al usuario root para instalar paquetes
USER root

# Actualiza e instala FFmpeg (y opcionales como curl/wget si los necesitas)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Vuelve al usuario node para seguridad
USER node

# Comando por defecto de n8n
CMD ["n8n", "start"]
