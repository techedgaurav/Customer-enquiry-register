<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Customer_Enquiry.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <h2>&nbsp;Your contact page.</h2>
    <address>
        One Microsoft Way<br />
       </address>
    <address style="color: #FF0000">
        <strong><em>Welcome back User</em></strong></address>
    <address>
        SEARCH:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </address>
    <address>
        &nbsp;</address>
    <address>
        &nbsp;</address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
