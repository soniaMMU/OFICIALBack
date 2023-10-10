using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;//extra para seguridad

namespace OFI
{
    public partial class AgregarUsu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //string usuario = txtNombre.Text.Substring(0, 1).ToUpper();//saca el primer caracter de lo que este en ese txtbox
            //string usuario = "U000002";

            try
            {
                //Membership.CreateUser(usuario, txtNombre, txtAp, txtAm, txtCI, txtcorreo, txtFechaNac, txtCelular, txtTelefono, txtPass, txtEstado);NO SIRVE
                SqlDataSourceUsuario.InsertParameters["cod_u"].DefaultValue = txtCod_usu.Text;
                SqlDataSourceUsuario.InsertParameters["cod_r"].DefaultValue = ddRol.SelectedValue;
                SqlDataSourceUsuario.InsertParameters["nameU"].DefaultValue = txtNombre.Text;
                SqlDataSourceUsuario.InsertParameters["lp_u"].DefaultValue = txtAp.Text;
                SqlDataSourceUsuario.InsertParameters["lm_u"].DefaultValue = txtAm.Text;
                SqlDataSourceUsuario.InsertParameters["ci_u"].DefaultValue = txtCI.Text;
                SqlDataSourceUsuario.InsertParameters["em_u"].DefaultValue = txtcorreo.Text;
                SqlDataSourceUsuario.InsertParameters["fn_u"].DefaultValue = txtFechaNac.Text;
                SqlDataSourceUsuario.InsertParameters["c1_u"].DefaultValue = txtCelular.Text;
                SqlDataSourceUsuario.InsertParameters["c2_u"].DefaultValue = txtTelefono.Text;
                SqlDataSourceUsuario.InsertParameters["pass_u"].DefaultValue = txtPass.Text;
                SqlDataSourceUsuario.InsertParameters["st_u"].DefaultValue = txtEstado.Text;
                SqlDataSourceUsuario.Insert();
                gdUsuarios.DataBind();//refresca el grid osea que se actualiza 
            }
            catch (Exception ex)//en caso de errores
            {

            }
        }
    }
}