cat > docker-compose.yml << 'EOF'
logitech-ms-container:
  image: 'docker.io/larsks/logitech-media-server'
  container_name: "APP_IDENTIFIER"
  restart: unless-stopped
  ports:
    - 'HOST_PORT:9000'
    - '3484:3483/udp'
  volumes:
    - '/etc/localtime:/etc/localtime:ro'
    - './squeezebox:/srv/squeezebox'
    - './audio:/srv/music'
EOF
docker-compose up -d
