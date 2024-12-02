using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Reflection;
using WebNNSA.Data;
using WebNNSA.Data.DAL;
using WebNNSA.Models;
using static System.Net.Mime.MediaTypeNames;

namespace WebNNSA.Controllers
{
    public class EmpleadoController : Controller
    {

        private EmpleadoDAL _empleadoDAl;
        private CargoDAL _cargoDAl;
        public EmpleadoController(Context _context)
        {
            _empleadoDAl = new EmpleadoDAL(_context);
            _cargoDAl = new CargoDAL(_context);
        }

        // GET: EmpleadoController
        public ActionResult Index()
        {
            try
            {
                List<Empleado> listaEmpleados = new List<Empleado>();

                listaEmpleados = _empleadoDAl.ListarEmpleados();

                ViewBag.listado = listaEmpleados;

                return View();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IActionResult Crear()
        {
            List<Cargo> cargoslis = _cargoDAl.ListarCargos();
            List<SelectListItem> items = cargoslis.ConvertAll(d =>
                    {
                        return new SelectListItem()
                        {
                            Text = d.Nombre,
                            Value = d.Id.ToString(),
                            Selected = false

                        };

                    });
            // Agregar el valor por defecto al inicio de la lista
            items.Insert(0, new SelectListItem()
            {
                Text = "Selecciona el cargo",
                Value = "0",
                Selected = true
            });
            ViewBag.items = items;
            return View();
        }
        [HttpPost]
        public IActionResult Crear(Empleado empleado)
        {
            try
            {


                if (empleado.File != null && empleado.nombre != null)
                {
                    string imageDirectory = @"\Images\"; 
                    // Ruta donde se guardarán las imágenes
                    string originalFileName = empleado.File.FileName; // Nombre original del archivo // Generar un nombre único utilizando Guid
                    string fileExtension = Path.GetExtension(empleado.File.FileName).ToLower();
                    // Lista de extensiones permitidas
                    string[] allowedExtensions = { ".jpg" };
                    if (Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(originalFileName);
                        
                        ////
                        string uploadsFolder3 = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Images");
                       
                        
                        
                        // Combinar la ruta con el nombre único del archivo
                        string uniqueFilePath = Path.Combine(uploadsFolder3, uniqueFileName); // Simulación de guardar el archivo (aquí deberías poner el código real para guardar la imagen) Console.WriteLine($"Imagen guardada como: {uniqueFilePath}"); // Ejemplo de cómo copiar la imagen original con el nuevo nombre
                                                                                              //string originalFilePath = Path.Combine(, originalFileName);
                        empleado.rutaFoto = "\\Images\\"+ uniqueFileName;
                        // empleado.cargoId= model. 
                        _empleadoDAl.CrearEmpleado(empleado);

                        // Crear la carpeta si no existe
                        if (!Directory.Exists(uploadsFolder3))
                        {
                            Directory.CreateDirectory(uploadsFolder3);
                            // File.Copy(originalFilePath, uniqueFilePath);

                        }


                        // Guardar el archivo en la ruta especificada
                        using (var fileStream = new FileStream(uniqueFilePath, FileMode.Create))
                        {
                            empleado.File.CopyTo(fileStream);
                        }
                    }
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.error = ex.Message;
                return View();
            }
        }
        public IActionResult Editar(int id)
        {
            Empleado objempleado = new Empleado();
            objempleado=_empleadoDAl.ConsultarEmpleado(id);

            List<Cargo> cargoslis = _cargoDAl.ListarCargos();
            List<SelectListItem> items = cargoslis.ConvertAll(d =>
            {
                return new SelectListItem()
                {
                    Text = d.Nombre,
                    Value = objempleado.cargoId.ToString(),
                    Selected = false

                };

            });
            // Agregar el valor por defecto al inicio de la lista
            items.Insert(0, new SelectListItem()
            {
                Text = "Selecciona el cargo",
                Value = "0",
                Selected = true
            });
            ViewBag.items = items;
            

            return View(objempleado);
            
        }
        [HttpPost]
        public IActionResult Editar(Empleado empleado)
        {
            try
            {
                _empleadoDAl.ActualizarEmpleado(empleado);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.error = ex.Message;
                return View();
            }

        }
        public IActionResult Eliminar(int id)
        {
            Empleado objempleado = new Empleado();
            objempleado = _empleadoDAl.ConsultarEmpleado(id);

            List<Cargo> cargoslis = _cargoDAl.ListarCargos();
            List<SelectListItem> items = cargoslis.ConvertAll(d =>
            {
                return new SelectListItem()
                {
                    Text = d.Nombre,
                    Value = objempleado.cargoId.ToString(),
                    Selected = false

                };

            });
            // Agregar el valor por defecto al inicio de la lista
            items.Insert(0, new SelectListItem()
            {
                Text = "Selecciona el cargo",
                Value = "0",
                Selected = true
            });
            ViewBag.items = items;


            return View(objempleado);
        }
        [HttpPost]
        public IActionResult Eliminar(Empleado empleado)
        {
            try
            {
                _empleadoDAl.EliminarEmpleado(empleado.Id);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                ViewBag.error = ex.Message;
                return View();
            }
        }

    }
}
