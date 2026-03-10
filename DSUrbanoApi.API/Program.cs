using Microsoft.EntityFrameworkCore;
using DSUrbanoApi.Infrastructure.Persistence;

var builder = WebApplication.CreateBuilder(args);

// 1. Configurar la conexión a PostgreSQL (Docker)
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseNpgsql(connectionString, b => 
        b.MigrationsAssembly("DSUrbanoApi.API"))); // Las migraciones se guardarán aquí

// 2. Agregar servicios básicos
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// 3. Configurar el pipeline de HTTP (Swagger)
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();