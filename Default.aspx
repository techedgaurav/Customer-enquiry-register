<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Customer_Enquiry._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="More about us">
    </div>
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="img/login-icon.png" style="width:50px; height:50px;"/>
            <p id="profile-name" class="profile-name-card"></p>
            <div class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                 <asp:TextBox ID="txtUserName" CssClass="form-control" Placeholder="User Name..." runat="server"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Placeholder="Password..." TextMode="Password"></asp:TextBox>
                <%--<div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Lembrar senha
                    </label>
                </div>--%>
                 <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-lg btn-primary btn-block btn-signin" OnClick="btnLogin_Click" />
                <asp:Label ID="lblErr" runat="server"></asp:Label>
                
                <a href="SignUp.aspx">Sign-Up</a>&nbsp; / &nbsp;
                <a href="PasswordForgot.aspx">Forgot Password</a>
            </div><!-- /form -->
        </div>
    </div>



</asp:Content>
