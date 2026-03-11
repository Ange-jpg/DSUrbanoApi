using System.ComponentModel.DataAnnotations.Schema;

namespace DSUrbanoApi.Domain.Entities;

public class Rol
{
    [DatabaseGenerated(DatabaseGeneratedOption.None)]
    public int IdRol { get; set; }
    
    public string NombreRol { get; set; } = string.Empty; 
}