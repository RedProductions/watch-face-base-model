//code's intention
import android.content.Intent;
import android.content.IntentFilter;
//recieve broadcast
import android.content.BroadcastReceiver;
//code's context (current watch face)
import android.content.Context;
//battery access
import android.os.BatteryManager;
//vibrator access
import android.os.Vibrator;
//all sensors (only using step counter)
import android.hardware.Sensor;
import android.hardware.SensorManager;
//know events
import android.hardware.SensorEvent;
//be able to recieve said events
import android.hardware.SensorEventListener;
//network permissions and security
import android.os.StrictMode;

//Image essentials
import java.io.*;
import javax.imageio.*;
import java.awt.image.BufferedImage;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import processing.core.PConstants;
import processing.core.PImage;