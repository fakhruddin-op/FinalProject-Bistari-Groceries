using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class kawantry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        protected void btnLogin_Click(object sender, EventArgs e)
            {
                string sql = @"SELECT * FROM Users WHERE username = @username";

                SqlConnection conn = new SqlConnection(ConfigurationManager.
                    ConnectionStrings["connFunko"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Object objUserID = dt.Rows[0]["userID"];
                    Object objPasswordHash = dt.Rows[0]["password"];
                    Object objRole = dt.Rows[0]["role"];
                    Object objEnabled = dt.Rows[0]["enabled"];
                    string password = txtPass.Text;
                    string storedPasswordHash = objPasswordHash.ToString();

                    PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                    bool check = hash.PasswordCheck;
                    bool enabled = Convert.ToBoolean(objEnabled);

                    if (check == true && enabled == true)
                    {
                        Session["username"] = txtUsername.Text;
                        Session["userID"] = objUserID;
                        Session["role"] = objRole;
                        if (Session["Role"].ToString() == "user")
                            Response.Redirect("WebFormView.aspx");
                        else if (Session["Role"].ToString() == "admin")
                            Response.Redirect("WebFormAdmin.aspx");
                    }
                }
                else
                {
                    lblStatus.Text = "Incorrect password or account not found.";
                }
            }
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            // Clear the text values of textboxes
            txtUsername.Text = string.Empty;
            txtPass.Text = string.Empty;

            // Add any other reset logic if needed
        }

        protected void btnRegister_Click(object sender, EventArgs e)
            {
                Response.Redirect("WebFormRegister.aspx");
            }
        }
    }