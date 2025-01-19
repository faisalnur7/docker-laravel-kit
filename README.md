# Docker Laravel Kit

**Docker Laravel Kit** is a complete Docker setup for Laravel development, featuring essential services like PHP, MySQL, Redis, Nginx, and more. This repository allows developers to easily set up a consistent, portable development environment for Laravel projects.

## Features
- PHP 8.3 (FPM-Alpine)
- MySQL database
- Redis for caching
- Nginx as a web server
- PhpMyAdmin for database management
- Composer for dependency management
- Node.js (with npm) for frontend assets
- Mailpit for email testing

---

## Getting Started

### Prerequisites
Ensure you have the following installed:
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Clone the Repository
```bash
git clone https://github.com/yourusername/docker-laravel-kit.git
cd docker-laravel-kit
```

### Set Up Your Laravel Project
1. Place your Laravel project files inside the `src/` directory.
   - If starting a new Laravel project, initialize it by running:
     ```bash
     docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
     ```
2. Update your `.env` file with the following database configuration:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=mysql
   DB_PORT=3306
   DB_DATABASE=laravel
   DB_USERNAME=laravel
   DB_PASSWORD=password
   ```

### Build and Start the Containers
```bash
docker-compose up -d
```

### Access the Application
- **Laravel App**: [http://localhost](http://localhost)
- **PhpMyAdmin**: [http://localhost:8080](http://localhost:8080) (Username: `laravel`, Password: `password`)
- **Mailpit**: [http://localhost:8025](http://localhost:8025)

---

## Containers

### List of Containers
- `laravel_nginx`: Nginx web server
- `laravel_php`: PHP FPM container
- `laravel_mysql`: MySQL database
- `laravel_redis`: Redis caching
- `laravel_composer`: Composer dependency manager
- `laravel_npm`: Node.js (for npm commands)
- `laravel_mailpit`: Email testing

### Running Artisan Commands
Run Laravel Artisan commands:
```bash
docker-compose run --rm artisan migrate
```

### Running npm Commands
Run npm commands:
```bash
docker-compose run --rm npm install
```

---

## Stopping the Containers
To stop the running containers:
```bash
docker-compose down
```

---

## Troubleshooting
1. **Database connection errors**:
   - Ensure the `DB_HOST` in your `.env` file is set to `mysql`.
2. **Permission issues**:
   - Ensure the `src/` directory has the correct permissions:
     ```bash
     sudo chmod -R 777 src/
     ```

---

## License
This repository is open-source and available under the [MIT License](LICENSE).

---

## Contributing
Contributions are welcome! Feel free to submit a pull request or open an issue to suggest improvements.
