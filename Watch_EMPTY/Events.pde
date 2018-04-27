float getHourAngle(){
  
  float angle;
  
  //amount of angle steps
  int total = 12 * 60;
  
  //how many steps the current time is worth for
  int ratio = (((hour()%12) * 60) + minute()) * 360 / total;
  
  //ratio from degrees to radians
  angle = ratio * TAU / 360;
  
  return angle;
  
}

float getMinutesAngle(){
  
  float angle;
  
  //amount of angle steps
  int total = 60 * 60;
  
  //how many steps the current time is worth for
  int ratio = ((minute() * 60) + second()) * 360 / total;
  
  //ratio from degrees to radians
  angle = ratio * TAU / 360;
  
  return angle;
  
}

float getSecondsAngle(){
  
  float angle;
  
  //amount of angle steps
  int total = 60;
  
  //how many steps the current time is worth for
  int ratio = second() * 360 / total;
  
  //ratio from degrees to radians
  angle = ratio * TAU / 360;
  
  return angle;
  
}

void getWeather(){
  
  //allow network security access
  StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
  StrictMode.setThreadPolicy(policy);

  try{
    
    // The URL for the XML document
    String url = "http://query.yahooapis.com/v1/public/yql?format=xml&q=select+*+from+weather.forecast+where+woeid=" + woeid + "+and+u='C'";
    
    // Load the XML document
    XML xml = loadXML(url);
  
    // Grab the weather condition element
    XML condition = xml.getChild("results/channel/item/yweather:condition");
    
    XML forecast = xml.getChild("results/channel/item/yweather:forecast");
    
    // Get the attributes we want:
      //temperature (int)
      temperature = condition.getInt("temp");
      //weather condition (string)
      weather = condition.getString("text");
      //weather code (int)
      weatherCode = condition.getInt("code");
      //day of the week
      day = forecast.getString("day");
      getFullDay();
      
      //go fetch the current image
      getWeatherType();
      
    
    //Farenheith to Celsuis
    //temperature = (temperature - 32) * 0.555;
    //
    
    
  }catch(NullPointerException e){
    //catch if network cannot be reached
    
    //set weathercode to error if can't access api
    weatherCode = 3200;
    //set temp to 100 to indicate an error
    temperature = 100;
    
  }
  
  
}


//EVENT HANDLER
public void resume() {
  if (manager != null) {
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
  }
}

public void pause() {
  if (manager != null) {
    manager.unregisterListener(listener);
  }
}
//

//STEP COUNTER OBJECT
class SensorListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    //if offset is default value, it sets the offset to the current step count of the counter
    if (offset == -1){
      offset = (int)event.values[0];
    }
    steps = (int)event.values[0] - offset;
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) { }
}