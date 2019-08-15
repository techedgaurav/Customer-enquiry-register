using Customer_Enquiry.BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Customer_Enquiry.DB_Access
{
    public static class CommonDAL
    {
        public static DataSet GetResultDAL(ProcParametersBe objProcParametersBe)
        {
            DataSet ds = GetDataSet(objProcParametersBe);
            return ds;
        }

        private static DataSet GetDataSet(ProcParametersBe objProcParametersBe)
        {
            DataSet ds = new DataSet();
            using (Connection objConnection = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand(objProcParametersBe.storedProcName, objConnection.cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (objProcParametersBe.objDictionary != null)
                    {
                        foreach (KeyValuePair<string, object> obj in objProcParametersBe.objDictionary)

                            cmd.Parameters.AddWithValue(obj.Key, obj.Value);
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
            }

            return ds;
        }
    }
}