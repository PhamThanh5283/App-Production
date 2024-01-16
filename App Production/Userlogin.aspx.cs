using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Production
{
    public partial class userlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        Password_hash Encrypt_password;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Logout"] = false;
            Session["Signup"] = true;
            TextBox1.Focus();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from User_Register where ID ='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while(dr.Read())
                    {
                        Encrypt_password = new Password_hash();
                        string check = Encrypt_password.Encrypt(TextBox2.Text.Trim());
                        if (check == dr["Password"].ToString().Trim())
                        {
                            Response.Write("<script>alert('Login successful');</script>");
                            Session["username"] = dr["FullName"].ToString();
                            Session["ID"] = dr["ID"].ToString();
                            Session["Admin"] = dr["Admin"].ToString();
                            Response.Redirect("Stage.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invaild credentials');</script>");
                            TextBox2.Focus();
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invaild credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}