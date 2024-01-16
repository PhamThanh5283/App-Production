using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocumentFormat.OpenXml.Spreadsheet;
using OfficeOpenXml;


namespace App_Production
{
    public partial class Initialize : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            if (Session["ID"] == null)
            {
                Response.Redirect("~/Userlogin.aspx");
            }
            if (IsPostBack) return;
            Txt_ID.Text = Session["ID"].ToString();
            Txt_name.Text = Session["username"].ToString();
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            if (FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".xlsx")
            {
                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                using (var excel = new ExcelPackage(FileUpload1.PostedFile.InputStream))
                {
                    var ws = excel.Workbook.Worksheets.First();
                    var hasHeader = true;
                    int startRow = hasHeader ? 2 : 1, i = 2;
                    for (int rowNum = startRow; rowNum <= ws.Dimension.End.Row; rowNum++)
                    {
                        //var wsRow = ws.Cells[rowNum, 1, rowNum, ws.Dimension.End.Column];
                        //foreach (var cell in wsRow)
                        //    row[cell.Start.Column - 1] = cell.Text;
                        Importdata(Session["ID"].ToString(), ws.Cells["A" + i].Value.ToString(), ws.Cells["B" + i].Value.ToString());
                        i++;
                    }
                    var msg = String.Format("DataTable successfully created from excel-file");
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = msg;
                    GridView1.DataBind();
                }
            }
            else
            {
                Label1.Text = "You did not specify a file to upload.";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void Importdata(string ID, String WC, String PS)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into MF_Area values('" + ID + "','" + WC + "','" + PS + "')";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if(Txt_Workcenter.Text!="" || Txt_Position.Text !="")
            {
                try
                {
                    Importdata(Session["ID"].ToString(), Txt_Workcenter.Text, Txt_Position.Text);
                    Response.Write("<script>alert('Success!');</script>");
                    Txt_Workcenter.Text = "";
                    Txt_Position.Text = "";
                    GridView1.DataBind();
                }
                catch(Exception ex) { }
            }    
        }

        protected void BtnDel_Click(object sender, EventArgs e)
        {
            try
            {
                if (GridView1.SelectedIndex < 0)
                { }
                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    String query = "Delete MF_Area Where ID=" + GridView1.SelectedRow.Cells[1].Text;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Success!');</script>");
                    GridView1.DataBind();
                }
            }
            catch { }
        }
        protected void BtnUpload2_Click(object sender, EventArgs e)
        {

        }
    }
}