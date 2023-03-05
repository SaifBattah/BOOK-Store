<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BookStore.HomePage" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookStore - Home Page</title>
    <link href="HStyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="HomeBox">
            <div class="infobox">
                <asp:Label ID="lblwelcome" runat="server" CssClass="welcome"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblfname" runat="server" CssClass="fname"></asp:Label>
                <br />
                <asp:Label ID="lbllname" runat="server" CssClass="lname"></asp:Label>
                <br />
                <asp:Label ID="lbluname" runat="server" CssClass="uname"></asp:Label>
                <br />
                <asp:Label ID="lblphonenumber" runat="server" CssClass="phonenumber"></asp:Label>
                <br />
                <asp:Label ID="lblgender" runat="server" CssClass="gender"></asp:Label>
                <br />
                <asp:Label ID="lblpw" runat="server" CssClass="pw"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" CssClass="btnlogout" runat="server" Text="Log Out" OnClick="Button_LogOut"/>
            </div>
            <div class="favbooks">
                <asp:Label ID="lblfavb" runat="server" CssClass="favb" Text="Suggested Books"></asp:Label>
                <br />
                <asp:GridView ID="GridView2" runat="server" CssClass="tblfvbl" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged1">
                    <Columns>
                        <asp:BoundField DataField="bookname" HeaderText="bookname" SortExpression="bookname" />
                        <asp:BoundField DataField="authorname" HeaderText="authorname" SortExpression="authorname" />
                        <asp:BoundField DataField="booktype" HeaderText="booktype" SortExpression="booktype" />
                        <asp:BoundField DataField="pagenumbers" HeaderText="pagenumbers" SortExpression="pagenumbers" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
            </div>

            <div class="books">
                <asp:Label ID="lblbooks" runat="server" CssClass="allbooks" Text="Available Books"></asp:Label>
               <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:GridView ID="GridView1" runat="server"  CssClass="tblbl" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowCommand="gridview_RowCommand" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="bookname" HeaderText="bookname" SortExpression="bookname" />
                        <asp:BoundField DataField="authorname" HeaderText="authorname" SortExpression="authorname" />
                        <asp:BoundField DataField="booktype" HeaderText="booktype" SortExpression="booktype" />
                        <asp:BoundField DataField="pagenumbers" HeaderText="pagenumbers" SortExpression="pagenumbers" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    </Columns>
                </asp:GridView>

                <div id="dialog" style="display:none;">
                    <b>bookname: </b><span id="Bookname"></span>
                    <br />
                    <b>authorname: </b><span id="Authorname"></span>
                    <br />
                    <b>booktype: </b><span id="Booktype"></span>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [bookname], [authorname], [booktype], [pagenumbers], [quantity] FROM [booktable]"></asp:SqlDataSource>
            </div>
        </div>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=SAIFBATTAH;Initial Catalog=BookDB;Integrated Security=True" SelectCommand="SELECT * FROM [userdata]"></asp:SqlDataSource>
</body>
</html>
