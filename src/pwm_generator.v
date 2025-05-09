
module pwm_generator(
    input wire clk,

    input wire pwm_en,
    input wire [31:0] pwm_frequency,   //pwm frekansı, örneğin 50 Hz
    input wire [7:0] duty_cycle,      //yüzde olarak pwm duty cycle
    
    output reg pwm_out
    );
    
    reg [31:0] duty_cycle_period = 0;
    reg [31:0] period_counter = 0;
    reg [31:0] period;
    reg pwm_startFlag = 0;
    
    always@(posedge clk) begin
        if (pwm_en) begin
            if(pwm_startFlag) begin
                period_counter = period_counter + 1;
                if(period_counter <= duty_cycle_period) pwm_out = 1'b1;
                else pwm_out = 1'b0;
                if(period_counter == (period)) period_counter = 0;
            end
            else begin
                period_counter = 0;
                period = 32'b0010111110101111000010000000 / pwm_frequency; //clk_freq(50MHz) / frequency = period
                duty_cycle_period = (period * duty_cycle) / 100;
                pwm_startFlag = 1;
            end 
        end
        else pwm_startFlag = 0;
    end
    
endmodule
