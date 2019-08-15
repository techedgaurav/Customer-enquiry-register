<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Customer_Enquiry.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <div class="col-sm-3">
                    <asp:Label ID="lblUserName" runat="server" Text="User Name" for="txtUserName"></asp:Label>
                    <asp:TextBox ID="txtUserName" runat="server" onkeypress="return this.value.length<=20" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ValidationGroup="grpCreateAcc" Text="Please Tell user Name"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-3">
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name" for="txtFirstName"></asp:Label>
                    <asp:TextBox ID="txtFirstName" runat="server" onkeypress="return this.value.length<=10" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ValidationGroup="grpCreateAcc" Text="Please fill First Name"></asp:RequiredFieldValidator>

                </div>

                <div class="col-sm-3">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    <asp:TextBox ID="txtLastName" class="form-control" onkeypress="return this.value.length<=10" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-3">
                    <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address"></asp:Label>
                    <asp:TextBox ID="txtEmail" class="form-control" onkeypress="return this.value.length<=25" runat="server" placeholder="email@gmail.com" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="grpCreateAcc" Text="Please give your desired Email Address"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblpswd" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" onkeypress="return this.value.length<=20" class="form-control" TextMode="Password" ></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="grpCreateAcc" Text="Please fill Password"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="grpCreateAcc" ErrorMessage="Weak Passsword" ValidationExpression="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,20}$"></asp:RegularExpressionValidator>

                    <button type="button" class="btn btn-lg btn-danger example-popover" data-toggle="popover" title=" Password has to be between 8-20 in lenght,it can also contain special characters and numbers" data-content="Be careful While setting your password ,it should be in described limit">Click to Know More</button>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblrepswd" runat="server" Text="Re-Enter Password" style="color:red;"></asp:Label>
                    <asp:TextBox ID="txtRePassword" runat="server" onkeypress="return this.value.length<=20" class="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ControlToValidate="txtRePassword" ValidationGroup="grpCreateAcc" Text="Please Re-enter Password"></asp:RequiredFieldValidator>

                    <button type="button" class="btn btn-lg btn-danger example-popover" data-toggle="popover" title="Here , this step is to confirm that you are sure what you've entered" data-content="Refill the Password carefully ,it should match the previously entered password .">Click to know more</button>
                    <asp:CompareValidator ID="cmpPassword" ControlToCompare="txtRePassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="Passwords don't match, try again"></asp:CompareValidator>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblSecurity" runat="server" Text="Security Word"></asp:Label>
                    <asp:TextBox ID="txtSecurity" onkeypress="return this.value.length<=10" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSecurity" runat="server" ControlToValidate="txtsecurity" ValidationGroup="grpCreateAcc" Text="Please tell Srcurity Code"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblAge" runat="server" Text="Above 18?"></asp:Label>
                    <asp:CheckBox ID="ChkBxAge" runat="server" />

                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                    <asp:RadioButton runat="server" Checked="true" ID="rbtnMale" Text="Male" GroupName="Gender" />
                    <asp:RadioButton runat="server" ID="rbtnFemale" Text="Female" GroupName="Gender" />
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblProfilePic" runat="server" Text="Set Your Profile Picture"></asp:Label>
                    <asp:FileUpload ID="fuProfilePic" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvfuProfilePic" runat="server" ControlToValidate="fuProfilePic" ValidationGroup="grpCreateAcc" Text="Please select your profile Picture"></asp:RequiredFieldValidator>
                </div>

                <div class="col-sm-4">
                    <asp:Label ID="lblPhn" runat="server" Text="Phone Number"></asp:Label>
                    <asp:TextBox ID="txtPhn" runat="server" onkeypress="return this.value.length<=13" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPhn" runat="server" ControlToValidate="txtPhn"
                        ErrorMessage="Enter numbers only " ValidationGroup="grpCreateAcc" ForeColor="Red"
                        ValidationExpression="\d+" />
                    <asp:RequiredFieldValidator ID="rfvPhn" runat="server" ControlToValidate="txtPhn" ValidationGroup="grpCreateAcc" Text="Please enter your phone number"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblBackupPhn" runat="server" Text="Add Backup Phone Number"></asp:Label>
                    <asp:TextBox ID="txtBackupPhn" runat="server" onkeypress="return this.value.length<=13" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revBkupPhn" runat="server" ControlToValidate="txtBackupPhn"
                        ErrorMessage="Enter numbers only " ValidationGroup="grpCreateAcc" ForeColor="Red"
                        ValidationExpression="\d+" />
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblRecoveryId" runat="server" Text="Add Recovery Email Id"></asp:Label>
                    <asp:TextBox ID="txtRecoveryId" onkeypress="return this.value.length<=25" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revRecoveryId" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtRecoveryId" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-sm-12">
            <asp:Button ID="btnCreate" runat="server" Text="Create Account" OnClick="btnCreate_Click" class="btn btn-primary" ValidationGroup="grpCreateAcc" />
            <asp:Button ID="btnRobot" runat="server" Text="I'am Not A Robot" Width="187px" class="btn btn-primary" />
            <asp:Button ID="btnHelp" runat="server" Text="Help" class="btn btn-primary" />
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>

    </div>
    <script>
        $(document).ready(function () {
            $(function () {
                $('.example-popover').popover({
                    container: 'body'
                })
            })
        });
    </script>
  

</asp:Content>

