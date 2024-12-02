using System.ComponentModel.DataAnnotations.Schema;

namespace WebNNSA.Models
{
    public class Empleado
    {
        public int? Id { get; set; }
        public int? cedula { get; set; }
        public string? nombre { get; set; }
        public string? rutaFoto { get; set; }
        public DateTime? fechaIngreso { get; set; }
        public int? cargoId { get; set; }
        [NotMapped]
        public IFormFile? File { get; set; }
        public string? cargo { get; set; }
    }
}
