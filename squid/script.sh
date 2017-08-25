cat > docker-compose.yml << 'EOF'
squid-container:
  image: 'docker.io/sameersbn/squid:3.3.8-23'
  container_name: "APP_IDENTIFIER"
  hostname: "APP_HOSTNAME"
  restart: unless-stopped
  ports:
    - '3128:3128'
  volumes:
    - './cache:/var/spool/squid3'
EOF
docker-compose up -d
