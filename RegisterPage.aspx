<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="BookStore.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store - Register Page</title>
    <link href="RegStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="regbox">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="fname" placeholder="First Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" CssClass="lname" placeholder="Last Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" CssClass="uname" placeholder="User Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" CssClass="phonenumber" placeholder="Phone Number"></asp:TextBox>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="gender">
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Favorite Book Types" CssClass="lblfavorbooks"></asp:Label>
            <br />
            <div class="chkbox">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="CheckBoxList">
                    <asp:ListItem Value="Java">Java</asp:ListItem>
                    <asp:ListItem Value="Data Structure">Data Structure</asp:ListItem>
                    <asp:ListItem Value="Data Base">Data Base</asp:ListItem>
                    <asp:ListItem Value="C">C</asp:ListItem>
                    <asp:ListItem Value="C#">C#</asp:ListItem>
                    <asp:ListItem Value="Shell">Shell</asp:ListItem>
                    <asp:ListItem Value="Tragidia">Tragidia</asp:ListItem>
                    <asp:ListItem Value="Action">Action</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <br />
            <asp:TextBox ID="TextBox6" runat="server" CssClass="pw" placeholder="Password" TextMode="Password"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox7" runat="server" CssClass="repw" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>

            <br />
            <asp:Button ID="Button1" CssClass="btnreg" runat="server" Text="Regist" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" CssClass="sucmsg" runat="server" Text=""></asp:Label>
        </div>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=SAIFBATTAH;Initial Catalog=BookDB;Integrated Security=True" SelectCommand="SELECT * FROM [userdata]"></asp:SqlDataSource>
</body>
</html>
