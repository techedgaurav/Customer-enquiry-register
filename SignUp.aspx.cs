using Customer_Enquiry.BusinessEntity;
using Customer_Enquiry.DB_Access;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace Customer_Enquiry
{
    public partial class About : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFirstName.Text = "";
                txtLastName.Text = "";
            }

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            UserAccount usrAcc = new UserAccount();
            usrAcc.UserName = txtUserName.Text;
            usrAcc.FirstName = txtFirstName.Text;
            usrAcc.LastName = txtLastName.Text;
            usrAcc.Email = txtEmail.Text;
            usrAcc.Password = txtPassword.Text;
            usrAcc.RePassword = txtRePassword.Text;
            usrAcc.Security = txtSecurity.Text;
            usrAcc.IsAbove18 = ChkBxAge.Checked;
            usrAcc.Gender = (rbtnMale.Checked ? "Male" : "Female");
            if (fuProfilePic.HasFile)
            {
                fuProfilePic.SaveAs(Server.MapPath("UploadFile//" + fuProfilePic.FileName));
                usrAcc.FilePath = "UploadFile/" + fuProfilePic.FileName;
            }
            usrAcc.Phone = txtPhn.Text;
            usrAcc.BackupPhone = txtBackupPhn.Text;
            usrAcc.RecoveryId = txtRecoveryId.Text;
            lblError.Text = "";
            if (!IsUserExist(usrAcc.Email, usrAcc.UserName))
            {
                CreateAccount(usrAcc);
            }
            else
            {
                lblError.Text = "Email Id Already Exist OPT For another";
                return;

            }
        }

        private bool IsUserExist(string emailId, string UserName)
        {
            bool isExist = false;

            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("@CommandText", "IsUserAlreadyExist");
            dic.Add("@UserName", UserName);
            dic.Add("@EmailId", emailId);

            ProcParametersBe proc = new ProcParametersBe();
            proc.storedProcName = "SP_User";
            proc.objDictionary = dic;

            DataSet ds = CommonDAL.GetResultDAL(proc);
            if (ds != null)
            {
                if (ds.Tables.Count > 0 && ds.Tables[0] != null)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        isExist = true;
                    }
                }
            }
            return isExist;
        }
        //Method Of stored procedure 
        private void CreateAccount(UserAccount usrAcc)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();

            dic.Add("@CommandText", "NewUser");
            dic.Add("@UserName", usrAcc.UserName);
            dic.Add("@FirstName", usrAcc.FirstName);
            dic.Add("@LastName", usrAcc.LastName);
            dic.Add("@EmailId", usrAcc.Email);
            dic.Add("@PhoneNo", usrAcc.Phone);
            dic.Add("@ProfilePic", usrAcc.FilePath);
            dic.Add("@Password", usrAcc.Password);
            dic.Add("@RePassword", usrAcc.RePassword);
            dic.Add("@Security", usrAcc.Security);
            dic.Add("@Gender", usrAcc.Gender);
            dic.Add("@BackupPhone", usrAcc.BackupPhone);
            dic.Add("@RecoveryId", usrAcc.RecoveryId);

            ProcParametersBe proc = new ProcParametersBe();
            proc.storedProcName = "SP_User";
            proc.objDictionary = dic;

            CommonDAL.GetResultDAL(proc);
        }
    }
}