# API Desarrollo Urbano (DSUrbanoApi) 🏙️

API RESTful desarrollada en .NET para la gestión y control de procesos de Desarrollo Urbano, incluyendo administración de propietarios, topografías, cálculos de costos y generación de observaciones.

## 🚀 Tecnologías

* **Framework:** .NET 8 / C#
* **Base de Datos:** PostgreSQL
* **ORM:** Entity Framework Core
* **Contenedores:** Docker & Docker Compose
* **Documentación:** Swagger / OpenAPI

## 🏗️ Arquitectura

El proyecto sigue los principios de **Clean Architecture** (Arquitectura Limpia) para asegurar un código escalable, mantenible y testeable. Está dividido en 4 capas principales:

1. **Domain:** Entidades de núcleo y abstracciones.
2. **Application:** Casos de uso, interfaces de servicios y DTOs.
3. **Infrastructure:** Implementación de persistencia (ApplicationDbContext), repositorios y conexión a PostgreSQL.
4. **API:** Controladores REST, configuración de inyección de dependencias y middlewares.

## 🛠️ Requisitos Previos

* [.NET 8 SDK](https://dotnet.microsoft.com/download)
* [Docker Desktop](https://www.docker.com/products/docker-desktop)
* IDE recomendado: Visual Studio Code o Visual Studio 2022

## 📦 Configuración y Ejecución

### 1. Levantar la Base de Datos
El proyecto incluye un archivo `docker-compose.yml` preconfigurado con PostgreSQL y un script de inicialización (`init.sql`) que genera la estructura de la base de datos automáticamente.

Ejecuta en la raíz del proyecto:
docker-compose up -d

2. Configurar la Conexión
Verifica que el archivo appsettings.json en DSUrbanoApi.API tenga las credenciales correctas:

"ConnectionStrings": {
  "DefaultConnection": "Host=localhost;Port=5432;Database=db_desarrollo_urbano;Username=TuUsuario;Password=TuContraseña"
}

3. Ejecutar la API
Navega a la carpeta de la API y ejecuta el proyecto:
cd DSUrbanoApi.API
dotnet run

4. Explorar los Endpoints
Una vez en ejecución, abre tu navegador y visita la interfaz de Swagger para probar los endpoints:

https://localhost:<puerto>/swagger o http://localhost:<puerto>/swagger

