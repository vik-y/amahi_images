cat > docker-compose.yml << 'EOF'
nzbget-container:
  image: 'docker.io/linuxserver/nzbget'
  container_name: "APP_IDENTIFIER"
  hostname: "APP_HOSTNAME"
  restart: unless-stopped
  ports:
    - 'HOST_PORT:6789'
  volumes:
    - './downloads:/downloads'
EOF
docker-compose up -d
