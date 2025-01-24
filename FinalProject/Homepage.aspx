<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="FinalProject.kawantry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <style>
        .input{
            background:#f5f5f5;
            padding:10px 25px;
            border-radius:20px;
        }
       .log {
        background-color: #2b3a7e;
        color: white;
        padding: 10px 35px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        border-radius:20px;
                display:inline-flex;

    }

    .log:hover {
        background-color: #abd3fa;
        color: black;
    }
       .reset {
        background-color: #2b3a7e;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    .reset:hover {
        background-color: #abd3fa;
        color: black;
    }
      .reg {
        background-color: #B6A188;
        color: white;
        padding: 10px 25px;
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
       h2 {
        position: relative;
        display: inline-block;
        font-size: 24px; /* Adjust the font size */
        color: #2b3a7e; /* Title color */
        margin-top: 20px; /* Adjust the top margin */
        margin-bottom: 20px; /* Adjust the bottom margin */
    }

    h2::after {
        content: '';
        position: absolute;
        width: 50%; /* Adjust the width of the underline */
        height: 2px; /* Adjust the thickness of the underline */
        background-color: #2b3a7e; /* Underline color */
        bottom: 0;
        left: 0%; /* Center the underline */
        top:130%;    
        transition: width 0.3s; /* Add a transition effect on hover */
        padding:2px;
        border-radius:15px;
    }
    .text{
        color:black !important;
    }
   

    </style>
    <center>
    <form>
        <div>
            <h2>Welcome to Bistari Groceries </h2>
            <br /><br />
            <p><font cssclass="text"  style="color:black;">Login</font></p>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input"></asp:TextBox><br />
            <p><font cssclass="text" style="color:black;">Password</font></p>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Cssclass="log" />

            <asp:Button runat="server" Text="Register" Cssclass="reg"  OnClick="btnRegister_Click"  /><br />
         <br />   <asp:Label ID="lblStatus" runat="server" Text="" style="color:red;"></asp:Label>
        </div>
    </form>
</asp:Content>

