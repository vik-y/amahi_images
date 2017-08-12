cat > docker-compose.yml << 'EOF'   
simplemde-container:
  image: 'docker.io/v4tech/markdown-editor'
  container_name: "APP_IDENTIFIER"
  restart: unless-stopped
  hostname: 'APP_HOSTNAME'
  ports:
    - 'HOST_PORT:80'
EOF
docker-compose up -d
