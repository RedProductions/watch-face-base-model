//current temperature
float temperature = 0;
//current conditions
String weather = " ";
//current condition code. See https://developer.yahoo.com/weather/archive.html#examples
int weatherCode;
//Day of the week
String day = " ";

// Yahoo weather uses WOEID (Where On Earth IDentifier) 
// https://en.wikipedia.org/wiki/WOEID
String woeid = "3458";

//flag to check once in the chosen minute
boolean hasCheckedWeather;

//sensors for the step counter
SensorManager manager;
Sensor sensor;
SensorListener listener;

//vibrator object and flag to vibrate once every hour
Vibrator vibe;
boolean hasVibed;

//what time to vibrate (what minute in the hour (0-59))
final int vibeTime = 0;

//what is the amount of steps to achieve each day
final int stepGoal = 5000;

//what time to update weather
final int weatherTime = 0;

//amount of steps
int steps = 0;
//offset the amount of steps to the current step counter's count
int offset = -1;

//flag reset the step amount at midnight
boolean resetStep;