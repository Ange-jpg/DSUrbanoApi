using Microsoft.EntityFrameworkCore;
using DSUrbanoApi.Domain.Entities;

namespace DSUrbanoApi.Infrastructure.Persistence;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

    public DbSet<Propietario> Propietarios => Set<Propietario>();
    // Agregaremos las demás conforme las crees

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Propietario>(entity =>
        {
            entity.HasKey(e => e.IdPropietario);
            entity.ToTable("propietarios"); // Nombre exacto en tu Postgres
            
            // Si los nombres en la DB son diferentes a la clase, se mapean aquí:
            entity.Property(e => e.NombrePropietario).HasColumnName("propietario");
        });
    }
}