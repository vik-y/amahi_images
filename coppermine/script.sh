# FIXME - this needs to be hosted in dl.amahi.org prior to going live!
amahi-download coppermine-1.5.40.sql.gz 911a6f3b9dc8ffd5086e1aa6361c4bc21d1098c6;
#amahi-download http://bigfoot65.amahi.me/Public/mirror/coppermine-1.5.40.sql.gz 911a6f3b9dc8ffd5086e1aa6361c4bc21d1098c6;

chmod -R 777 html/albums html/include;

cat > html/include/config.inc.php << 'EOF'
<?php
// Coppermine configuration file
// MySQL configuration
$CONFIG['dbserver'] =                         'localhost:/var/run/mysql.sock';        // Your database server
$CONFIG['dbuser'] =                         'coppermine';        // Your mysql username
$CONFIG['dbpass'] =                         'coppermine';                // Your mysql password
$CONFIG['dbname'] =                         'coppermine';        // Your mysql database name
// MySQL TABLE NAMES PREFIX
$CONFIG['TABLE_PREFIX'] =                'cpg15x_';
?>
EOF

zcat coppermine-1.5.40.sql.gz |mysql -u$HDA_DB_USERNAME -p$HDA_DB_PASSWORD $HDA_DB_DBNAME;

cat > docker-compose.yml << 'EOF'
coppermine-container:
  image: vikasy/coppermine
  container_name: "APP_IDENTIFIER"
  ports:
    - "HOST_PORT:80"
  volumes:
    - WEBAPP_PATH/html:/var/www/html
    - /var/lib/mysql/mysql.sock:/var/run/mysql.sock
    # Uncomment this for development so that the host's static/ folder 
    # is mounted within the docker container.
    # - ./static:/usr/src/app/static
EOF
docker-compose up -d

