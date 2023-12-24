`timescale 1ns/1ns

module DroneFSM_TB;
  
	logic clk;
  	logic reset;
	logic gyrocheck;
	logic reciverenable;
	logic takeoff;
	logic landing;

	DroneFSM dut( 
	.clk(clk),
	.reset(reset),
	.gyrocheck(gyrocheck),
	.reciverenable(reciverenable),
	.takeoff(takeoff),
	.landing(landing)
	);

initial  
begin

	reset <= 1; 
	#2;
	
	reset <= 0;
	gyrocheck <= 0;
	reciverenable <= 0;
	 #10;
	 
	gyrocheck <= 1;
	reciverenable <= 0;
	 #10;
	 
	gyrocheck <= 0;
	reciverenable<= 1;
	 #10;
	 
	gyrocheck <= 1;
	reciverenable<= 1;
	 #20;
	
	gyrocheck <= 0;
	reciverenable <= 1;
	#20;
	
	gyrocheck <= 1;
	reciverenable <= 0;
	#10;
	
	gyrocheck <= 0;
	reciverenable <= 0;
	#10 $stop;
	end
    always
    	begin
		clk <= 1;
		#5;
       		clk <= 0;
		#5;
    end

 endmodule