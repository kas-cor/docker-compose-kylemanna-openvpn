# Docker Compose OpenVPN Сервер

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![OpenVPN](https://img.shields.io/badge/OpenVPN-EA7E20?style=for-the-badge&logo=openvpn&logoColor=white)](https://openvpn.net/)

[English](README.md) | Русский

Простая и безопасная настройка OpenVPN сервера с использованием Docker Compose на базе образа kylemanna/openvpn.
Запуск и настройка занимает менее двух минут!

## 🌟 Возможности

- Простая установка и управление
- Безопасная конфигурация по умолчанию
- Управление клиентами через скрипты
- Поддержка протоколов UDP и TCP
- Автоматическая генерация конфигурации клиентов
- Поддержка отзыва сертификатов клиентов
- Подробное логирование всех операций

## 📋 Требования

Перед началом работы убедитесь, что у вас установлены:
- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🚀 Быстрый старт

1. **Клонирование репозитория**
   ```bash
   git clone https://github.com/kas-cor/docker-compose-kylemanna-openvpn.git
   cd docker-compose-kylemanna-openvpn
   ```

2. **Настройка окружения**
   ```bash
   cp .env.sample .env
   ```
   Отредактируйте файл `.env` под ваши нужды:
   ```env
   # Конфигурация сервера
   HOSTNAME=myserver.com    # Имя хоста или IP вашего сервера
   PROTO=udp               # Протокол (udp/tcp)
   PUBLIC_PORT=1194        # Публичный порт для OpenVPN
   ```

3. **Установка OpenVPN сервера**
   ```bash
   ./00_install-OpenVPN-Server.sh
   ```

4. **Запуск сервера**
   ```bash
   docker-compose up -d
   ```

## 👥 Управление клиентами

### Создание новых клиентов

```bash
# Без защиты паролем
./create-new-client-and-get-conf.sh имя_клиента nopass

# С защитой паролем
./create-new-client-and-get-conf.sh имя_клиента
```

Конфигурационный файл клиента будет сохранен в `client-confs/имя_клиента.ovpn`

### Получение существующей конфигурации клиента

```bash
./get-client-conf.sh имя_клиента
```

### Отзыв доступа клиента

```bash
./revoke-client-conf.sh имя_клиента
```

## 📁 Структура каталогов

- `client-confs/` - Конфигурационные файлы клиентов
- `VPNclients.log` - Файл журнала управления клиентами
- `.env` - Конфигурация окружения
- `docker-compose.yml` - Конфигурация Docker compose

## 💾 Хранение данных

По умолчанию данные OpenVPN хранятся в томах Docker по пути `/var/lib/docker/volumes/YOURSERVICENAME_ovpndata`.

Для хранения данных в пользовательском расположении:
1. Измените `docker-compose.yml`, чтобы использовать локальный путь:
   ```yaml
   volumes:
     - ./ovpn-data:/etc/openvpn
   ```
2. Установите правильные разрешения:
   ```bash
   sudo chown -R $USER: ./ovpn-data
   ```

## 🔒 Заметки по безопасности

- Все действия клиентов логируются в `VPNclients.log`
- Сертификаты клиентов могут быть отозваны в любое время
- Используются безопасные настройки OpenVPN по умолчанию
- Собирается из исходного кода для прозрачности

## 🤝 Участие в разработке

Мы приветствуем ваше участие! Не стесняйтесь отправлять Pull Request.

## 📝 Лицензия

Этот проект лицензирован под MIT License - подробности в файле [LICENSE](LICENSE).

## ⚠️ Отказ от ответственности

Эта конфигурация предоставляется "как есть". Всегда проверяйте настройки безопасности и конфигурации перед развертыванием в производственной среде.
