# ccu3-openweathermap

A simple script to retrieve current weather data from [OpenWeather](https://openweathermap.org) and store it in HomeMatic CCU3 system variables. It retrieves the current outside temperature and wind speed.

## How to use

1. Sign up at [OpenWeather](https://openweathermap.org), the free plan allows enough API calls for updates every minute. If you need more frequent updates or more data, sign up for a paid subscription.
2. Receive an API key from [OpenWeather](https://openweathermap.org) via e-mail.
3. Adjust the variables in `weather.tcl` script:
    * `lat`: your latitude
    * `lon`: your longitude
    * `apiKey`: your API key
    * `ccu3VarTemp`: the name of your CCU3 system variable for outside temperature
    * `ccu3VarWindSpeed`: the name of your CCU3 system variable for wind speed
4. Create the CCU3 system variables for outside temperature and wind speed in your CCU3 admin UI. The names must match the script variables. Choose reasonable ranges for both variables, depending on what's to be expected in your area. For better readability, add units as well. The TCL script is set up to retrieve metric values, i.e. `°C` and `km/h`.
5. Copy the script file `weather.tcl` to your CCU3 using SSH. The main file system is read-only, so an attached USB drive is handy for storing it, e.g. `/media/usb0/weather.tcl`.
6. Create a program in the CCU3 admin UI to call the TCL script. Use the time module to configure the frequency, e.g. every minute, and run a script. The script must call the `weather.tcl`, so it must be adjusted depending on where the file is stored:

    ```javascript
    system.Exec("tclsh /media/usb0/weather.tcl");
    ```

Now you can use the system variables in programs to perform tasks depending on the current outside temperature and wind speed.
