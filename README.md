# User Registration API

ASP.NET Core Web API for user registration and authentication using JWT and PostgreSQL.

## Project Structure

```text
user_registration/
├── Controllers/
│   ├── AuthController.cs
│   └── UserController.cs
├── Data/
├── Dtos/
├── Migrations/
├── Models/
├── Services/
│   ├── IUserService.cs
│   └── UserService.cs
├── appsettings.json
├── compose.yaml
├── Dockerfile
└── Program.cs
```

## Prerequisites

- .NET SDK 8.0 or later
- Docker Desktop
- PostgreSQL (only for local run without Docker)

## Run with Docker

This project includes:
- **backend**: ASP.NET Core API
- **postgres**: PostgreSQL database

Start everything with:

```bash
docker compose up --build
```

API will be available at:

```text
http://localhost:8080
```

Swagger will be available at:

```text
http://localhost:8080/swagger
```

Stop containers with:

```bash
docker compose down
```

## Run Locally

### 1. Update connection string
Make sure your `appsettings.json` has a valid PostgreSQL connection string.

Example:

```json
"ConnectionStrings": {
  "DefaultConnection": "Host=localhost;Port=5432;Database=userdb;Username=postgres;Password=postgres"
}
```

### 2. Restore packages

```bash
dotnet restore
```

### 3. Run migrations

```bash
dotnet ef database update
```

### 4. Start the API

```bash
dotnet run
```

Default local API URL:

```text
http://localhost:8080
```

## Authentication

The API uses **JWT Bearer authentication** configured in `Program.cs`.

Make sure `appsettings.json` contains:

```json
"JwtSettings": {
  "SecretKey": "MySecretTafadzwaMutero!",
  "Issuer": "your-issuer",
  "Audience": "your-audience"
}
```

## CORS

CORS is enabled for the Angular frontend:

```text
http://localhost:4200
```

## Notes

- Database migrations are applied automatically on startup in development.
- Swagger is enabled in development.
- PostgreSQL runs on port `5432`.
- Backend API runs on port `8080`.
