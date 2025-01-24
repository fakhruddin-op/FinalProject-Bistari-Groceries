using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace FinalProject
{
    public partial class WebFormView : System.Web.UI.Page
    {
        private int userID;
        static double totalAmount;

        protected HtmlGenericControl cartDiv;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateReportID();

                if (Session["userID"] != null)
                {
                    userID = Convert.ToInt32(Session["userID"]);
                }

                UpdateCartDivVisibility();
            }

        }

        protected void UpdateCartDivVisibility()
        {
            if (cartDiv != null)
            {
                if (Session["ShowCart"] != null && (bool)Session["ShowCart"])
                {
                    cartDiv.Style["display"] = "block";
                    Session["ShowCart"] = false; // Reset the session variable
                }
                else
                {
                    cartDiv.Style["display"] = "none";
                }
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

                if (!ReportIDExists(reportID))
                {
                    lblreportID.Text = reportID.ToString();
                    return;
                }
            }

            throw new Exception("Unable to generate a unique Report ID after multiple attempts.");
        }

        bool ReportIDExists(int reportID)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connFunko"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Report WHERE reportID = @ReportID", conn))
            {
                cmd.Parameters.AddWithValue("@ReportID", reportID);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                return count > 0;
            }
        }

        void AddItemCart()
        {
            if (Session["userID"] != null)
            {
                int userID = Convert.ToInt32(Session["userID"]);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connFunko"].ConnectionString);

                SqlCommand cmd = new SqlCommand("spAddItemCart", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@reportid", lblreportID.Text);
                cmd.Parameters.AddWithValue("@userid", userID); // Use the userID from the session
                cmd.Parameters.AddWithValue("@itemid", lblItemId.Text);
                cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    lblMessage1.Text = "Great choice! The item is now in your cart.";

                    GridViewCart.DataBind();
                }
                catch (SqlException ex)
                {
                    lblMessage1.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }

                txtQuantity.Text = "1";
            }
            else
            {
                // Handle the case when userID is not present in the session
                lblMessage1.Text = "User not authenticated. Please log in.";
            }
        }

        void GetTotalAmount()
        {
            if (Session["userID"] != null)
            {
                int userID = Convert.ToInt32(Session["userID"]);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connFunko"].ConnectionString);

                SqlCommand cmd = new SqlCommand("spGetTotalAmount", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@reportid", lblreportID.Text);
                cmd.Parameters.AddWithValue("@userid", userID);

                try
                {
                    conn.Open();
                    totalAmount = (double)cmd.ExecuteScalar();
                    lblTotalAmountCart.Text = totalAmount.ToString("c2");
                }
                catch (SqlException ex)
                {
                    lblMessage2.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                // Handle the case when userID is not present in the session
                lblMessage1.Text = "User not authenticated. Please log in.";
            }

        }

        void Confirmed()
        {
            if (Session["userID"] != null)
            {
                int userID = Convert.ToInt32(Session["userID"]);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connFunko"].ConnectionString);

                SqlCommand cmd = new SqlCommand("spConfirmed", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@reportid", lblreportID.Text);
                cmd.Parameters.AddWithValue("@userid", userID);
                cmd.Parameters.AddWithValue("@totalAmount", totalAmount);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage2.Text = "Cart has been confirmed.";
                }
                catch (SqlException ex)
                {
                    lblMessage2.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
                txtQuantity.Text = "1";
            }
            else
            {
                lblMessage2.Text = "User not aunthenticated. Please log in.";
            }
        }

        void UnConfirmed()
        {
            if (Session["userID"] != null)
            {
                int userID = Convert.ToInt32(Session["userID"]);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connFunko"].ConnectionString);

                SqlCommand cmd = new SqlCommand("spRemoveUnConfirmed", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@reportid", lblreportID.Text);
                cmd.Parameters.AddWithValue("@userid", userID);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage2.Text = "Cart has been removed.";
                }
                catch (SqlException ex)
                {
                    lblMessage2.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                lblMessage2.Text = "User not aunthenticated. Please log in.";
            }
        }

        void DisplayInvoice()
        {
            double serviceTax, amountAfterTax, Rounding, Rounded;
            serviceTax = totalAmount * 0.06;
            amountAfterTax = totalAmount + serviceTax;
            Rounded = Math.Round((amountAfterTax) / 0.05) * 0.05;
            Rounding = Rounded - amountAfterTax;

            lblTotalAmount.Text = "Total amount: " + totalAmount.ToString("c2");
            lblServiceTax.Text = "Service tax (6%): " + serviceTax.ToString("c2");
            lblAmountAfterTax.Text = "Amount after Tax: " + amountAfterTax.ToString("c2");
            lblRounding.Text = "Rounding: " + Rounding.ToString("c2");
            lblAmountRounded.Text = "Amount to Pay: " + Rounded.ToString("c2");
        }

        void ClearAll()
        {
            lblItemId.Text = "";
            lblItem.Text = "";
            lblPrice.Text = "";
            lblTotalAmountCart.Text = "RM 0.00";
            lblTotalAmount.Text = "";
            lblServiceTax.Text = "";
            lblAmountAfterTax.Text = "";
            lblRounding.Text = "";
            lblAmountRounded.Text = "";
            lblMessage1.Text = "";
            lblMessage2.Text = "";
        }
        protected void btnCart_Click(object sender, EventArgs e)
        {
            AddItemCart();
            GridViewCart.DataBind();
            GetTotalAmount();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblItemId.Text = GridView1.SelectedRow.Cells[1].Text;
            lblItem.Text = GridView1.SelectedRow.Cells[3].Text;
            lblPrice.Text = "" + GridView1.SelectedRow.Cells[4].Text;
        }

        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageIndex = 0;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Confirmed();
            DisplayInvoice();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            UnConfirmed();
            ClearAll();
            ddlCategories.DataBind();
            GridView1.PageIndex = 0;
            GridViewCart.DataBind();
            UpdateCartDivVisibility();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Session["ShowCart"] = true;
            UpdateCartDivVisibility();
        }
    }
}