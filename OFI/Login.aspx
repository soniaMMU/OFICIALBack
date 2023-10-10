<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OFI.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Login ID="LoginPrueba" runat="server" Height="251px" OnAuthenticate="Login1_Authenticate" Width="450px">
    </asp:Login>
</asp:Content>
