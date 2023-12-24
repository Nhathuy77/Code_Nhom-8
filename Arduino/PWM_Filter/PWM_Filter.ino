#include <Arduino.h>
#include <Servo.h>
#include <SimpleKalmanFilter.h>
Servo myservo;
int pos = 0; 
#define RCPin 3
SimpleKalmanFilter locnhieu(2, 2, 0.01);
int RCValue, gt_filter;

void setup() 
{
  Serial.begin(9600);

  myservo.attach(9);

  pinMode(RCPin, INPUT);
  
}

void loop() 
{
 if(RCValue > 1800)RCValue = 1800;
  if(RCValue < 1000)RCValue = 1000;
  RCValue = pulseIn(RCPin, HIGH);
  gt_filter = locnhieu.updateEstimate(RCValue);
  pos = map(gt_filter, 1000, 2000, 0, 180);
  myservo.write(pos);
  Serial.print("Before: ");
  Serial.println(RCValue);

  Serial.print("\tAfter : ");
  Serial.println(gt_filter);
}