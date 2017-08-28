cat > docker-compose.yml << 'EOF'
radarr-container:
  image: 'docker.io/linuxserver/radarr'
  container_name: "APP_IDENTIFIER"
  hostname: "APP_HOSTNAME"
  restart: unless-stopped
  ports:
    - 'HOST_PORT:7878'
  volumes:
    - './config:/config'
    - './downloads:/downloads'
    - './movies:/movies'
    - '/etc/localtime:/etc/localtime:ro'
EOF
docker-compose up -d
