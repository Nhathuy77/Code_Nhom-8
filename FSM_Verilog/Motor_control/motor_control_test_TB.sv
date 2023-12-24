
`timescale 1ns/1ns

module MOTOR_CONTROL_FSM_TB;
  
	logic clk;
	logic reset;

	logic gyroX;
	logic gyro_X;
	logic gyroY;
	logic gyro_Y;
	logic gyroZ;
	logic gyro_Z;
	
	logic receiverCH5;


	logic motor1;
	logic motor2;
	logic motor3;
	logic motor4;
	logic takeoff;
	logic landing;

	MOTOR_CONTROL_FSM dut( 
	.clk(clk),
	.reset(reset),
	.gyroX(gyroX),
	.gyro_X(gyro_X),
	.gyroY(gyroY),
	.gyro_Y(gyro_Y),
	.gyroZ(gyroZ),
	.gyro_Z(gyro_Z),
	
	.receiverCH5(receiverCH5),

	.motor1(motor1),
	.motor2(motor2),
	.motor3(motor3),
	.motor4(motor4),

	.takeoff(takeoff),
	.landing(landing)
	);

initial  
begin

	reset <= 1; 
	#1;

	reset <= 0;
	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 0;
	 #5;

	gyroX <= 0;
	gyro_X <= 1;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	 #5;	

	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 1;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	 #5;
	 
	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 1;
	receiverCH5 <= 1;
	 #5;
	
	
	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;
	
	
	gyroX <= 1;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;
	
	gyroX <= 0;
	gyro_X <= 1;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;

	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 1;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;
	
	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 1;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;
	
	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 1;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;
	
	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 1;
	receiverCH5 <= 1;
	#5;
	
	gyroX <= 1;
	gyro_X <= 0;
	gyroY <= 1;
	gyro_Y <= 0;
	gyroZ <= 0;
	gyro_Z <= 0;
	receiverCH5 <= 1;
	#5;
	
	gyroX <= 1;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 1;
	gyroZ <= 0;
	gyro_Z <= 1;
	receiverCH5 <= 1;
	#5;

	gyroX <= 0;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 1;
	gyroZ <= 0;
	gyro_Z <= 1;
	receiverCH5 <= 1;
	#5;
	

	gyroX <= 1;
	gyro_X <= 0;
	gyroY <= 0;
	gyro_Y <= 1;
	gyroZ <= 0;
	gyro_Z <= 1;
	receiverCH5 <= 0;
	#5 $stop;

	end
    always
    	begin
		clk <= 1;
		#1;
       		clk <= 0;
		#1;
    end

 endmodule