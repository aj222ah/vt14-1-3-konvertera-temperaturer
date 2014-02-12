<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1._3.KonverteraTemperaturer.Default" ViewStateMode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Temperaturkonvertering</title>
        <link rel="stylesheet" href="css/basic.css" />
    </head>
    <body>
        <form id="TempConversion" runat="server">
            <h1>Temperaturkonvertering</h1>
            <div id="inputField">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur för skala:"></asp:Label>
                <asp:TextBox ID="StartTemp" runat="server" CssClass="inputBox"></asp:TextBox>
                <asp:Label ID="EndTempLabel" runat="server" Text="Sluttemperatur för skala:"></asp:Label>
                <asp:TextBox ID="EndTemp" runat="server" CssClass="inputBox"></asp:TextBox>
                <asp:Label ID="StepSizeLabel" runat="server" Text="Antal grader per steg:"></asp:Label>
                <asp:TextBox ID="StepSize" runat="server" CssClass="inputBox"></asp:TextBox>
                <asp:Label ID="ConversionType" runat="server" Text="Typ av konvertering:"></asp:Label><br />
                <asp:RadioButton ID="CtoF" runat="server" Text="Celsius till Fahrenheit" /><br />
                <asp:RadioButton ID="FtoC" runat="server" Text="Fahrenheit till Celcius" /><br />
                <asp:Button ID="ConvertButton" runat="server" Text="Konvertera" CssClass="inputBox" OnClick="ConvertButton_Click" />
            </div>
        </form>
    </body>
</html>
