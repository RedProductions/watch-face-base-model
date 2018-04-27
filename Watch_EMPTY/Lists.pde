color getWeatherType(){
  
  //set text color according to the weather (representative color)
  
  //default color to pure white in case of an error in the recieved code
  color col = color(255);
  
  if(weatherCode >= 0 && weatherCode <= 3){
    //catastrophic events (tornado, tropical storm, hurricane and heavy thunder)
    col = color(0, 255, 255);
    //set to thunder cloud
  }else if(weatherCode == 4 || (weatherCode >= 37 && weatherCode <= 39) || weatherCode == 45 || weatherCode == 47){
    //thunder (not heavy thunder)
    col = color(40, 255, 0.8 * 255);
    //set to thunder cloud
  }else if((weatherCode >= 5 && weatherCode <= 10) || weatherCode == 17 || weatherCode == 18 || weatherCode == 25 || weatherCode == 35){
    //freezing (not snow but can include some snow(hail, freezing rain, mix of ice and snow, etc.))
    col = color(formatHue(198), 0.4 * 255, 255);
    //set to snow cloud
  }else if(weatherCode == 11 || weatherCode == 12 || weatherCode == 40){
    //rain (only rain, from light rain to heavy rain, no thunder or freezing)
    col = color(formatHue(238), 0.9 * 255, 255);
    //set to rain cloud
  }else if((weatherCode >= 13 && weatherCode <= 16) ||  (weatherCode >= 41 && weatherCode <= 43) || weatherCode == 46){
    //snow (only snow, from light to storm)
    col = color(255);
    //set to snow cloud
  }else if((weatherCode >= 19 && weatherCode <= 30 && weatherCode != 25) || weatherCode == 44){
    //cloud or obstructed vision (no fall, smog, fog, dust, etc.)
    col = color(0, 0, 0.6 * 255);
    //set to grey cloud
  }else if(weatherCode == 31 || weatherCode == 33){
    //clear night (or small amout of clouds)
    col = color(formatHue(223), 255, 0.35 * 255);
    //set to white cloud
  }else if(weatherCode == 32 || weatherCode == 34){
    //clear day (or small amout of clouds)
    col = color(formatHue(60), 255, 255);
    //set to white cloud
  }else if(weatherCode == 36){
    //hot (no more info given)
    col = color(formatHue(43), 255, 255);
    //set to white cloud
  }else if(weatherCode == 3200){
    //no info available
    col = color(formatHue(295), 255, 255);
    //set to white cloud
  }
  
  return col;
  
}

void getFullDay(){
  
  //change the day from the abreviation to the full name
  
  switch(day){
    
    case("Mon"): day = "Monday"; break;
    case("Tue"): day = "Tuesday"; break;
    case("Wed"): day = "Wednesday"; break;
    case("Thu"): day = "Thursday"; break;
    case("Fri"): day = "Friday"; break;
    case("Sat"): day = "Saturday"; break;
    case("Sun"): day = "Sunday"; break;
    default: day = "NO CONNECTION"; break;
    
  }
  
}

//hue from (x/360) to (x/255)
int formatHue(int hue){
  return hue * 255 / 360;
}