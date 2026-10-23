# Security-Hardened PHP-FPM Docker Images


[![Docker Pulls](https://img.shields.io/docker/pulls/haraldsilva/php.svg)](https://hub.docker.com/r/haraldsilva/php)
[![GitHub Registry](https://img.shields.io/badge/registry-ghcr.io-blue)](https://github.com/HaraldSilva?tab=packages)

This repository provides production-ready, pre-configured PHP-FPM images based on the **[ServerSideUp](https://serversideup.net/open-source/docker-php/)** distribution. They are published simultaneously to **Docker Hub** and **GitHub Container Registry (GHCR)**.

---

## 🌟 Upstream Base: The Advantages of ServerSideUp

Instead of generic base images, these builds rely on `serversideup/php`:
* **Secure by Default:** Hardened baseline configuration (OPcache enabled, information disclosure disabled, zero root runtime privilege).
* **Predictable Environment Configuration:** Full support for runtime environment variables (`PHP_MEMORY_LIMIT`, `PHP_POST_MAX_SIZE`, `PHP_OPCACHE_ENABLE`, etc.) without mounting custom `php.ini` files.
* **Rapid Security Release Cycle:** Automated upstream builds following official PHP Foundation security releases.

---

## 🧩 Included Extensions & Application Compatibility

Our images augment the base installation with additional modules designed to support virtually all major content management systems and web applications out of the box (including **WordPress**, **Grav CMS**, **Matomo Analytics**, **Nextcloud**, and custom Laravel/Symfony deployments):

| Category | Modules |
| :--- | :--- |
| **Pre-compiled in our Image** | `gd`, `intl`, `yaml`, `mysqli`, `exif`, `apcu`, `bcmath`, `maxminddb` |
| **Inherited from Base Image** | `opcache`, `pdo_mysql`, `pdo_pgsql`, `redis`, `zip`, `pcntl`, `curl`, `mbstring`, `xml` |

---

## 👤 User & Permission Mapping (UID 1000)

The internal user and group `www-data` are explicitly configured to **`UID 1000` / `GID 1000`** directly at image build time. This avoids permission conflicts and eliminates manual `chown` requirements on typical Linux host systems.

---

## 🔄 Automated Update Schedule

* **Interval:** Every **6 hours** (`00:00`, `06:00`, `12:00`, `18:00` UTC).
* **Smart Digest Check:** The pipeline verifies the remote SHA256 manifest digest on Docker Hub before initiating any build task.
* **Rebuild Trigger:** Compilation is executed only when the official upstream base image has been patched or changes are pushed to this repository.

---

## 📦 Pulling the Images

### Available Versions
* `8.5-fpm`
* `8.4-fpm`
* `8.3-fpm`
* `8.2-fpm`

### From Docker Hub
```bash
docker pull haraldsilva/php:8.4-fpm
```

### From GitHub Container Registry (GHCR)
```bash
docker pull ghcr.io/haraldsilva/php:8.4-fpm
```

---

## 🚀 Docker Compose Example

```yaml
services:
  php:
    image: haraldsilva/php:8.4-fpm
    restart: unless-stopped
    volumes:
      - /var/www/html:/var/www/html
    environment:
      - TZ=Europe/Vienna
      - PHP_DATE_TIMEZONE=Europe/Vienna
      - PHP_MEMORY_LIMIT=256M
      - PHP_UPLOAD_MAX_FILE_SIZE=20M
      - PHP_POST_MAX_SIZE=20M
      - PHP_OPCACHE_ENABLE=1
```

---

## 🔗 Registry Links
* **Docker Hub:** [https://hub.docker.com/r/haraldsilva/php](https://hub.docker.com/r/haraldsilva/php)
* **GitHub Container Registry:** [https://github.com/HaraldSilva/php/pkgs/container/php](https://github.com/HaraldSilva/php/pkgs/container/php)
