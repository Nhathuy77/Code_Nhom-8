#include <LiquidCrystal_I2C.h>
#include <Wire.h>
/* Add MPU6050 library*/
#include <Adafruit_MPU6050.h>

#define I2C_ADDR    0x27
#define LCD_COLUMNS 16
#define LCD_LINES   2

LiquidCrystal_I2C lcd(I2C_ADDR, LCD_COLUMNS, LCD_LINES);
Adafruit_MPU6050 mpu;
void setup() {
  Wire.begin();
  Serial.begin(115200);
  while(!Serial)
    delay(20);
  if(!mpu.begin())
  {
    while(1)
      delay(20);
  }
  mpu.setAccelerometerRange(MPU6050_RANGE_8_G);
  mpu.setGyroRange(MPU6050_RANGE_500_DEG);
  mpu.setFilterBandwidth(MPU6050_BAND_5_HZ);

  lcd.init();
  lcd.backlight();

}

void loop() {
  sensors_event_t acc, gyro, temp;
  mpu.getEvent(&acc, &gyro, &temp);
  lcd.setCursor(0,0);
  lcd.print(acc.acceleration.x);
  lcd.print(" ");
  lcd.print(acc.acceleration.y);
  lcd.print(" ");
  lcd.print(acc.acceleration.z);
  lcd.setCursor(0,1);
  lcd.print (gyro.gyro.x);
  lcd.print(" ");
  lcd.print(gyro.gyro.y);
  lcd.print(" ");
  lcd.print(gyro.gyro.z);

  Serial.print("Acce:");
  Serial.print(acc.acceleration.x);
  Serial.print("  ");
  Serial.print(acc.acceleration.y);
  Serial.print("  ");
  Serial.println(acc.acceleration.z);
  Serial.print("Gyro:");
  Serial.print(gyro.gyro.x);
  Serial.print("  ");
  Serial.print(gyro.gyro.y);
  Serial.print("  ");
  Serial.println(gyro.gyro.z);
  
  delay(500);
  
}
