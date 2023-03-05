<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SmartHomePage.aspx.cs" Inherits="BookStore.SmartHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <link href="SmartHomeStyleSheet1.css" rel="stylesheet" />
    <title>BookStore - Home Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="left-section"></div>
            <div class="mid-section"></div>
            <div class="right-section">
                <button>
                    <i class="material-icons">menu</i>
                    <span>User Cart</span>
                </button>
                <img src="images/user.png" />
            </div>
        </header>

        <div class="content-area">
        </div>
    </form>
</body>
</html>
