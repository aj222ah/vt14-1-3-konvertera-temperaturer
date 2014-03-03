using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _1._3.KonverteraTemperaturer.Functionality;

namespace _1._3.KonverteraTemperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConvertButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Hämtar (och eventuellt beräknar) inmatade värden
                var start = int.Parse(StartTemp.Text);
                var stop = int.Parse(EndTemp.Text);
                var step = int.Parse(StepSize.Text);
                var noOfSteps = ((stop - start) / step) + 1;
                var i = 0;
                var tempToConvert = start;

                int[] inputTemps = new int[noOfSteps];
                int[] temperatures = new int[noOfSteps];

                // Loopa igenom arrayerna och lägg till värden
                while (tempToConvert < stop && i < noOfSteps)
                {
                    if (i == 0)
                    {
                        tempToConvert = start;
                    }
                    else
                    {
                        tempToConvert += step;
                    }

                    inputTemps[i] = tempToConvert;

                    if (CtoF.Checked == true)
                    {
                        temperatures[i] = Temperature.CelsiusToFahrenheit(tempToConvert);
                    }
                    else
                    {
                        temperatures[i] = Temperature.FahrenheitToCelsius(tempToConvert);
                    }
                    i++;
                } ;

                // Lägg till rad med specifikation
                TableHeaderRow headerRow = new TableHeaderRow();

                TableCell convertFromCell = new TableCell(); 
                TableCell convertToCell = new TableCell();

                if (CtoF.Checked == true)
                {
                    convertFromCell.Text = "Celsius";
                    convertToCell.Text = "Fahrenheit";
                }
                else
                {
                    convertFromCell.Text = "Fahrenheit";
                    convertToCell.Text = "Celsius";
                }
                
                headerRow.Cells.Add(convertFromCell);
                headerRow.Cells.Add(convertToCell);
                TemperatureTable.Rows.Add(headerRow);

                // Loopa igenom arrayerna och lägg till en cell för varje
                for (i = 0; i < noOfSteps; i++)
                {
                    TableRow row = new TableRow();

                    TableCell originalValueCell = new TableCell();
                    originalValueCell.Text = inputTemps[i].ToString();
                    row.Cells.Add(originalValueCell);

                    TableCell newValueCell = new TableCell();
                    newValueCell.Text = temperatures[i].ToString();
                    row.Cells.Add(newValueCell);

                    TemperatureTable.Rows.Add(row);
                }

                // Gör tabellen synlig
                TemperatureTable.Visible = true;
            }
        }
    }
}