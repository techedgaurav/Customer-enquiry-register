using Customer_Enquiry.BusinessEntity;
using Customer_Enquiry.DB_Access;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace Customer_Enquiry
{
    public partial class _Default : Page
    {
        protected void page_load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserAccount usrAcc = new UserAccount();
            usrAcc.UserName = txtUserName.Text;
            usrAcc.Password = txtPassword.Text;
            UserAccount userDetail = GetUserInfo(usrAcc.UserName, usrAcc.Password);
            if (userDetail != null && userDetail.UserId > 0)
            {
                Session["UserInfo"] = userDetail;
                Response.Redirect("~/CustomerEnquiryList.aspx");
            }

            else
            {
                lblErr.Text = "Incorrect User Name or Password , Recheck Credentials !!  ";
            }

        }

        //protected void btnnew_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/About.aspx");
        //}

        //protected void btnPswd_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/PasswordForgot.aspx");
        //}


        private UserAccount GetUserInfo(string UserName, string Password)
        {
            UserAccount userAcc = new UserAccount();
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("@CommandText", "CheckUserCredentials");
            dic.Add("@UserName", UserName);
            dic.Add("@Password", Password);

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
                        //isExist = true;
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            userAcc.UserId = Convert.ToInt32(ds.Tables[0].Rows[i]["UserId"]);
                            userAcc.UserName = ds.Tables[0].Rows[i]["UserName"].ToString();
                            userAcc.FirstName = ds.Tables[0].Rows[i]["FirstName"].ToString();
                            userAcc.LastName = ds.Tables[0].Rows[i]["LastName"].ToString();
                            userAcc.ProfilePic = ds.Tables[0].Rows[i]["ProfilePic"].ToString();
                        }
                    }
                }
            }


            return userAcc;
            //using (SqlConnection con = new SqlConnection(connStr))
            //{
            //    SqlCommand cmd;
            //    if (con.State == ConnectionState.Open)
            //    {
            //        con.Close();
            //    }
            //    cmd = new SqlCommand();
            //    //cmd.CommandText = "insert into Tbl_User(FirstName,LastName,EmailId,PhoneNo,ProfilePic,BackupPhone)values('" + usrAcc.FirstName + "','" + usrAcc.LastName + "','" + usrAcc.Email + "','" + usrAcc.Phone + "','" + usrAcc.FilePath + "','" + usrAcc.BackupPhone + "')";
            //    //cmd.CommandText = "insert into Tbl_User(ColUserName,ColFirstName,ColLastName,ColEmailId,ColPhoneNo,ColProfilePic,ColPassword,ColRePassword,ColSecurity,ColGender,ColPhone,ColBackupPhone,ColRecoveryId)values('" + usrAcc.UserName + "','" + usrAcc.FirstName + "','" + usrAcc.LastName + "','" + usrAcc.Email + "','" + usrAcc.Phone + "','" + usrAcc.FilePath + "','" + usrAcc.Password + "','" + usrAcc.RePassword + "','" + usrAcc.Security + "','" + usrAcc.Gender + "','" + usrAcc.Phone + "','" + usrAcc.BackupPhone + "','" + usrAcc.RecoveryId + "')";
            //    cmd.CommandText = "select * from  Tbl_User where UserName='" + UserName + "' AND Password='" + Password + "' ";
            //    con.Open();
            //    cmd.Connection = con;
            //    var dr = cmd.ExecuteReader();
            //    if (dr.HasRows)
            //    {
            //        isExist = true;
            //    }
            //    else
            //    {
            //        isExist = false;
            //    }
            //    con.Close();
            //    return isExist;
            //}
        }
    }
}