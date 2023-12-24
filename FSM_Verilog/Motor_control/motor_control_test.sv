
module MOTOR_CONTROL_FSM(
	input logic clk,
	input logic reset,

	input logic gyroX,
	input logic gyro_X,
	input logic gyroY,
	input logic gyro_Y,
	input logic gyroZ,
	input logic gyro_Z,
	input logic gyroCheck,
	
	
	input logic receiverCH5,


	output logic motor1,
	output logic motor2,
	output logic motor3,
	output logic motor4,
	output logic takeoff,
	output logic landing
    );
    
    typedef enum logic [1:0] {A,B} State;
	State currentState, nextState; 
	
    always_ff @(posedge clk, negedge reset)
	begin
		if(reset)	currentState <= A;
		else		currentState <= nextState;
    	end

    always_comb
	 
		case(currentState)
			A:  
			if(receiverCH5 && !gyroX && !gyro_X && !gyroY && !gyro_Y) 	
				nextState = B;
			
			else 			nextState = A;
	
			B:  	
			if(!receiverCH5) 	nextState = A;
			else 			nextState = B;	

			
		default:			nextState = A;
		
		
	endcase
	
	assign takeoff = (currentState == B);
  	assign landing	= (currentState == A);
	assign motor1 = (gyro_X || gyroY || gyro_Z);
	assign motor2 = (gyro_X || gyro_Y || gyroZ);
	assign motor3 = (gyroX || gyroY || gyroZ);
	assign motor4 = (gyroX || gyro_Y || gyro_Z);
endmodule
