/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
module tt_um_kayra_pwm_generator (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire clk_en;
    wire pwm_out;
    wire pwm_en;    
    wire [31:0] pwm_frequency;
    wire [7:0] duty_cycle;
    
    assign duty_cycle = ui_in;
    
    assign pwm_en = !rst_n;
    assign pwm_frequency = 50000000;
    
    assign uo_out [7:1] = 0;
    assign uo_out [0] = pwm_out;
    assign uio_out = 0;
    assign uio_oe = 8'b11111111;
    
    //assign clk_en = ena ? clk : 0;
    
    pwm_generator u_pwm_generator (clk, pwm_en, pwm_frequency, duty_cycle, pwm_out);

   
endmodule
