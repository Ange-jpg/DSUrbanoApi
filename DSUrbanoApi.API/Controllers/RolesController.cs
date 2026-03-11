using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DSUrbanoApi.Infrastructure.Persistence;
using DSUrbanoApi.Domain.Entities;

namespace DSUrbanoApi.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class RolesController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public RolesController(ApplicationDbContext context)
    {
        _context = context;
    }

    // GET: api/roles
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Rol>>> GetRoles()
    {
        return await _context.Roles.ToListAsync();
    }

    // POST: api/roles
    [HttpPost]
    public async Task<ActionResult<Rol>> PostRol(int id, string nombre)
    {
        var nuevoRol = new Rol { IdRol = id, NombreRol = nombre };
        
        _context.Roles.Add(nuevoRol);
        await _context.SaveChangesAsync();

        return Ok(nuevoRol);
    }
}