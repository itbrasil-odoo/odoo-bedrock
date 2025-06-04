# Odoo 18.3 Standalone Docker

Este Dockerfile permite executar o Odoo 18.3 sem depender do docker-compose, integrando diretamente a base do Dockerfile-18.0.

## 🚀 Build e Execução

### Build Standalone (Recomendado para ambientes remotos)

```bash
# Executar o script de build
./build-18.3.sh

# Ou fazer build manual
docker build -f Dockerfile-18.3 -t odoo:18.3 \
  --build-arg odoo_version=saas-18.3 \
  --build-arg DISTRO=noble \
  --build-arg PYTHONBIN=python3.12 \
  .
```

### Execução Simples

```bash
# Apenas Odoo (sem banco)
docker run -p 8069:8069 odoo:18.3

# Com PostgreSQL externo
docker run -p 8069:8069 \
  -e DB_HOST=seu-postgres-host \
  -e DB_PORT=5432 \
  -e DB_USER=odoo \
  -e DB_PASSWORD=sua-senha \
  odoo:18.3
```

### Com Docker Compose (Desenvolvimento Local)

```bash
# Usar o compose específico do 18.3
docker-compose -f docker-compose-18.3.yml up -d
```

## 🔧 Configurações

### Variáveis de Ambiente

- `DB_HOST`: Host do PostgreSQL
- `DB_PORT`: Porta do PostgreSQL (padrão: 5432)
- `DB_USER`: Usuário do banco
- `DB_PASSWORD`: Senha do banco
- `ADDONS_PATH`: Caminho dos addons (já configurado)

### Portas Expostas

- `8069`: Interface web do Odoo
- `8072`: Longpolling

### Volumes

- `/data/odoo`: Dados do Odoo (filestore, etc.)
- `/odoo/src/extra_addons`: Addons customizados

## 📂 Estrutura

O Dockerfile-18.3 agora possui três estágios:

1. **Base**: Configuração base do Ubuntu com Python e dependências
2. **Build**: Download e compilação do Odoo 18.3
3. **Runtime**: Imagem final otimizada para execução

## ✨ Características

- ✅ Não depende de docker-compose
- ✅ Multi-stage build para otimização
- ✅ Base integrada do Dockerfile-18.0
- ✅ Shell ZSH com tema Spaceship
- ✅ Suporte a addons customizados
- ✅ Cache de pip otimizado
- ✅ Design themes incluídos

## 🐛 Troubleshooting

### Build Errors

Se encontrar erros de build, verifique:
1. Conexão com internet (para downloads)
2. Espaço em disco suficiente
3. Docker com build kit habilitado

### Runtime Issues

- Verifique se o PostgreSQL está acessível
- Confirme as variáveis de ambiente de banco
- Verifique os logs: `docker logs <container-id>`
