

<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="kawantry.aspx.cs" Inherits="FinalProject.kawantry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    
    <form>
        <div>
            <h1>Welcome to Bistari Groceries!</h1>
            <br />
            <p>Login&nbsp;</p>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <p>Password</p>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login"  /> &nbsp;
            <asp:Button ID="btnRegister" runat="server" Text="Register" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        </div>
    </form>
</asp:Content>

