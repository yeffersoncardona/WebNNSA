using Microsoft.Data.SqlClient;
using WebNNSA.Models;

namespace WebNNSA.Data.DAL
{
    public class CargoDAL
    {
        public readonly Context _context;
        public CargoDAL(Context context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }
      

        public List<Cargo> ListarCargos()
        {
            using (SqlConnection con = new SqlConnection(_context.GetConnectionString()))
            {
                List<Cargo> lista_Cargos = new List<Cargo>();

                using (SqlCommand cmd = new("sp_listarCargos", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista_Cargos.Add(new Cargo
                            {
                                Id = (int)reader["id"],
                                Nombre = reader["nombre"].ToString(),
                                
                            });
                        }
                        con.Close();
                        return lista_Cargos;
                    }
                }
            }
        }

    }
}
