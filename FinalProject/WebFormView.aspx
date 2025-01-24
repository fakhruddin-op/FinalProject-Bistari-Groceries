

<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true"  CodeBehind="WebFormView.aspx.cs" Inherits="FinalProject.WebFormView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%@ Register Src="~/UserControl/LoginStatus.ascx" TagPrefix="uc1" TagName="LoginStatus" %>



    <center>
        <style>
            body {
                color: black;
            }

            input {
                display: inline-flex;
            }

            table,tr,td,th{
                text-align:center;
                        font-family: 'Poppins', sans-serif;
                        color:black;
            }
            th,td{
                padding:0 10px;
            }
            th{
                background:#2b3a7e;
                color:white;
                        font-family: 'Poppins', sans-serif;
                        font-weight:200;
                        padding:10px;
            }
.cart{        background-color: #2b3a7e;
        color: white;
        margin-top:20px;
        padding: 10px 35px;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        display:inline-flex;
    }

.cart:hover{        background-color: #abd3fa;
        color: black;
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
        </style>
    <form id="form1">
        <div style="margin-top:-40px;">
            <div>
                <p>
                    <uc1:LoginStatus runat="server" ID="LoginStatus" />
                </p>
            </div>
            <div>
                <p><br />
                    Select Category : 
                    <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCategory" DataTextField="CategoriesName" DataValueField="CategoriesID" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged" >
                    </asp:DropDownList>
                </p>
<br />
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSourceItems" PageSize="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" ItemStyle-CssClass="select"  >
<ItemStyle CssClass="select"></ItemStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="itemID" HeaderText="Items ID" ReadOnly="True" SortExpression="itemID" />
                        <asp:BoundField DataField="CategoriesID" HeaderText="Categories" SortExpression="CategoriesID" />
                        <asp:BoundField DataField="itemName" HeaderText="Name " SortExpression="itemName" />
                        <asp:BoundField DataField="itemPrice" HeaderText="Price" SortExpression="itemPrice" />
                        <asp:BoundField DataField="Stocks" HeaderText="Stocks" SortExpression="Stocks" />
                        <asp:ImageField DataImageUrlField="itemName" DataImageUrlFormatString="imagesgroceries/{0}, , hi-res.png" HeaderText="Image">
                            <ControlStyle Height="150px" />
                        </asp:ImageField>
                    </Columns>
                </asp:GridView>
            </div>
<div class="item-details">
                <p>
                    Item Name:
                    <asp:Label ID="lblItemId" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblItem" runat="server" Text="..."></asp:Label>&nbsp; ||
                    Item Price: RM
                    <asp:Label ID="lblPrice" runat="server" Text="..."></asp:Label>&nbsp;
                </p></div>
                    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" SelectCommand="SELECT * FROM [Categories] ORDER BY [CategoriesName]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" SelectCommand="SELECT * FROM [Items] WHERE ([CategoriesID] = @CategoriesID)">
                        <SelectParameters >
                            <asp:ControlParameter ControlID="ddlCategories" Name="CategoriesID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                </asp:SqlDataSource>
                <p>
                    Quantity:
                    <asp:TextBox ID="txtQuantity" cssclass="" runat="server" TextMode="Number" Width="50px" min="1" max="10" Style="display:inline-flex;background:#f5f5f5;text-align:center;">1</asp:TextBox>&nbsp;
                    <asp:Button ID="btnCart" runat="server" cssclass="cart"  Text="Add to Cart" OnClick="btnCart_Click" />
                    <asp:Button ID="btnCheckOut"  runat="server" Text="Check My Cart"  cssclass="cart2" OnClick="btnCheckOut_Click" />
                </p></div>
                <br />
                <p>
                    <asp:Label ID="lblMessage1" runat="server"></asp:Label>
                </p>
        <center>
        <!--Cart-->
        <div id="cartDiv" runat="server" style="display: none;">
            <br /><br />
            <h4>Sales Cart</h4>
            <p>
                Sales:
                <asp:Label ID="lblreportID" runat="server"></asp:Label>&nbsp; |
                Date and Time:
                <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                <br /><br />
                <asp:GridView ID="GridViewCart" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCart">
                    <Columns>
                        <asp:BoundField DataField="itemID" HeaderText="Item ID" SortExpression="itemID" />
                        <asp:BoundField DataField="itemName" HeaderText="Name" SortExpression="itemName" />
                        <asp:BoundField DataField="itemPrice" DataFormatString="{0:c2}" HeaderText="Price" SortExpression="itemPrice" />
                        <asp:BoundField DataField="Quantity" HeaderText="Qty" SortExpression="Quantity" />
                        <asp:BoundField DataField="SubTotal" DataFormatString="{0:c2}" HeaderText="Total Amount" ReadOnly="True" SortExpression="SubTotal" />
                    </Columns>
                </asp:GridView>
            </p>
            <br />
            <p>
                Total Amount:
                <asp:Label ID="lblTotalAmountCart" runat="server" Text="RM0.00"></asp:Label>
            </p>
            <p><br />
                <asp:Button ID="btnConfirm" cssclass="cart2" runat="server" Text="Check Out" OnClick="btnConfirm_Click"/>&nbsp;
                <asp:Button ID="btnCancel" runat="server" CssClass="reset" Text="Cancel Sales" OnClick="btnCancel_Click" />&nbsp;
            </p><br />
            <p>
                <asp:Label ID="lblMessage2" runat="server"></asp:Label>
            </p>
            <br />
            <p>
                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label><br />
                <asp:Label ID="lblServiceTax" runat="server"></asp:Label><br />
                <asp:Label ID="lblAmountAfterTax" runat="server"></asp:Label><br />
                <asp:Label ID="lblRounding" runat="server"></asp:Label><br />
                <asp:Label ID="lblAmountRounded" runat="server"></asp:Label><br />
            </p>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" SelectCommand="spGetItemCart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblreportID" Name="reportid" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource><br /><br />
    </form></center>
</asp:Content>