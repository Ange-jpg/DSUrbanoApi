namespace DSUrbanoApi.Domain.Entities;

public class Propietario
{
    public int IdPropietario { get; set; }
    public string Folio { get; set; } = string.Empty;
    public DateTime FechaFolio { get; set; }
    public string NombrePropietario { get; set; } = string.Empty;
    public string Vialidad { get; set; } = string.Empty;
    public string Colonia { get; set; } = string.Empty;
    public int? Congregacion { get; set; }
    public int? Region { get; set; }
    public int? Manzana { get; set; }
    public int? Lote { get; set; }
    public int? Nivel { get; set; }
    public int? Departamento { get; set; }
    public int? Inscripcion { get; set; }
    public string Seccion { get; set; } = string.Empty;
    public DateTime FechaEscritura { get; set; }
    public string EstatusArea { get; set; } = string.Empty;


    public ICollection<Observacion> Observaciones { get; set; } = new List<Observacion>();
}