cat > docker-compose.yml << 'EOF'
sonarr-container:
  image: 'docker.io/linuxserver/sonarr'
  container_name: "APP_IDENTIFIER"
  hostname: "APP_HOSTNAME"
  restart: unless-stopped
  ports:
    - 'HOST_PORT:8989'
  volumes:
    - '/etc/localtime:/etc/localtime:ro'
    - './tv:/tv'
    - './downloads:/downloads'
EOF
docker-compose up -d
