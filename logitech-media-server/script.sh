cat > docker-compose.yml << 'EOF'
logitech-ms-container:
  image: 'docker.io/larsks/logitech-media-server'
  container_name: "logitechms"
  restart: unless-stopped
  hostname: 'logitechms.example.com'
  ports:
    - 'HOST_PORT:9000'
    - '3484:3483/udp'
  volumes:
    - '/etc/localtime:/etc/localtime:ro'
    - './squeezebox:/srv/squeezebox'
    - './audio:/srv/music'
EOF
docker-compose up -d
