cat > docker-compose.yml << 'EOF'
hydra-container:
  image: 'docker.io/linuxserver/hydra'
  container_name: "APP_IDENTIFIER"
  hostname: "APP_HOSTNAME"
  restart: unless-stopped
  ports:
    - 'HOST_PORT:5075'
  volumes:
    - './config:/config'
    - './downloads:/downloads'
    - '/etc/localtime:/etc/localtime:ro'
EOF
docker-compose up -d
