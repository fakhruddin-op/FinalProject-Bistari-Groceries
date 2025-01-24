<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="FinalProject.UserControl.LoginStatus" %>

<asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="~/kawantry.aspx" CssClass="log1">Login</asp:HyperLink>
<asp:HyperLink ID="HyperLinkRegister" runat="server" NavigateUrl="~/WebFormRegister.aspx" CssClass="reg">Register</asp:HyperLink> &nbsp; &nbsp;
<style>
   .log {
    background-color: #c33838;;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.log:hover {
    background-color: #ffcece;
    color: black;
}   
   .log1 {
    background-color: #2b3a7e;
    color: white;
    padding: 5px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    border-radius:20px;
            display:inline-flex;

}

.log1:hover {
    background-color: #abd3fa;
    color: black;
}
  .reg {
    background-color: #B6A188;
    color: white;
    padding: 5px 15px;
    border: none;
    border-radius:20px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    display:inline-flex;
}

.reg:hover {
    background-color: #ede2d5;
    color: black;
}
</style>

<asp:Label ID="lblLoginStatus" runat="server"></asp:Label>
<asp:Label ID="lblStatus" runat="server"></asp:Label>
<asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click"  
style="display:inline-flex;margin-left:20%;" CssClass="log" />

