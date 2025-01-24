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
    public partial class WebFormRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected int GenerateRandomUserID()
        {
            Random rand = new Random();
            return rand.Next(100000, 999999);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int userID = GenerateRandomUserID();
            string password = txtPassword.Text;
            PBKDF2Hash hash = new PBKDF2Hash(password);
            string passwordHash = hash.HashedPassword;
            bool enabled = true;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connFunko"].ConnectionString);

            string sql = @"INSERT INTO Users (userID, email, username, password, role, enabled, address, noPhone) 
                        VALUES (@userid, @email, @username, @password, @role, @enabled, @address, @noPhone)";

            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@userid", userID);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@username",txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", passwordHash);
            cmd.Parameters.AddWithValue("@role", "user");
            cmd.Parameters.AddWithValue("@enabled", enabled);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@noPhone", txtPhone.Text);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();

                LoginDiv.Style["display"] = "block";
                lblStatus.Text = "Status! Data saved!";
            }
            catch (SqlException ex)
            {
                lblStatus.Text = ex.Message;
            }
            finally
            { 
                conn.Close(); 
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}