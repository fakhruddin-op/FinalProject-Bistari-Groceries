<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAdmin.aspx.cs" Inherits="FinalProject.WebFormAdmin" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
</head>
    <style>

            body{
                color:black;
                input:inline-flex;
  font-family: "Poppins", sans-serif;
                text-decoration:none;
            }
            table,tr,td,th{
                text-align:center;
                        font-family: 'Poppins', sans-serif;
                        color:black;
                        text-decoration:none;
            }
            th,td{
                padding:0 10px;
            }
            td{
                padding:5px;
            }
            th{
                background:#2b3a7e;
                color:white;
                        font-family: 'Poppins', sans-serif;
                        font-weight:200;
                        padding:10px;
            }
.cart{         background-color: #abd3fa;
        color: black;
        padding: 10px 25px;
        
        border: none;
        border-radius: 25px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        display:inline-flex;
    }

  .cart2 {
    background-color: #B6A188;
    color: white;
    padding: 10px 25px;
    border: none;
    border-radius:20px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    display:inline-flex;
}

.cart2:hover {
    background-color: #ede2d5;
    color: black;
}
   .item-details {
        background-color: #abd3fa;
        padding: 10px 10px; /* Adjust padding as needed */
        color: black;
        border-radius: 35px;
        width:30%;
        margin-top:20px;
    }
        .reset {
    background-color: #c33838;;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    display:inline-flex;
}

.reset:hover {
    background-color: #ffcece;
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
     top:100%;    
     transition: width 0.3s; /* Add a transition effect on hover */
     padding:2px;
     border-radius:15px;
 }
 .text{
     color:black !important;
 }

.log {
    background-color: #c33838;;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    display:inline-flex;
    margin-left:25%;
    margin-top:-5%; /*ubah ketinggian butang LOGOUT*/
    position:absolute;
}

.log:hover {
    background-color: #ffcece;
    color: black;
}
    </style>
<body><Center>

    <form id="form1" runat="server">

        <div>
            <h1>
                Dashboard Admin</h1>        <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" style="inline-flex;margin-left:20%;" CssClass="log" /> 

        </div>
                    <h2>Data User</h2> 


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" EditImageUrl="cart" >
                <ControlStyle CssClass="cart" Font-Underline="False" />
                <ItemStyle Wrap="True" />
                </asp:CommandField>
                <asp:BoundField DataField="userID" HeaderText="ID" ReadOnly="True" SortExpression="userID" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="noPhone" HeaderText="Phone" SortExpression="noPhone" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
                <asp:CheckBoxField DataField="enabled" HeaderText="Enabled" SortExpression="enabled" />
            </Columns>
        </asp:GridView><br /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" DeleteCommand="DELETE FROM [Users] WHERE [userID] = @userID" InsertCommand="INSERT INTO [Users] ([userID], [username], [password], [role], [enabled], [noPhone], [address], [email]) VALUES (@userID, @username, @password, @role, @enabled, @noPhone, @address, @email)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username, [password] = @password, [role] = @role, [enabled] = @enabled, [noPhone] = @noPhone, [address] = @address, [email] = @email WHERE [userID] = @userID">
            <DeleteParameters>
                <asp:Parameter Name="userID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userID" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="enabled" Type="Boolean" />
                <asp:Parameter Name="noPhone" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="enabled" Type="Boolean" />
                <asp:Parameter Name="noPhone" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="userID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                            <h2>Data Report</h2>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="reportID" HeaderText="reportID" SortExpression="reportID" />
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="CategoriesName" HeaderText="CategoriesName" SortExpression="CategoriesName" />
                <asp:BoundField DataField="itemID" HeaderText="itemID" SortExpression="itemID" />
                <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="itemPrice" DataFormatString="{0:c2}" HeaderText="itemPrice" SortExpression="itemPrice" />
                <asp:BoundField DataField="totalPayment" DataFormatString="{0:c2}" HeaderText="totalPayment" SortExpression="totalPayment" />
                <asp:BoundField DataField="Stocks" HeaderText="Stocks" SortExpression="Stocks" />
                <asp:CheckBoxField DataField="Confirmed" HeaderText="Confirmed" SortExpression="Confirmed" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" SelectCommand="SELECT Report.*, Items.*, Categories.CategoriesName, Users.username
FROM Report
INNER JOIN Items ON Report.itemID = Items.itemID
INNER JOIN Categories ON Items.CategoriesID = Categories.CategoriesID
INNER JOIN Users ON Report.userID = Users.userID;
"></asp:SqlDataSource>
                            <h2>Data Items</h2>

        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="itemID" HeaderText="Item ID" ReadOnly="True" SortExpression="itemID" />
                <asp:BoundField DataField="CategoriesID" HeaderText="Categories ID" SortExpression="CategoriesID" />
                <asp:BoundField DataField="itemName" HeaderText="Item " SortExpression="itemName" />
                <asp:BoundField DataField="itemPrice" DataFormatString="{0:C2}" HeaderText="Price" SortExpression="itemPrice" />
                <asp:BoundField DataField="Stocks" HeaderText="Stocks" SortExpression="Stocks" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" SelectCommand="SELECT Items.*, Categories.CategoriesName
FROM Items
INNER JOIN Categories ON Items.CategoriesID = Categories.CategoriesID;
"></asp:SqlDataSource>
    </form></Center>
</body>
</html>
