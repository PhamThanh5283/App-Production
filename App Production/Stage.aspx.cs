using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Reflection.Emit;
using System.Linq.Expressions;
using System.Web.UI.WebControls.WebParts;

namespace App_Production
{
    public partial class Stage : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public string selectCB() => Request.Form["customRadioInline1"].ToString();
        public string user() => TextBox1.Text.Trim();
        private void checkrowselected()
        {
            string strSQL2 = "Select * From User_checked Where _Out = @ID";
            List<string> Temp = GetList(strSQL2, "00:00:00", "Stage_code");
            foreach (GridViewRow row in GridView1.Rows)
            {
                string gridvalue = row.Cells[7].Text;
                foreach (String Temp2 in Temp)
                {
                    if (Temp2 == gridvalue)
                    {
                        row.BackColor = System.Drawing.Color.LightGray;
                    }
                }
            }
            Temp.Clear();
        }
        public void Gridview1load()
        {
            if (Session["Admin"].ToString() == "1")
            {
                string fullfill = "Select * From Stage_table";
                Fillgridview(GridView1, fullfill);
            }    
            else
            {
                string fullfill = "Select * From Stage_table Where Teamleader_ID='" + Session["ID"] + "'";
                Fillgridview(GridView1, fullfill);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Refresh", "900");
            if (Session["username"] == null)
            {
                Response.Redirect("~/Userlogin.aspx");
            }
            else
            {
                TextBox1.Focus();
                Session["Logout"] = true;
                Session["Signup"] = false;
                //String fullfill1 = "select * From User_checked ";
                if (IsPostBack) return;
                //Fillgridview(GridView2, fullfill1);
                Gridview1load();
                checkrowselected();
                GetdataDropdownlist(0, DropDownList1, "_Floor", "", "");
                GetdataDropdownlist(0, DropDownList2, "Area", "", "");
                GetdataDropdownlist(0,DropDownList3, "Teamleader_Name","","");
                GetdataDropdownlist(0, DropDownList4, "Stage_code", "", "");
                GetdataDropdownlist(0, DropDownList5, "Stage_name", "", "");
                GetdataDropdownlist(0, DropDownList6, "Dept", "", "");
                Label4.Text = "IN";  
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Focus();
            //DropDownList3.SelectedItem.Text = GridView1.SelectedRow.Cells[3].Text;
            Label2.Text = GridView1.SelectedRow.Cells[8].Text;
            Label4.Text = selectCB();
            Label5.Text = "Selected";
            checkrowselected();
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            //string user = TextBox1.Text.Trim();
            string strSQL = "Select * From List_Employees where MaNV_Long = @userID";
            string strSQL1 = "Select * From User_checked Where _User_ID = @userID and _Out =''";
            string CheckTimeout = Getdata(strSQL1, user(), "_Out");
            TextBox2.Text = Getdata(strSQL, user(), "TenNV");
            /*----------------------------------------*/
            if (user() !=null)
            {
                if (GridView1.SelectedIndex < 0 && selectCB() == "IN")
                {
                    Response.Write("<script>alert('Vui lòng chọn công đoạn');</script>");
                }
                else
                {
                    if (Label5.Text == "Not Selected" && selectCB() == "IN")
                    {
                        Response.Write("<script>alert('Vui lòng chọn công đoạn');</script>");
                    }
                    else
                    {
                        try
                        {
                            SqlConnection con = new SqlConnection(strcon);
                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            if (selectCB() == "IN")
                            {
                                if (CheckTimeout != "00:00:00")
                                {
                                    SqlCommand cmd = new SqlCommand("Insert into User_checked (_Date,_In,_Out,Teamleader_ID,_User_ID,_Floor,Area,Stage_code) values(@_Date,@_In,@_Out,@Teamleader_ID,@_User_ID,@_Floor,@Area,@Stage_code)", con);
                                    cmd.Parameters.AddWithValue("@_Date", DateTime.UtcNow.Date);
                                    cmd.Parameters.AddWithValue("@_In", DateTime.Now.ToString("HH:mm:ss tt"));
                                    cmd.Parameters.AddWithValue("@_Out", "");
                                    cmd.Parameters.AddWithValue("@Teamleader_ID", GridView1.SelectedRow.Cells[4].Text);
                                    cmd.Parameters.AddWithValue("@_User_ID", user());
                                    cmd.Parameters.AddWithValue("@_Floor", GridView1.SelectedRow.Cells[3].Text);
                                    cmd.Parameters.AddWithValue("@Area", GridView1.SelectedRow.Cells[6].Text);
                                    cmd.Parameters.AddWithValue("@Stage_code", GridView1.SelectedRow.Cells[7].Text);
                                    cmd.ExecuteNonQuery();
                                    GridView1.SelectedRow.BackColor = System.Drawing.Color.LightGray;
                                    Label5.Text = "Not Selected";
                                }
                                else
                                {
                                    Response.Write("<script>alert('Bạn chưa check out công đoạn trước đó');</script>");
                                }
                            }
                            else
                            {
                                if (CheckTimeout == "00:00:00")
                                {
                                    SqlCommand cmd = new SqlCommand("UPDATE User_checked SET _Out = @_Out Where _User_ID = @userID and _Out = '00:00:00'", con);
                                    cmd.Parameters.AddWithValue("@_Out", DateTime.Now.ToString("HH:mm:ss tt"));
                                    cmd.Parameters.AddWithValue("@userID", user());
                                    cmd.ExecuteNonQuery();
                                }
                                else
                                {
                                    Response.Write("<script>alert('Bạn chưa tạo công đoạn mới hoặc đã check out rồi');</script>");
                                }

                            }
                            con.Close();
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Error');</script>");
                        }
                    }
                }

            }
            TextBox1.Text = "";
            TextBox1.Focus();
            GridView2.DataBind();
            Gridview1load();
            checkrowselected();
            DropDownList1.SelectedIndex = -1;
        }
        protected void Btn_update_Click(object sender, EventArgs e)
        {
            //BackColor = "#FF0066" ForeColor = "White"
            //System.Drawing.Color col = System.Drawing.ColorTranslator.FromHtml("#FFCC66");
            GridView1.SelectedRow.BackColor = System.Drawing.Color.Green;
        }

        protected void Btn_cancel_Click(object sender, EventArgs e)
        {
            if(GridView1.SelectedRow.BackColor == System.Drawing.Color.Green)
            {
                GridView1.SelectedRow.BackColor = System.Drawing.Color.LightGray;
            }    
        }
        public string Getdata(string strSQL,string user,string Columnn)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            using (SqlCommand myCommand = new SqlCommand(strSQL, con))
            {
                string readersl="";
                myCommand.Parameters.AddWithValue("@userID", user);
                using (SqlDataReader reader = myCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        readersl = reader[Columnn].ToString();
                        //return readersl;
                    }
                    con.Close();
                }
                return readersl;
            }
        }
        public List<string> GetList(string strSQL, string user, string Columnn)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            using (SqlCommand myCommand = new SqlCommand(strSQL, con))
            {
                myCommand.Parameters.AddWithValue("@ID", user);
                List<string> collist = new List<string>();
                using (SqlDataReader reader = myCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        collist.Add(reader[Columnn].ToString());
                    }
                    con.Close();
                }
                return collist;
            }
        }
        private void GetdataDropdownlist(int inx,DropDownList Dropname,string Column,string Column1,string Dvalue)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            if(inx == 0)
            {
                cmd = new SqlCommand("select distinct " + Column + " from Stage_table Where Teamleader_ID='" + Session["ID"] + "'", con);
            }
            else
            {
                cmd = new SqlCommand("select distinct " + Column + " from Stage_table Where " + Column1 + " = '" + Dvalue + "'" , con);
            }    
            var ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            Dropname.DataSource = ds;
            Dropname.DataTextField = Column;
            Dropname.DataValueField = Column;
            Dropname.DataBind();
            con.Close();
            Dropname.Items.Insert(0, "---Select---");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strSQL = "Select * From Stage_table where _Floor='" + DropDownList1.SelectedItem.Text + "' and Teamleader_ID='" + Session["ID"] + "'";
            Fillgridview(GridView1,strSQL);
            checkrowselected();
            GetdataDropdownlist(1, DropDownList2, "Area", "_Floor", DropDownList1.SelectedValue.ToString());
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strSQL = "Select * From Stage_table where Area='" + DropDownList2.SelectedItem.Text + "' and Teamleader_ID='" + Session["ID"] + "'";
            Fillgridview(GridView1,strSQL);
            checkrowselected();
        }
        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strSQL = "Select * From Stage_table where Teamleader_Name= N'" + DropDownList3.SelectedItem.Text + "' and Teamleader_ID='" + Session["ID"] + "'";
            Fillgridview(GridView1, strSQL);
            checkrowselected();
        }
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strSQL = "Select * From Stage_table where Stage_code= '" + DropDownList4.SelectedItem.Text + "' and Teamleader_ID='" + Session["ID"] + "'";
            Fillgridview(GridView1, strSQL);
            checkrowselected();
        }
        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strSQL = "Select * From Stage_table where Dept= N'" + DropDownList6.SelectedItem.Text + "' and Teamleader_ID='" + Session["ID"] + "'";
            Fillgridview(GridView1, strSQL);
            checkrowselected();
        }
        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strSQL = "Select * From Stage_table where Stage_name= N'" + DropDownList5.SelectedItem.Text + "' and Teamleader_ID='" + Session["ID"] + "'";
            Fillgridview(GridView1, strSQL);
            checkrowselected();
        }
        void Fillgridview(GridView Gr,String Str)
        {
            SqlConnection cnn = new SqlConnection(strcon);
            if (cnn.State == ConnectionState.Closed)
            {
                cnn.Open();
            }
            SqlCommand sqlcomm = new SqlCommand(Str, cnn);
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Gr.DataSource = dt;
            Gr.DataBind();
            cnn.Close();
        }

    }

}