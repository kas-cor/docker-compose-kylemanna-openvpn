# Docker Compose OpenVPN Server

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![OpenVPN](https://img.shields.io/badge/OpenVPN-EA7E20?style=for-the-badge&logo=openvpn&logoColor=white)](https://openvpn.net/)

English | [Русский](README_RU.md)

Simple and secure Docker-Compose setup for running OpenVPN server based on kylemanna/openvpn Docker image.
Up and running in less than two minutes!

## 🌟 Features

- Easy to setup and manage
- Secure by default configuration
- Script-based client management
- Support for both UDP and TCP protocols
- Automatic client configuration generation
- Client certificate revocation support
- Detailed logging of all operations

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🚀 Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/kas-cor/docker-compose-kylemanna-openvpn.git
   cd docker-compose-kylemanna-openvpn
   ```

2. **Configure Environment**
   ```bash
   cp .env.sample .env
   ```
   Edit `.env` file with your settings:
   ```env
   # Server Configuration
   HOSTNAME=myserver.com    # Your server's hostname or IP
   PROTO=udp               # Protocol (udp/tcp)
   PUBLIC_PORT=1194        # Public port for OpenVPN
   ```

3. **Install OpenVPN Server**
   ```bash
   ./00_install-OpenVPN-Server.sh
   ```

4. **Start the Server**
   ```bash
   docker-compose up -d
   ```

## 👥 Client Management

### Creating New Clients

```bash
# Without password protection
./create-new-client-and-get-conf.sh client_name nopass

# With password protection
./create-new-client-and-get-conf.sh client_name
```

The client configuration file will be saved to `client-confs/client_name.ovpn`

### Retrieving Existing Client Configuration

```bash
./get-client-conf.sh client_name
```

### Revoking Client Access

```bash
./revoke-client-conf.sh client_name
```

## 📁 Directory Structure

- `client-confs/` - Client configuration files
- `VPNclients.log` - Client management log file
- `.env` - Environment configuration
- `docker-compose.yml` - Docker compose configuration

## 💾 Data Persistence

By default, OpenVPN data is stored in Docker volumes at `/var/lib/docker/volumes/YOURSERVICENAME_ovpndata`.

To store data in a custom location:
1. Modify `docker-compose.yml` to use a local path:
   ```yaml
   volumes:
     - ./ovpn-data:/etc/openvpn
   ```
2. Set proper permissions:
   ```bash
   sudo chown -R $USER: ./ovpn-data
   ```

## 🔒 Security Notes

- All client activities are logged in `VPNclients.log`
- Client certificates can be revoked at any time
- Uses OpenVPN's secure defaults
- Built from source for transparency

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

This setup is provided as-is. Always review security settings and configurations before deploying in a production environment.