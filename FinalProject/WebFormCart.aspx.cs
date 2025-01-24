using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FinalProject
{
    public partial class WebFormCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["reportid"] != null)
                {
                    // Retrieve the report ID from the query parameters
                    string reportId = Server.UrlDecode(Request.QueryString["reportid"]);

                    // Use the reportId as needed
                    lblreportID.Text = reportId;

                    // Perform any additional logic here
                }

                GenerateReportID();
            }
        }

        void GenerateReportID()
        {
            Random rand = new Random();
            int maxAttempts = 10;
            int reportID;

            for (int attempt = 0; attempt < maxAttempts; attempt++)
            {
                reportID = rand.Next(10000000, 99999999);

                if(!ReportIDExists(reportID))
                {
                    lblreportID.Text = reportID.ToString();
                    return;
                }
            }

            throw new Exception("Unable to generate a unique Report ID after multiple attempts.");
        }

        bool ReportIDExists(int reportID)
        {
            string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Funko.mdf;Integrated Security=True";
            using (SqlConnection conn2 = new SqlConnection(conn))
            {
                conn2.Open();

                string query = "SELECT COUNT(*) FROM Report WHERE reportID = @ReportID";

                using (SqlCommand cmd = new SqlCommand(query, conn2))
                {
                    cmd.Parameters.AddWithValue("@ReportID", reportID);

                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;
                }
            }
        }
    }
}