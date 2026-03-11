using Microsoft.EntityFrameworkCore;
using DSUrbanoApi.Domain.Entities;

namespace DSUrbanoApi.Infrastructure.Persistence;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

    // Representa la tabla en la base de datos
    public DbSet<Rol> Roles => Set<Rol>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Aquí le decimos a EF Core cómo se llaman exactamente las columnas en Postgres
        modelBuilder.Entity<Rol>(entity =>
        {
            entity.ToTable("rol"); // Nombre de la tabla en SQL
            entity.HasKey(e => e.IdRol); // Llave primaria
            
            // Mapeo de columnas (C# -> PostgreSQL)
            entity.Property(e => e.IdRol).HasColumnName("id_rol");
            entity.Property(e => e.NombreRol).HasColumnName("rol");
        });
    }
}