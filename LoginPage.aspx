<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="BookStore.LoginPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookStore - Login Page</title>
    <link href="LoginStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="loginbox">
            <asp:Label ID="Label1" runat="server" CssClass="lblusername" Text="Username"></asp:Label>    
            <asp:TextBox ID="TextBox1" CssClass="usernametext" runat="server"></asp:TextBox>
            <p>
            </p>
            <asp:Label ID="Label2" runat="server" CssClass="lblpassword" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" TextMode="password" CssClass="passwordtext" runat="server" placeholder="*********" ></asp:TextBox>
            <asp:Button ID="Button1" CssClass="btnlogin" runat="server" Text="Login" OnClick="Button1_Click" />
            <p>
                <asp:Label ID="Label4" CssClass="wronginfo" runat="server" Text=""></asp:Label>
                </p>
            <asp:Label ID="Label3" CssClass="lblnewmember" runat="server" Text="New Member?"></asp:Label>
            <asp:Button ID="Button2" cssclass="btnregister" runat="server" Text="Register" OnClick="Button2_Click" />
            <br />
            <br />
        </div>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=SAIFBATTAH;Initial Catalog=BookDB;Integrated Security=True" SelectCommand="SELECT * FROM [userdata]"></asp:SqlDataSource>
</body>
</html>