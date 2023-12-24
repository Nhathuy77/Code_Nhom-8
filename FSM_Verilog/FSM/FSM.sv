
module DroneFSM(
    input logic clk,
	input logic reset,
	input logic gyrocheck,
	input logic reciverenable,
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
			if(reciverenable && gyrocheck) 	nextState = B;
			
			else 			nextState = A;
	
			B:  	
			if(!reciverenable) 	nextState = A;
			else 			nextState = B;	
		
		default:			nextState = A;
		
		
	endcase
	
	assign takeoff = (currentState == B);
  	assign landing	= (currentState == A);
endmodule

