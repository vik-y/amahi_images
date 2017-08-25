cat > docker-compose.yml << 'EOF'
redmine-container:
  image: 'redmine'
  container_name: "APP_IDENTIFIER"
  restart: unless-stopped
  hostname: 'APP_HOSTNAME'
  ports:
    - 'HOST_PORT:3000'
EOF
docker-compose up -d
