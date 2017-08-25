cat > docker-compose.yml << 'EOF'
portainer-container:
  image: 'docker.io/portainer/portainer'
  container_name: "APP_IDENTIFIER"
  hostname: "APP_HOSTNAME"
  restart: unless-stopped
  ports:
    - 'HOST_PORT:9000'
  volumes:
    - '/var/run/docker.sock:/var/run/docker.sock'
EOF
docker-compose up -d
