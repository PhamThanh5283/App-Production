using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Production
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton3.Visible = Convert.ToBoolean(Session["Logout"]);
            LinkButton2.Visible = Convert.ToBoolean(Session["Signup"]);
            if (Session["username"] == null)
            {
                LinkButton1.ForeColor = System.Drawing.ColorTranslator.FromHtml("Black");
            }
            else
            {
                LinkButton1.Text = Session["username"].ToString();
                LinkButton1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
                LinkButton1.OnClientClick = null;
            }    
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
                Session.Abandon();
                Session.Clear();
                Session.RemoveAll();
                Response.Redirect("~/Userlogin.aspx");
        }
    }
}