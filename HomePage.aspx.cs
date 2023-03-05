using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection.Emit;
using System.Text;
using System.Drawing;
using System.Security.Authentication.ExtendedProtection;
using System.Xml.Linq;

namespace BookStore
{
    public partial class HomePage : System.Web.UI.Page
    {
        RegisterPage rgp = new RegisterPage();
        
        public string conStringsa = "Data Source=SAIFBATTAH;Initial Catalog=BookDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conStringsa);
            con.Open();
            SqlCommand cmd = new SqlCommand("select firstname,lastname,username,phonenumber,gender,pw,userfavbooktypes from userdata where username = @uname", con);
            cmd.Parameters.AddWithValue("@uname", Session["username"]);

            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                lblwelcome.Text = "Welcome " + sdr["username"].ToString();
                lblfname.Text = "First Name: " + sdr["firstname"].ToString();
                lbllname.Text = "Last Name: " + sdr["lastname"].ToString();
                lbluname.Text = "User Name: " + sdr["username"].ToString();
                lblphonenumber.Text = "Phone: 0" + sdr["phonenumber"].ToString();
                lblgender.Text = "Gender: " + sdr["gender"].ToString();
                lblpw.Text = "Password: " + sdr["pw"].ToString();
                Session["selectedbooklist"] = sdr["userfavbooktypes"].ToString();

            }
            sdr.Close();
            con.Close();


            string str = Session["selectedbooklist"].ToString();
            String[] spearator = { "|" };
            Int32 count = 10;

            String[] strlist = str.Split(spearator, count,
                StringSplitOptions.RemoveEmptyEntries);
            string bookliist = "";

            foreach (String s in strlist)
            {
                if (s.Length > 0)
                {
                    bookliist += "booktype = '" + s + "' or ";
                }
            }

            bookliist += "booktype = ''";



            using (SqlConnection sqlCon = new SqlConnection(conStringsa))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select bookname, authorname, booktype, pagenumbers from booktable where " + bookliist + " ;", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                GridView2.DataSource = dtbl;
                GridView2.DataBind();
                sqlCon.Close();
            }

        }

        protected void Button_LogOut(object sender, EventArgs e)
        {
            Server.Transfer("LoginPage.aspx");
        }

        protected void GridView2_DataBinding(object sender, EventArgs e)
        {
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onclick"] = "showRowInfo(this)";
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }


        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
           /* foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    if(row.BackColor == ColorTranslator.FromHtml("#32E000"))
                    {
                        row.BackColor = ColorTranslator.FromHtml("#1F386E");
                        row.ToolTip = "Click to select this row.";
                    }
                    else
                    {
                        row.BackColor = ColorTranslator.FromHtml("#32E000");
                        row.ToolTip = string.Empty;
                    }
                    
*//*                    row.Cells[0].Text;
                    row.Cells[1].Text;
                    row.Cells[2].Text;
                    row.Cells[3].Text;
                    row.Cells[4].Text;*//*
                   
                }
                else
                {
                    row.ToolTip = "Click to select this row.";
                }
            }*/
        }

        public virtual bool ShowSelectButton { get; set; }

        protected void gridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /*
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
               // row.BackColor = ColorTranslator.FromHtml("#32E000");
                string id = row.Cells[1].Text;
                string name = row.Cells[2].Text;
                string email = row.Cells[3].Text;
                string message = string.Format("ID: {0}, Name: {1}, Email: {2}", id, name, email);
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "alert('" + message + "');", true);
            }
            */
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /*
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow rows = GridView2.Rows[index];
                rows.BackColor = ColorTranslator.FromHtml("#32E000");
                string id = rows.Cells[1].Text;
                string name = rows.Cells[2].Text;
                string email = rows.Cells[3].Text;
                string message = string.Format("ID: {0}, Name: {1}, Email: {2}", id, name, email);
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "alert('" + message + "');", true);
            }
            */
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onclick"] = "showRowInfo(this)";
                Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}