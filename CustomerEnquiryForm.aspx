<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerEnquiryForm.aspx.cs" Inherits="Customer_Enquiry.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <div class="col-sm-3">
                    <asp:Label ID="lblCustName" runat="server" Text="Customer Name" for="txtCustName"></asp:Label>
                    <asp:TextBox ID="txtCustName" runat="server" MaxLength="20"  class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCustName" runat="server" ControlToValidate="txtCustName" ValidationGroup="grpCreateAcc" Text="Please Tell Customer Name"></asp:RequiredFieldValidator>

                </div>

                <div class="col-sm-3">
                    <asp:Label ID="lblPartName" runat="server" Text="Part Name" for="txtPartName"></asp:Label>
                    <asp:TextBox ID="txtPartName" runat="server" onkeypress="return this.value.length<=20" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPartName" runat="server" ControlToValidate="txtPartName" ValidationGroup="grpCreateAcc" Text="Please Tell Part Name"></asp:RequiredFieldValidator>

                </div>


                <div class="col-sm-3">
                    <asp:Label ID="lblEnqNo" runat="server" Text="Enquiry No: " for="txtEnqNo"></asp:Label>
                    <asp:TextBox ID="txtEnqNo" runat="server" onkeypress="return this.value.length<=10" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEnqNo" runat="server" ControlToValidate="txtEnqNo" ValidationGroup="grpCreateAcc" Text=" Enquiry No Mandatory"></asp:RequiredFieldValidator>

                </div>


                <div class="col-sm-3">
                    <asp:Label ID="lblCustDrawing" runat="server" Text="Customer Drawing / Part No." for="txtCustDrawing"></asp:Label>
                    <asp:TextBox ID="txtCustDrawing" runat="server" onkeypress="return this.value.length<=10" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCustDrawing" runat="server" ControlToValidate="txtCustDrawing" ValidationGroup="grpCreateAcc" Text=" Provide Part no."></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-3">
                    <asp:Label ID="lblFmsiNo" runat="server" Text="FMSI No." for="txtFmsiNo"></asp:Label>
                    <asp:TextBox ID="txtFmsiNo" runat="server" onkeypress="return this.value.length<=15" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFmsiNo" runat="server" ControlToValidate="txtFmsiNo" ValidationGroup="grpCreateAcc" Text=" Provide FMSI No."></asp:RequiredFieldValidator>

                </div>

                <div class="col-sm-3">
                    <asp:Label ID="lblWvaNo" runat="server" Text="WVA No." for="txtWvaNo"></asp:Label>
                    <asp:TextBox ID="txtWvaNo" runat="server" onkeypress="return this.value.length<=15" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWvaNo" runat="server" ControlToValidate="txtWvaNo" ValidationGroup="grpCreateAcc" Text=" Provide Wva No."></asp:RequiredFieldValidator>

                </div>

                <div class="col-sm-3">
                    <asp:Label ID="lblModelName" runat="server" Text="Vehicle Model Name" for="txtModelName"></asp:Label>
                    <asp:TextBox ID="txtModelName" runat="server" onkeypress="return this.value.length<=15" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModelName" runat="server" ControlToValidate="txtModelName" ValidationGroup="grpCreateAcc" Text=" Give Model Name"></asp:RequiredFieldValidator>

                </div>


                <div class="col-sm-3">
                    <asp:Label ID="lblModelStartYr" runat="server" Text="Vehicle Model Start Year / SOP" for="txtModelStartYr"></asp:Label>
                    <asp:TextBox ID="txtModelStartYr" runat="server" onkeypress="return this.value.length<=5" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModelStartYr" runat="server" ControlToValidate="txtModelStartYr" ValidationGroup="grpCreateAcc" Text=" Give Model Start Year / SOP"></asp:RequiredFieldValidator>

                </div>


                <div class="col-sm-3">
                    <asp:Label ID="lblDwgRevNo" runat="server" Text="Dwg. Revision No." for="txtDwgRevNo"></asp:Label>
                    <asp:TextBox ID="txtDwgRevNo" runat="server" onkeypress="return this.value.length<=15" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDwgRevNo" runat="server" ControlToValidate="txtDwgRevNo" ValidationGroup="grpCreateAcc" Text=" Give Dwg. Revision No."></asp:RequiredFieldValidator>

                </div>


                <div class="col-sm-3">
                    <asp:Label ID="lblEnqRecDt" runat="server" Text="Enquiry Recieve Date" for="txtEnqRecDt"></asp:Label>
                    <asp:TextBox ID="txtEnqRecDt" runat="server" AutoComplete="off" onkeypress="return this.value.length<=15" class="form-control datePic datepicker"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEnqRecDt" ValidationGroup="grpCreateAcc" Text=" Give Dwg. Revision No."></asp:RequiredFieldValidator>

                </div>

                <div class="col-sm-3">
                    <asp:Label ID="lblAnnualVol" runat="server" Text="Annual Volume (pcs./yr.)" for="txtAnnualVol"></asp:Label>
                    <asp:TextBox ID="txtAnnualVol" runat="server" onkeypress="return this.value.length<=10" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAnnualVol" runat="server" ControlToValidate="txtAnnualVol" ValidationGroup="grpCreateAcc" Text="  Annual Volume?"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revAnnualVol" runat="server" ValidationGroup="grpCreateAcc" ValidationExpression="^\d+$" ControlToValidate="txtAnnualVol" ErrorMessage="Invalid Format,Numbers Only"></asp:RegularExpressionValidator>
                </div>


                
             </div>

            </div>
            </div>

 <div class="row">

        <div class="col-sm-12">
            <asp:Button ID="btnSave" runat="server" Text="Save Details" OnClick="btnSave_Click" class="btn btn-primary" ValidationGroup="grpCreateAcc" />
            
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-primary" />
            
        </div>

    </div>




</asp:Content>

