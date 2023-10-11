using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace OFI
{
    public partial class Citas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            /*try
            {
                SqlDataSourceCitas.InsertParameters["cod_a"].DefaultValue = TxtCod_cita.Text.ToUpper();
                SqlDataSourceCitas.InsertParameters["cod_cl"].DefaultValue = TxtCod_cliente.Text.ToUpper();
                SqlDataSourceCitas.InsertParameters["cod_u"].DefaultValue = TxtCod_usu.Text.ToUpper();
                SqlDataSourceCitas.InsertParameters["affair"].DefaultValue = TxtAsunto.Text;
                SqlDataSourceCitas.InsertParameters["dt_a"].DefaultValue = TxtFecha.Text;
                SqlDataSourceCitas.InsertParameters["hr"].DefaultValue = TxtHora.Text;           
                SqlDataSourceCitas.Insert();
                Response.Write("<script>window.alert('Persona ingresada correctamente')</script>");
            }
            catch (Exception)
            { Response.Write("<script>window.alert('Persona no fue ingresada correctamente')</script>"); }*/
            string Cod_Cita = TxtCod_cita.Text;
            string Cod_cli = TxtCod_cliente.Text;
            string Cod_usu = TxtCod_usu.Text;
            string Asunto = TxtAsunto.Text;
            string Fecha = TxtFecha.Text;
            string Hora = TxtHora.Text;
            string connect = "Data Source=DESKTOP-FOVTLEQ;Initial Catalog=mecanic;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connect))
            {
                con.Open();
                string query = "INSERT INTO appointment VALUES ('" + Cod_Cita + "', '" + Cod_cli + "', '" + Cod_usu + "', '" + Asunto + "', '" + Fecha + "', '" + Hora + "')";
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.Add("@cod_a", SqlDbType.VarChar).Value = Cod_Cita;
                    command.Parameters.Add("@cod_cl", SqlDbType.VarChar).Value = Cod_cli;
                    command.Parameters.Add("@cod_u", SqlDbType.VarChar).Value = Cod_usu;
                    command.Parameters.Add("@affair", SqlDbType.VarChar).Value = Asunto;
                    command.Parameters.Add("@dt_a", SqlDbType.Date).Value = Fecha;
                    command.Parameters.Add("@hr", SqlDbType.Time).Value = Hora;
                    
                    command.ExecuteNonQuery();

                    // Comprueba si se realizaron cambios en la base de datos.
                    
                    Response.Write("<script>window.alert('Registro insertado correctamente.')</script>");
                    GVCitas.DataBind();
                    /*
                    else
                    {
                        Response.Write("<script>window.alert('No se pudo registrar la cita.')</script>");
                    }*/
                }
            }
        }
        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            /*try
            {
                if (["cod_a"] = TxtCod_cita)
                {
                    SqlDataSourceCitas.UpdateParameters["affair"].DefaultValue = TxtAsunto.Text;
                    SqlDataSourceCitas.UpdateParameters["dt_a"].DefaultValue = TxtFecha.Text;
                    SqlDataSourceCitas.UpdateParameters["hr"].DefaultValue = TxtHora.Text;
                    SqlDataSourceCitas.Update();
                }
                else
                {
                    Response.Write("<script>window.alert('No se pudo actualizar la cita')</script>");
                }
                
            }
            catch (Exception)
            { Response.Write("<script>window.alert('Error al actualizar')</script>"); }*/
            string Cod_Cita = TxtCod_cita.Text;
            string Cod_cli = TxtCod_cliente.Text;
            string Cod_usu = TxtCod_usu.Text;
            string Asunto = TxtAsunto.Text;
            string Fecha = TxtFecha.Text;
            string Hora = TxtHora.Text;
            string connect = "Data Source=DESKTOP-FOVTLEQ;Initial Catalog=mecanic;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connect))
            {
                con.Open();
                string query = "UPDATE appointment SET affair = @affair, dt_a = @dt_a, hr = @hr WHERE cod_a = @cod_a AND cod_cl = @cod_cl;";
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.Add("@affair", SqlDbType.VarChar).Value = Asunto;
                    command.Parameters.Add("@dt_a", SqlDbType.Date).Value = Fecha;
                    command.Parameters.Add("@hr", SqlDbType.Time).Value = Hora;
                    command.Parameters.Add("@cod_a", SqlDbType.VarChar).Value = Cod_Cita;
                    command.Parameters.Add("@cod_cl", SqlDbType.VarChar).Value = Cod_cli;

                    int rowsAffected = command.ExecuteNonQuery();

                    // Comprueba si se realizaron cambios en la base de datos.
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>window.alert('Registro modificado correctamente.')</script>");
                        GVCitas.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>window.alert('No se encontraron registros que coincidan con la condición.')</script>");
                    }
                }
            }
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            string Cod_Cita = TxtCod_cita.Text;
            string Cod_cli = TxtCod_cliente.Text;
            string connect = "Data Source=DESKTOP-FOVTLEQ;Initial Catalog=mecanic;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connect))
            {
                con.Open();
                string query = "DELETE appointment WHERE cod_a = @cod_a AND cod_cl = @cod_cl;";
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.Add("@cod_a", SqlDbType.VarChar).Value = Cod_Cita;
                    command.Parameters.Add("@cod_cl", SqlDbType.VarChar).Value = Cod_cli;

                    int rowsAffected = command.ExecuteNonQuery();
                    
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>window.alert('Registro eliminado correctamente.')</script>");
                        GVCitas.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>window.alert('No se encontraron registros que coincidan con la condición.')</script>");
                    }
                }
            }

        }
    }
    
}