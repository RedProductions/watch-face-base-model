void setup(){
  
  fullScreen();
  
  frameRate(1);
  
  textAlign(CENTER, CENTER);
  
  //hasn't checked the weather
  hasCheckedWeather = false;
  
  //hasn't vibrated yet
  hasVibed = false;
  
  //hasn't reset the step counter yet
  resetStep = false;
  
  //create context
  Context context = getContext();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER);  
  listener = new SensorListener();  
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
  
  //go get weather information
  getWeather();
  
}



void draw(){
  
  //get application's context to access battery level (context is face watch)
  Context context;
  IntentFilter ifilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
  Intent batteryStatus;
  context = getContext();
  
  //create vibrator from context
  vibe = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
  
  //access battery from context
  batteryStatus = context.registerReceiver(null, ifilter);
  
  //access battery level from battery
  int level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
  /*
  
  //=====ALL USABLE VARIABLES=====\\
  
  //=====TIME=====\\
  //hour() -> hour in 24 type
          //reformat time to 12 hour type
          int hour = hour();
          if(hour() > 12){
            hour = hour() - 12;
          }
          if(hour == 0){
            hour = 12;
          }
  //minute() -> minutes
  //second() -> seconds
  
  //=====DATE=====\\
  
  //year() -> year (4 digits i.e. 2018)
        //get last 2 digits of year (i.e. 18 for 2018)
        float y = year();
        float yearDivTen = (y/100);
        float yearDivTenNF = yearDivTen - floor(yearDivTen);
        int year = int(yearDivTenNF * 100);
  //month() -> month number
  //day() -> day number
  //day -> day name (abreviation) (getFullDay() to set to the full name (already called in getWeather()))
  
  //=====BATTERY=====\\
  
  //level -> watch's battery level
  
  //=====WEATHER=====\\
  
  //temperature -> Temperature (to change type (C or F), see end of url
  //weather -> condition
  //weatherCode -> yahoo's weather code (classified in getWeatherType())
  
  //=====ACTIVITY=====\\
  
  //steps -> amount of steps since reset
  
  
  */
  
  
  if(!wearAmbient()){
    
    /*
    
    ========================================
    WHAT TO DO WHEN WATCH'S SCREEN IS ACTIVE
    ========================================
    
    */
    
    
    
  }else {
    
    /*
    
    ==========================================
    WHAT TO DO WHEN WATCH'S SCREEN IS INACTIVE
    ==========================================
    
    */
    
    
    
  }
  
  
  
  hourCheck();
  
}




void hourCheck(){
  
  //actions to do each hour at vibrate defined minute
  if(minute() == vibeTime && !hasVibed){
    //vibrate for 300 milliseconds
    vibe.vibrate(300);
    //set vibration flag to true (prevent continuous vibration for an entire minute)
    hasVibed = true;
    
  }else if(minute() != vibeTime){
    //reset availability to vibrate next hour
    hasVibed = false;
  }
  
  //action to do each hour at weather refresh minute
  if(minute() == weatherTime && !hasCheckedWeather){
    //grab weather
    getWeather();
    //set check flag to true (prevent continuous checking for the entire minute)
    hasCheckedWeather = true;
  }else if(minute() != weatherTime){
    //reset availability to check next hour
    hasCheckedWeather = false;
  }
  
  if(hour() == 1 && minute() == 0 && !resetStep){
    //reset step count each day
    steps = 0;
    offset = -1;
    
    //restart the listener
    listener = new SensorListener();  
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
    
    
    //set reset flag to true (prevent continuous reseting of the step counter)
    resetStep = true;
    
  }else if(hour() != 1 || minute() != 0){
    //reset availability to reset next day
    resetStep = false;
  }
  
}