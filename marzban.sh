apt-get update; apt-get upgrade -y; apt-get install curl socat nano git -y 

curl -fsSL https://get.docker.com | sh

mkdir /var/lib/marzban-node
mkdir /var/lib/marzban
mkdir ~/marzban-node

cd ~/marzban-node

echo "
services:
  marzban-node:
    image: gozargah/marzban-node:latest
    restart: always
    network_mode: host

    environment:
      SSL_CLIENT_CERT_FILE: "/var/lib/marzban-node/ssl_client_cert.pem"
      SERVICE_PROTOCOL: "rest"
      SERVICE_PORT: "62050"
      XRAY_API_PORT: "62051"
      DEBUG: "false"

    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
" > docker-compose.yml


nano /var/lib/marzban-node/ssl_client_cert.pem

docker compose up -d --force-recreate
