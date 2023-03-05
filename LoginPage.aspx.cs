using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace BookStore
{
    public partial class LoginPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string conString = "Data Source=SAIFBATTAH;Initial Catalog=BookDB;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from userdata where username = @uname and pw = @password",con);
            cmd.Parameters.AddWithValue("@uname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);

            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                Session["username"] = TextBox1.Text.ToString();
                Server.Transfer("HomePage.aspx");
            }
            else
            {
                Label4.Text = "Username or Password Incorrect!...";
            }

            sdr.Close();
            con.Close();

        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("RegisterPage.aspx");
        }
    }
}