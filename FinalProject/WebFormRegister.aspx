

<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="WebFormRegister.aspx.cs" Inherits="FinalProject.WebFormRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 172px;
        }
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
<body><center>
    <form >
        <div>
            <h2>Register Now</h2>
            <table>
                <tr>
                    <td class="auto-style1"><font cssclass="text"  style="color:black;">Username: </font></td>
                    <td>&nbsp;<asp:TextBox ID="txtUsername" runat="server" Width="200px" MaxLength="50" CssClass="input"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1"><font cssclass="text"  style="color:black;">Password:</font></td>
                    <td>&nbsp;<asp:TextBox ID="txtPassword" runat="server" Width="200px" MaxLength="50" TextMode="Password" CssClass="input"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1"><font cssclass="text"  style="color:black;">No. Phone:</font></td>
                    <td>&nbsp;<asp:TextBox ID="txtPhone" runat="server" Width="200px" TextMode="Phone" CssClass="input"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1"><font cssclass="text"  style="color:black;">Address:</font></td>
                    <td>&nbsp;<asp:TextBox ID="txtAddress" runat="server" Width="200px" CssClass="input"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1"><font cssclass="text"  style="color:black;">Email:</font></td>
                    <td>&nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="200px" CssClass="input"></asp:TextBox></td>
                </tr>
            </table>
            <p><br />
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" Cssclass="reg"/>
            </p>
            <p>
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </p>
        </div>
        <div id="LoginDiv" runat="server" style="display: none;">
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
        </div><br /><br />
    </form></center>
</body>
</html>
    </asp:Content>