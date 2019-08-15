using Customer_Enquiry.BusinessEntity;
using Customer_Enquiry.DB_Access;
using System;
using System.Collections.Generic;
using System.Data;

namespace Customer_Enquiry
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        //private object txtCreatedOn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strCustomerEnqId = Request.QueryString["CustomerEnquiryId"];
                if (!string.IsNullOrEmpty(strCustomerEnqId))
                {
                    int CustomerEnqId = Convert.ToInt32(strCustomerEnqId);
                    BindControlVal(CustomerEnqId);
                }
            }
        }
        private void BindControlVal(int customerEnqId)
        {
            CustomerEnquiry ObjBE = new CustomerEnquiry();
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("@CommandText", "GetEnqById");
            dic.Add("@CustomerEnquiryId", customerEnqId);
            ProcParametersBe proc = new ProcParametersBe();
            proc.storedProcName = "SP_CustomerEnquiry";
            proc.objDictionary = dic;
            DataSet Ds = CommonDAL.GetResultDAL(proc);
            if (Ds != null)
            {
                for (int i = 0; i < Ds.Tables[0].Rows.Count; i++)
                {
                    txtCustName.Text = Convert.ToString(Ds.Tables[0].Rows[i]["CustomerName"]);
                    txtPartName.Text = Ds.Tables[0].Rows[i]["PartName"].ToString();
                    txtEnqNo.Text = Ds.Tables[0].Rows[i]["EnquiryNo"].ToString();
                    txtCustDrawing.Text = Ds.Tables[0].Rows[i]["CustomerDrawingPartNo"].ToString();
                    txtFmsiNo.Text = Ds.Tables[0].Rows[i]["FMSINo"].ToString();
                    txtWvaNo.Text = Ds.Tables[0].Rows[i]["WVANo"].ToString();
                    txtModelName.Text = Ds.Tables[0].Rows[i]["VehicleModelName"].ToString();
                    txtModelStartYr.Text = Ds.Tables[0].Rows[i]["VehicleModelStartYear"].ToString();
                    txtDwgRevNo.Text = Ds.Tables[0].Rows[i]["DWGRevisionNo"].ToString();
                    txtEnqRecDt.Text = Ds.Tables[0].Rows[i]["EnquiryRecievedDate"].ToString();
                    txtAnnualVol.Text = Ds.Tables[0].Rows[i]["AnnualVolume"].ToString();
                    ///txtCreatedOn.Text = Ds.Tables[0].Rows[i]["CreatedOn"].ToString();
                }
                btnSave.Enabled = false;
            }
            else
            {
                btnSave.Enabled = true;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            UserAccount ssnUser = new UserAccount();
            if (Session["UserInfo"] != null)
            {
                ssnUser = (UserAccount)Session["UserInfo"];
                CustomerEnquiry CustEnq = new CustomerEnquiry();
                CustEnq.CustName = txtCustName.Text;
                CustEnq.PartName = txtPartName.Text;
                CustEnq.EnqNo = txtEnqNo.Text;
                CustEnq.CustDrawing = txtCustDrawing.Text;
                CustEnq.FmsiNo = txtFmsiNo.Text;
                CustEnq.WvaNo = txtWvaNo.Text;
                CustEnq.ModelName = txtModelName.Text;
                CustEnq.ModelStartYr = txtModelStartYr.Text;
                CustEnq.DwgRevNo = txtDwgRevNo.Text;
                CustEnq.EnqRecDt = Convert.ToDateTime(txtEnqRecDt.Text);
                CustEnq.AnnualVol = Convert.ToInt32(txtAnnualVol.Text);
                CustEnq.CreatedBy = ssnUser.UserId;
                //CustEnq.CreatedOn = txtCreatedOn.Text;
                Save(CustEnq);
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerEnquiryList.aspx");
        }
        private void Save(CustomerEnquiry CustEnq)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();

            dic.Add("@CommandText", "AddEnquiry");
            dic.Add("@CustomerName", CustEnq.CustName);
            dic.Add("@PartName", CustEnq.PartName);
            dic.Add("@EnquiryNo", CustEnq.EnqNo);
            dic.Add("@CustomerDrawingPartNo", CustEnq.CustDrawing);
            dic.Add("@FMSINo", CustEnq.FmsiNo);
            dic.Add("@WVANo", CustEnq.WvaNo);
            dic.Add("@VehicleModelName", CustEnq.ModelName);
            dic.Add("@VehicleModelStartYear", CustEnq.ModelStartYr);
            dic.Add("@DWGRevisionNo", CustEnq.DwgRevNo);
            dic.Add("@EnquiryRecievedDate", CustEnq.EnqRecDt);
            dic.Add("@AnnualVolume", CustEnq.AnnualVol);
            dic.Add("@CreatedBy", CustEnq.CreatedBy);
            dic.Add("@CreatedOn", DateTime.Now);
            ProcParametersBe proc = new ProcParametersBe();
            proc.storedProcName = "SP_CustomerEnquiry";
            proc.objDictionary = dic;

            CommonDAL.GetResultDAL(proc);
            Response.Redirect("~/CustomerEnquiryList.aspx", false);
        }
    }
}