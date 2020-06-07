<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="IdBox" runat="server" style="visibility: hidden" OnClick="DeleteUser"/>
        </div>
    </form>
</body>
<script type="text/javascript">
    function changeValue(id) {
        document.getElementById("IdBox").value = id;
        document.getElementById("IdBox").click();
    }
</script>
</html>
