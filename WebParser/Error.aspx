<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebParser.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel runat="server" HorizontalAlign="Center">
                <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br />
                <br />
                <label>Stack Trace</label><br />
                <asp:TextBox TextMode="MultiLine" Width="300px" ID="errorBox" runat="server"></asp:TextBox>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
