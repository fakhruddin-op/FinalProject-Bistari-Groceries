using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.UserControl
{
    public partial class LoginStatus : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] !=null && Session["role"] !=null)
            {
                HyperLinkLogin.Visible = false;
                HyperLinkRegister.Visible = false;
                btnLogout.Visible = true;
                lblLoginStatus.Text = "Welcome Back :  " + Session["username"].ToString();

                if (Session["userID"] !=null)
                {
                    int userID = Convert.ToInt32(Session["userID"]);
                    lblStatus.Text = "UserID: " + userID.ToString();
                }
            }
            else
            {
                HyperLinkLogin.Visible = true;
                HyperLinkRegister.Visible = true;
                btnLogout.Visible = false;
                lblLoginStatus.Text = "Opps sorry,you're not logged in.";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Homepage.aspx");
        }
    }
}