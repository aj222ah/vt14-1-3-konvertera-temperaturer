<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1._3.KonverteraTemperaturer.Default" ViewStateMode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Temperaturkonvertering</title>
        <link rel="stylesheet" href="css/basic.css" />
    </head>
    <body>
        <div id="display">
            <form id="TempConversion" runat="server">
                <h1>Temperaturkonvertering</h1>
                <div id="inputField">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    <%-- Textbox för starttemperatur --%>
                    <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur för skala:"></asp:Label>
                    <asp:TextBox ID="StartTemp" runat="server" CssClass="inputBox"></asp:TextBox>
                    <%-- Validering av startemperaturinput. Måste vara ifyllt, måste vara integer. --%>
                    <asp:RequiredFieldValidator ID="StartTempRequired" runat="server" ErrorMessage="Du måste ange en starttemperatur." Display="None" ControlToValidate="StartTemp" CssClass="error"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="StartTempInt" runat="server" ErrorMessage="Du måste ange ett heltal som starttemperatur." Display="Dynamic" ControlToValidate="StartTemp" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                
                    <%-- Textbox för sluttemperatur --%>
                    <br /><asp:Label ID="EndTempLabel" runat="server" Text="Sluttemperatur för skala:"></asp:Label>
                    <asp:TextBox ID="EndTemp" runat="server" CssClass="inputBox"></asp:TextBox>
                     <%-- Validering av sluttemperaturinput. Måste vara ifyllt, måste vara integer, måste vara högre än starttemperaturen. --%>
                    <asp:RequiredFieldValidator ID="EndTempRequired" runat="server" ErrorMessage="Du måste ange en sluttemperatur." Display="None" ControlToValidate="EndTemp" ></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="EndTempInt" runat="server" ErrorMessage="Du måste ange ett heltal som sluttemperatur." Display="Dynamic" ControlToValidate="EndTemp" Operator="DataTypeCheck" Type="Integer" CssClass="error"></asp:CompareValidator>
                    <asp:CompareValidator ID="EndTempHigherThanStartTemp" runat="server" ErrorMessage="Sluttemperaturen måste vara högre än starttemperaturen." ControlToValidate="EndTemp" ControlToCompare="StartTemp" Display="Dynamic" Type="Integer" Operator="GreaterThan" CssClass="error"></asp:CompareValidator>
                
                    <%-- Textbox för steglängd --%>
                    <br /><asp:Label ID="StepSizeLabel" runat="server" Text="Antal grader per steg:"></asp:Label>
                    <asp:TextBox ID="StepSize" runat="server" CssClass="inputBox"></asp:TextBox>
                     <%-- Validering av steglängdinput. Måste vara ifyllt, måste vara integer, måste vara mellan 1 och 100. --%>
                    <asp:RequiredFieldValidator ID="StepSizeRequired" runat="server" ErrorMessage="Du måste ange hur långa temperatursteg du vill ha i tabellen." Display="None" ControlToValidate="StepSize" CssClass="error"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="StepSizeInt" runat="server" ErrorMessage="Du måste ange ett heltal för stegindex." Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ControlToValidate="StepSize"></asp:CompareValidator>
                    <asp:RangeValidator ID="StepSizeInRange" runat="server" ErrorMessage="Du måste ange ett temperatursteg som är mellan 1 och 100." MinimumValue="1" MaximumValue="100" Display="Dynamic" ControlToValidate="StepSize" CssClass="error" Type="Integer"></asp:RangeValidator>
                
                    <%-- Radiobuttons för omräkningstyp. --%>
                    <br /><asp:Label ID="ConversionType" runat="server" Text="Typ av konvertering:"></asp:Label><br />
                    <asp:RadioButton ID="CtoF" runat="server" Text="Celsius till Fahrenheit" GroupName="ConversionType" Checked="True" /><br />
                    <asp:RadioButton ID="FtoC" runat="server" Text="Fahrenheit till Celcius" GroupName="ConversionType" /><br />
                
                    <%-- Button för att initiera omräkning. --%>
                    <asp:Button ID="ConvertButton" runat="server" Text="Konvertera" CssClass="inputBox" OnClick="ConvertButton_Click" />
                    
                    <%-- Tabell för att redovisa resultat. --%>
                    <asp:Table ID="TemperatureTable" runat="server" Visible="False" CssClass="display">
                    </asp:Table>
                </div>
            </form>
        </div>
    </body>
</html>
