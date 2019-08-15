<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerEnquiryList.aspx.cs" Inherits="Customer_Enquiry.CustomerEnquiryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <a href="CustomerEnquiryForm.aspx" class="btn btn-lg btn-primary">New Enquiry</a>


    <div>
        <asp:GridView ID="gvitems" runat="server" DataKeyNames="CustomerEnquiryId" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a href='<%# String.Format("/CustomerEnquiryForm.aspx?CustomerEnquiryId={0}", Eval("CustomerEnquiryId")) %>'>View Detail</a>
                        <asp:Label ID="grdLblCustomerEnquiryId" Text='<%#Eval("CustomerEnquiryId") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" ItemStyle-Width="150" />
                <asp:BoundField DataField="PartName" HeaderText="Part Name" ItemStyle-Width="150" />
                <asp:BoundField DataField="EnquiryNo" HeaderText="Enquiry No" ItemStyle-Width="150" />
                <asp:BoundField DataField="CustomerDrawingPartNo" HeaderText="Customer Drawing Part No" ItemStyle-Width="150" />
                <asp:BoundField DataField="FMSINo" HeaderText="FMSI No" ItemStyle-Width="150" />
                <asp:BoundField DataField="WVANo" HeaderText="WVA No" ItemStyle-Width="150" />
                <asp:BoundField DataField="VehicleModelName" HeaderText="Vehicle Model Name" ItemStyle-Width="150" />
                <asp:BoundField DataField="VehicleModelStartYear" HeaderText="Vehicle Model Start Year" ItemStyle-Width="150" />
                <asp:BoundField DataField="DWGRevisionNo" HeaderText="DWG Revision No" ItemStyle-Width="150" />
                <asp:BoundField DataField="EnquiryRecievedDate" HeaderText=" Enquiry Recieved Date" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="150" />
                <asp:BoundField DataField="AnnualVolume" HeaderText="Annual Volume" ItemStyle-Width="150" />
                <asp:BoundField DataField="EnquiryStateName" HeaderText="State" ItemStyle-Width="150" />
                <asp:BoundField DataField="UserName" HeaderText="Created By " ItemStyle-Width="150" />
                <asp:BoundField DataField="CreatedOn" HeaderText="Created On" ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </div>



</asp:Content>
