using Microsoft.EntityFrameworkCore;
using DSUrbanoApi.Infrastructure.Persistence;

var builder = WebApplication.CreateBuilder(args);

// 1. Leer la cadena de conexión
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// 2. Registrar el DbContext
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseNpgsql(connectionString));

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();
app.MapControllers();

app.Run();