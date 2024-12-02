using Microsoft.Data.SqlClient;
using System.Data;

namespace WebNNSA.Data
{
    public class Context
    {

        private readonly string _connectionString;

        public Context(IConfiguration configuration)
        {
            // Obtener la cadena de conexión desde appsettings.json
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public string GetConnectionString()
        {
            return _connectionString;
        }
    }
}
