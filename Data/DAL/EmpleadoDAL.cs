using Microsoft.Data.SqlClient;
using System.Data;
using WebNNSA.Models;

namespace WebNNSA.Data.DAL
{
    public class EmpleadoDAL
    {

        public readonly Context _context;
        //IDbConnection _Conn = Context.Conexion();
        public EmpleadoDAL(Context context)
        {
           _context= context;
        }
        

        public List<Empleado> ListarEmpleados()
        {

            using (SqlConnection con = new SqlConnection(_context.GetConnectionString()))
            {
                List<Empleado> lista_emlpleados = new List<Empleado>();

                using (SqlCommand cmd = new("sp_ListarEmpleados", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista_emlpleados.Add(new Empleado
                            {
                                Id = (int)reader["id"],
                                cedula = (int)reader["cedula"],
                                nombre = reader["nombre"].ToString(),
                                rutaFoto = reader["rutaFoto"].ToString(),
                                fechaIngreso = Convert.ToDateTime(reader["fechaIngreso"]),
                                cargoId = (int)reader["cargoId"],
                                cargo = reader["Cargo"].ToString()
                            });
                        }
                        con.Close();
                        return lista_emlpleados;
                    }
                }
            }
        }
        public void CrearEmpleado(Empleado empleado)
        {

            using (SqlConnection con = new SqlConnection(_context.GetConnectionString()))
            {
                List<Empleado> lista_emlpleados = new List<Empleado>();

                using (SqlCommand cmd = new("sp_CrearEmpleado", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@cedula", SqlDbType.Int).Value= empleado.cedula;
                    cmd.Parameters.Add("@cargoId", SqlDbType.Int).Value = empleado.cargoId;
                    cmd.Parameters.Add("@nombre", SqlDbType.NVarChar).Value = empleado.nombre;
                    cmd.Parameters.Add("@rutaFoto", SqlDbType.NVarChar).Value = empleado.rutaFoto;
                    cmd.Parameters.Add("@fechaIngreso", SqlDbType.DateTime).Value= empleado.fechaIngreso;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                    
                }
            }
        }
        public void ActualizarEmpleado(Empleado empleado)
        {

            using (SqlConnection con = new SqlConnection(_context.GetConnectionString()))
            {
                List<Empleado> lista_emlpleados = new List<Empleado>();

                using (SqlCommand cmd = new("sp_ActualizarEmpleado", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@idempleado", SqlDbType.Int).Value = empleado.Id;
                    cmd.Parameters.Add("@cedula", SqlDbType.Int).Value = empleado.cedula;
                    cmd.Parameters.Add("@cargoId", SqlDbType.Int).Value = empleado.cargoId;
                    cmd.Parameters.Add("@nombre", SqlDbType.NVarChar).Value = empleado.nombre;
                    cmd.Parameters.Add("@rutaFoto", SqlDbType.NVarChar).Value = empleado.rutaFoto;
                    cmd.Parameters.Add("@fechaIngreso", SqlDbType.DateTime).Value = empleado.fechaIngreso;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();

                }
            }
        }
        public void EliminarEmpleado(int? idempleado)
        {
            using (SqlConnection con = new SqlConnection(_context.GetConnectionString()))
            {
                List<Empleado> lista_emlpleados = new List<Empleado>();

                using (SqlCommand cmd = new("sp_EliminarEmpleado", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
                   
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();

                }
            }
        }
        public Empleado ConsultarEmpleado(int idempleado)
        {

            using (SqlConnection con = new SqlConnection(_context.GetConnectionString()))
            {
                Empleado empleado = new Empleado();

                using (SqlCommand cmd = new("sp_ConsultarEmpleadoConId", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = idempleado;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            empleado.Id = (int)reader["id"];
                            empleado.cedula = (int)reader["cedula"];
                            empleado.nombre = reader["nombre"].ToString();
                            empleado.rutaFoto = reader["rutaFoto"].ToString();
                            empleado.fechaIngreso = Convert.ToDateTime(reader["fechaIngreso"]);
                            empleado.cargoId = (int)reader["cargoId"];
                            empleado.cargo = reader["Cargo"].ToString();
                          
                        }
                        con.Close();
                        return empleado;
                    }
                }
            }
        }
    }
}