using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Customer_Enquiry.BusinessEntity;
using Customer_Enquiry.DB_Access;

namespace Customer_Enquiry
{
    public partial class CustomerEnquiryList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //DataTable dt = new DataTable();
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("@CommandText", "GetAllEnquiryList");
                ProcParametersBe proc = new ProcParametersBe();
                proc.storedProcName = "SP_CustomerEnquiry";
                proc.objDictionary = dic;

                var ds=CommonDAL.GetResultDAL(proc);
                gvitems.DataSource = ds.Tables[0];
                gvitems.DataBind();
            }
        }
    }
}

