using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace App_Production
{
    public partial class usersignup : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        Password_hash Encrypt_password;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            GetdataDropdownlist(DropDownList1, "Dept_name");
            Session["Logout"] = false;
            Session["Signup"] = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Checkmemberexists())
            {
                Response.Write("<script>alert('User already exists,check again please');</script>");
            }
            else
            {
                Sigupmember();
            }    
                    
        }
        bool Checkmemberexists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from User_Register where Email = '" + TextBox4.Text.Trim() + "'" + " or ID = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >=1)
                {
                    return true;
                }
                else
                {
                    return false;
                }    
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void Sigupmember()
        {
            //Response.Write("<script>alert('Testing');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert into User_Register (ID,Fullname,Dept,Email,Password,Contact,Registered_Date,Admin) values(@ID,@Fullname,@Dept,@Email,@Password,@Contact,@Registered_Date,0)", con);
                if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox4.Text == "" || TextBox6.Text == "" || TextBox9.Text == "")
                {
                    Response.Write("<script>alert('Các trường * không được để trống');</script>");
                }
                else
                {
                    if(TextBox6.Text.Length >= 8)
                    {
                        if (TextBox6.Text != TextBox9.Text)
                        {
                            Response.Write("<script>alert('Password do not match');</script>");
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@ID", TextBox1.Text.Trim());
                            cmd.Parameters.AddWithValue("@Fullname", TextBox2.Text.Trim());
                            cmd.Parameters.AddWithValue("@Dept", DropDownList1.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@Email", TextBox4.Text.Trim());
                            Encrypt_password = new Password_hash();
                            string EPW = Encrypt_password.Encrypt(TextBox6.Text.Trim());
                            cmd.Parameters.AddWithValue("@Password", EPW);
                            cmd.Parameters.AddWithValue("@Contact", TextBox7.Text.Trim() + TextBox8.Text.Trim());
                            cmd.Parameters.AddWithValue("@Registered_Date", DateTime.UtcNow.Date);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script>alert('Sign Up Successful');</script>");
                            Response.Redirect("Userlogin.aspx");
                        }
                    } 
                    else
                    {
                        Response.Write("<script>alert('Password phải >= 8 ký tự');</script>");
                    }    
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        private void GetdataDropdownlist(DropDownList Dropname, string Column)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand("select distinct " + Column + " from List_Employees", con);
            var ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            Dropname.DataSource = ds;
            Dropname.DataTextField = Column;
            Dropname.DataValueField = Column;
            Dropname.DataBind();
            Dropname.Items.Insert(0, "---Select---");
            con.Close();
        }
    }
}