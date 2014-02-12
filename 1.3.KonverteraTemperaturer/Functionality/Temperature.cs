using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1._3.KonverteraTemperaturer.Functionality
{
    public class Temperature
    {
        public int CelciusToFahrenheit(int tempCelcius)
        {
            // Beräkna grader och konvertera till int
            double tempFahrenheit = (tempCelcius * 1.8) + 32;
            int roundedTemperature = Convert.ToInt32(Math.Round(tempFahrenheit, 0, MidpointRounding.ToEven));

            return roundedTemperature;
        }

        public int FahrenheitToCelsius(int tempFahrenheit)
        {
            // Beräkna grader och konvertera till int
            double tempCelcius = (tempFahrenheit - 32) * (5 / 9);
            int roundedTemperature = Convert.ToInt32(Math.Round(tempCelcius, 0, MidpointRounding.ToEven));

            return roundedTemperature;
        }
    }
}