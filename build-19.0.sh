#!/bin/bash

# Script para build da imagem Odoo 19.0 standalone
# Este script não depende do docker-compose

set -e

IMAGE_NAME="odoo:19.0"
DOCKERFILE="Dockerfile-19.0"
CONTEXT_DIR="."

echo "🔨 Construindo imagem Docker para Odoo 19.0..."
echo "📁 Contexto: $CONTEXT_DIR"
echo "📄 Dockerfile: $DOCKERFILE"
echo "🏷️  Imagem: $IMAGE_NAME"
echo ""

# Build da imagem
docker build \
    --file "$DOCKERFILE" \
    --tag "$IMAGE_NAME" \
    --build-arg odoo_version=saas-19.0 \
    --build-arg DISTRO=noble \
    --build-arg PYTHONBIN=python3.12 \
    "$CONTEXT_DIR"

echo ""
echo "✅ Build concluído com sucesso!"
echo "🚀 Para executar o container:"
echo "   docker run -p 8069:8069 $IMAGE_NAME"
echo ""
echo "🔧 Para executar com PostgreSQL:"
echo "   docker run -p 8069:8069 -e DB_HOST=host.docker.internal -e DB_PORT=5432 -e DB_USER=odoo -e DB_PASSWORD=odoo $IMAGE_NAME"