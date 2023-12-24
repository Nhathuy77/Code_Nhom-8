
#include <MPU6050_tockn.h>
#include <Wire.h>

MPU6050 mpu6050(Wire);
int x,y,z;
int LED = 9;
void setup() {
  Serial.begin(9600);
  Wire.begin();
  mpu6050.begin();
  mpu6050.calcGyroOffsets(false);

}

void loop() {
  mpu6050.update();
  mpu6050.update();
  x = mpu6050.getAngleX();
  y = mpu6050.getAngleY();
  z = mpu6050.getAngleZ();
  Serial.print("angleX : ");
  Serial.print(x);
  Serial.print("\tangleY : ");
  Serial.print(y);
  Serial.print("\tangleZ : ");
  Serial.print(z);

  if (x >= 15 or x <= -15 or y >= 15 or y <= -15){
    digitalWrite(LED, HIGH);
    Serial.println("Err");
 }
 
  else{
     digitalWrite(LED, LOW);
    Serial.println("  Balance");
  }
 
}
