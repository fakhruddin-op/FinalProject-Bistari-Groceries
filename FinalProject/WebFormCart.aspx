<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="WebFormCart.aspx.cs" Inherits="FinalProject.WebFormCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
    <form >
        <div>
            <h4>Sales Cart</h4>
            <p>
                Sales ID:
                <asp:Label ID="lblreportID" runat="server" Text=""></asp:Label>&nbsp; || &nbsp;
                Date & Time:
                <asp:Label ID="lbldate" runat="server" Text=""></asp:Label>

            </p>
            <p>
                <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="itemID" HeaderText="itemID" SortExpression="itemID" />
                        <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                        <asp:BoundField DataField="itemPrice" HeaderText="itemPrice" SortExpression="itemPrice" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
                    </Columns>
                </asp:GridView>
                <br />
                Total Amount:
                <asp:Label ID="lblTotalAmountCart" runat="server" Text="RM0.00"></asp:Label>
            </p>
            <p>
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" />&nbsp;
            </p>
            <p>
                <asp:Label ID="lblMessage2" runat="server"></asp:Label>
            </p>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connFunko %>" SelectCommand="spGetItemCart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblreportID" Name="reportid" PropertyName="Text" Type="Int32" />
                <asp:Parameter Name="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form></center>
</asp:Content>