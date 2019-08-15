<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordForgot.aspx.cs" Inherits="Customer_Enquiry.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p style="text-decoration: underline">
        <strong>Try Remembering your Security Code:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="btnHint" runat="server" Text="Hint" />
        </strong>
    </p>
    <p style="text-decoration: underline">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="88px" />
    </p>
</asp:Content>
