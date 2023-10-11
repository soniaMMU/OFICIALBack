<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Citas.aspx.cs" Inherits="OFI.Citas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Registro de citas</h1>
<table>
    <tr>
        <td>CODIGO DE CITA</td>
        <td style="width: 128px">
            <asp:TextBox ID="TxtCod_cita" runat="server" Width="132px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>CODIGO CLIENTE</td>
        <td style="width: 128px">
            <asp:TextBox ID="TxtCod_cliente" runat="server" Width="132px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>CODIGO DE USUARIO</td>
        <td style="width: 128px">
            <asp:TextBox ID="TxtCod_usu" runat="server" Width="132px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>ASUNTO</td>
        <td style="width: 128px">
            <asp:TextBox ID="TxtAsunto" runat="server" Width="132px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>FECHA</td>
        <td style="width: 128px">
            <asp:TextBox ID="TxtFecha" runat="server" Type="date" Width="132px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>HORA</td>
        <td style="width: 128px">
            <asp:TextBox ID="TxtHora" runat="server" Width="132px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 128px">
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
        </td>
    </tr>
    <tr>
        <td style="width: 128px">
            <asp:Button ID="BtnModificar" runat="server" Text="Modificar" OnClick="BtnModificar_Click"/>
        </td>
    </tr>
    <tr>
        <td style="width: 128px">
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click"/>
        </td>
    </tr>
</table>
    <asp:GridView ID="GVCitas" runat="server" AutoGenerateColumns="False" DataKeyNames="cod_a" DataSourceID="SqlDataSourceCitas">
        <Columns>
            <asp:BoundField DataField="cod_a" HeaderText="cod_a" ReadOnly="True" SortExpression="cod_a"/>
            <asp:BoundField DataField="cod_cl" HeaderText="cod_cl" SortExpression="cod_cl" />
            <asp:BoundField DataField="cod_u" HeaderText="cod_u" SortExpression="cod_u" />
            <asp:BoundField DataField="affair" HeaderText="affair" SortExpression="affair" />
            <asp:BoundField DataField="dt_a" HeaderText="dt_a" SortExpression="dt_a" />
            <asp:BoundField DataField="hr" HeaderText="hr" SortExpression="hr" />
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceCitas" runat="server" ConnectionString="<%$ ConnectionStrings:MecanicConn %>" InsertCommand="Sp_insert_appointment" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:MecanicConn.ProviderName %>" SelectCommand="SELECT * FROM appointment" UpdateCommand="Sp_modify_appointment" UpdateCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="cod_a" Type="String" />
        <asp:Parameter Name="cod_cl" Type="String" />
        <asp:Parameter Name="cod_u" Type="String" />
        <asp:Parameter Name="affair" Type="String" />
        <asp:Parameter DbType="Date" Name="dt_a" />
        <asp:Parameter DbType="Time" Name="hr" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="cod_a" Type="String" />
        <asp:Parameter Name="cod_cl" Type="String" />
        <asp:Parameter Name="cod_u" Type="String" />
        <asp:Parameter Name="affair" Type="String" />
        <asp:Parameter DbType="Date" Name="dt_a" />
        <asp:Parameter DbType="Time" Name="hr" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
    