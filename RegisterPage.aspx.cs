using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Authentication.ExtendedProtection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace BookStore
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string conStrings = "Data Source=SAIFBATTAH;Initial Catalog=BookDB;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["selectedbooklist"] = "";
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if(li.Selected == true)
                {
                    Session["selectedbooklist"] += li.Value.ToString() + "|";
                }
            }
//----------------------------------put in function

            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text)
                || string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text)
                || string.IsNullOrEmpty(DropDownList1.SelectedValue) || string.IsNullOrEmpty(TextBox6.Text)
                || string.IsNullOrEmpty(TextBox7.Text))
            {
                Label1.Text = "Please Fill all boxes.";
            }

            else if (!Regex.IsMatch(TextBox1.Text, @"^[a-zA-Z]+$"))
            {
                Label1.Text = "First name should'nt contain numbers or simbols";
            }

            else if (!Regex.IsMatch(TextBox2.Text, @"^[a-zA-Z]+$"))
            {
                Label1.Text = "Last name should'nt contain numbers or simbols";
            }

            else if (!Regex.IsMatch(TextBox4.Text, @"^[0-9]+$"))
            {
                Label1.Text = "Please Enter a correct phone number!";
            }

            else if(TextBox6.Text != TextBox7.Text)
            {
                Label1.Text = "Passwords Not Matching!";
            }


//----------------------------------put in function

            else
            {
                SqlConnection con = new SqlConnection(conStrings);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from userdata where username = @uname", con);
                cmd.Parameters.AddWithValue("@uname", TextBox3.Text);

                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    Label1.Text = "User Already Exists!";
                    Server.Transfer("RegisterPage.aspx");
                }
                else
                {   
                    Label1.Text = "";
                    SqlConnection con1 = new SqlConnection(conStrings);
                    con1.Open();
                    SqlCommand cmd1 = new SqlCommand("insert into userdata(firstname,lastname,username,phonenumber,gender, pw, repw, userfavbooktypes) " +
                        "values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "'," + TextBox4.Text + ",'"
                        + DropDownList1.SelectedValue + "','" + TextBox6.Text + "','" + TextBox7.Text + "','"+ Session["selectedbooklist"] + "');", con1);

                    SqlDataReader sdr1 = cmd1.ExecuteReader();

                    Label1.Text = "User Added Succefully!";

                    con1.Close();

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                }

                con.Close();
                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "2;url=LoginPage.aspx";
                this.Page.Controls.Add(meta);

            }
        }
    }
}