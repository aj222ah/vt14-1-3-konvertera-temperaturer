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
                var start = int.Parse(StartTemp.Text);
                var stop = int.Parse(EndTemp.Text);
                var step = int.Parse(StepSize.Text);
                var noOfSteps = ((stop - start) / step) + 2;
                var i = 0;

                int[] temperatures = new int[noOfSteps];

                for (i = 0; i < temperatures.Length; i++)
                {
                    if (CtoF.Checked == true)
                    {
                        temperatures[i] = Temperature.CelsiusToFahrenheit(start);
                    }
                    else
                    {
                        temperatures[i] = Temperature.FahrenheitToCelsius(start);
                    }
                }
            }
        }
    }
}