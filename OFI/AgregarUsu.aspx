<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarUsu.aspx.cs" Inherits="OFI.AgregarUsu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center text-bg-secondary">REGISTRO DE USUARIOS EN EL TALLER</h1>
    <table>
        <tr>
            <td>Codigo de Usuario</td>
            <td>
                <asp:TextBox ID="txtCod_usu" runat="server" Width="353px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Rol</td>
            <td>
                <asp:DropDownList ID="ddRol" runat="server" DataSourceID="SqlDataSourceRoles" DataTextField="Expr1" DataValueField="Expr1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:finalMec001Con %>" SelectCommand="SELECT cod_r + '-' + type_r AS Expr1 FROM rol_user"></asp:SqlDataSource>
            </td>
        </tr>
                <tr>
            <td>Nombre</td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" Width="358px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Apellido Paterno</td>
            <td>
                <asp:TextBox ID="txtAp" runat="server" Width="360px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Apellido Materno</td>
            <td>
                <asp:TextBox ID="txtAm" runat="server" Width="357px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td style="height: 25px">CI</td>
            <td style="height: 25px">
                <asp:TextBox ID="txtCI" runat="server" Width="355px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Correo</td>
            <td>
                <asp:TextBox ID="txtcorreo" runat="server" Width="355px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Fecha de Nacimiento</td>
            <td>
                <asp:TextBox ID="txtFechaNac" runat="server" Width="357px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Celular</td>
            <td>
                <asp:TextBox ID="txtCelular" runat="server" Width="362px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Teléfono</td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server" Width="360px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Contraseña</td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" Width="362px"></asp:TextBox>
                    </td>
        </tr>
                <tr>
            <td>Estado</td>
            <td>
                <asp:TextBox ID="txtEstado" runat="server" Width="364px"></asp:TextBox>
                    </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="371px" OnClick="btnGuardar_Click" />

            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </table>
    
    <asp:GridView ID="gdUsuarios" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Expr1,cod_u" DataSourceID="SqlDataSourceUsuario" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TR" HeaderText="TR" SortExpression="TR" Visible="False" />
            <asp:BoundField DataField="desc_r" HeaderText="desc_r" SortExpression="desc_r" />
            <asp:BoundField DataField="nameU" HeaderText="nameU" SortExpression="nameU" />
            <asp:BoundField DataField="lp_u" HeaderText="lp_u" SortExpression="lp_u" />
            <asp:BoundField DataField="lm_u" HeaderText="lm_u" SortExpression="lm_u" />
            <asp:BoundField DataField="ci_u" HeaderText="ci_u" SortExpression="ci_u" />
            <asp:BoundField DataField="em_u" HeaderText="em_u" SortExpression="em_u" />
            <asp:BoundField DataField="fn_u" HeaderText="fn_u" SortExpression="fn_u" />
            <asp:BoundField DataField="c1_u" HeaderText="c1_u" SortExpression="c1_u" />
            <asp:BoundField DataField="c2_u" HeaderText="c2_u" SortExpression="c2_u" />
            <asp:BoundField DataField="pass_u" HeaderText="pass_u" SortExpression="pass_u" />
            <asp:BoundField DataField="st_u" HeaderText="st_u" SortExpression="st_u" />
            <asp:BoundField DataField="cod_r" HeaderText="cod_r" SortExpression="cod_r" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="cod_u" HeaderText="cod_u" ReadOnly="True" SortExpression="cod_u" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:finalMec001Con %>" InsertCommand="sp_InsertarUsuario" InsertCommandType="StoredProcedure" SelectCommand="SELECT rol_user.type_r AS TR, rol_user.desc_r, users.nameU, users.lp_u, users.lm_u, users.ci_u, users.em_u, users.fn_u, users.c1_u, users.c2_u, users.pass_u, users.st_u, users.cod_r, rol_user.cod_r AS Expr1, users.cod_u FROM users INNER JOIN rol_user ON users.cod_r = rol_user.cod_r">
        <InsertParameters>
            <asp:Parameter Name="cod_u" Type="String" />
            <asp:Parameter Name="cod_r" Type="String" />
            <asp:Parameter Name="nameU" Type="String" />
            <asp:Parameter Name="lp_u" Type="String" />
            <asp:Parameter Name="lm_u" Type="String" />
            <asp:Parameter Name="ci_u" Type="Int32" />
            <asp:Parameter Name="em_u" Type="String" />
            <asp:Parameter DbType="Date" Name="fn_u" />
            <asp:Parameter Name="c1_u" Type="Int32" />
            <asp:Parameter Name="c2_u" Type="Int32" />
            <asp:Parameter Name="pass_u" Type="String" />
            <asp:Parameter Name="st_u" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
