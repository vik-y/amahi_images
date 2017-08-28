cat > docker-compose.yml << 'EOF'
gitlab-container:
  image: 'gitlab/gitlab-ce:latest'
  container_name: "APP_IDENTIFIER"
  restart: unless-stopped
  hostname: 'APP_HOSTNAME'
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'http://APP_HOSTNAME:HOST_PORT'
      gitlab_rails['gitlab_shell_ssh_port'] = 2224
  ports:
    - 'HOST_PORT:HOST_PORT'
    - '2224:22'
  volumes:
    - './srv/gitlab/config:/etc/gitlab'
    - './srv/gitlab/logs:/var/log/gitlab'
    - './srv/gitlab/data:/var/opt/gitlab'
EOF
docker-compose up -d
