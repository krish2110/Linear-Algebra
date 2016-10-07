`timescale 1us / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:56 10/07/2016 
// Design Name: 
// Module Name:    Matrix_Inverse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Matrix_Inverse(clk, reset, data_out, address, I11,I12,I13,I14,I15,I21,I22,I23,I24,I25,I31,I32,I33,I34,I35,I41,I42,I43,I44,I45,I51,I52,I53,I54,I55,I11d,I12d,I13d,I14d,I15d,I21d,I22d,I23d,I24d,I25d,I31d,I32d,I33d,I34d,I35d,I41d,I42d,I43d,I44d,I45d,I51d,I52d,I53d,I54d,I55d);

input clk;
input reset;
input [4:0] address;

output [31:0] I11d, I12d, I13d, I14d, I15d;
output [31:0] I21d, I22d, I23d, I24d, I25d;
output [31:0] I31d, I32d, I33d, I34d, I35d;
output [31:0] I41d, I42d, I43d, I44d, I45d;
output [31:0] I51d, I52d, I53d, I54d, I55d;

output reg [31:0] I11, I12, I13, I14, I15;
output reg [31:0] I21, I22, I23, I24, I25;
output reg [31:0] I31, I32, I33, I34, I35;
output reg [31:0] I41, I42, I43, I44, I45;
output reg [31:0] I51, I52, I53, I54, I55;

output [31:0] data_out;

reg [31:0] matrix[0:25];
reg [31:0] inverse[0:24];

reg [31:0] data_in11, data_in12, data_in13, data_in14, data_in15;
reg [31:0] data_in21, data_in22, data_in23, data_in24, data_in25;
reg [31:0] data_in31, data_in32, data_in33, data_in34, data_in35;
reg [31:0] data_in41, data_in42, data_in43, data_in44, data_in45;
reg [31:0] data_in51, data_in52, data_in53, data_in54, data_in55;

reg [31:0] I11t = 32'd1;
reg [31:0] I12t = 32'd0;
reg [31:0] I13t = 32'd0;
reg [31:0] I14t = 32'd0;
reg [31:0] I15t = 32'd0;

reg [31:0] I21t = 32'd0;
reg [31:0] I22t = 32'd1;
reg [31:0] I23t = 32'd0;
reg [31:0] I24t = 32'd0;
reg [31:0] I25t = 32'd0;

reg [31:0] I31t = 32'd0;
reg [31:0] I32t = 32'd0;
reg [31:0] I33t = 32'd1;
reg [31:0] I34t = 32'd0;
reg [31:0] I35t = 32'd0;

reg [31:0] I41t = 32'd0;
reg [31:0] I42t = 32'd0;
reg [31:0] I43t = 32'd0;
reg [31:0] I44t = 32'd1;
reg [31:0] I45t = 32'd0;

reg [31:0] I51t = 32'd0;
reg [31:0] I52t = 32'd0;
reg [31:0] I53t = 32'd0;
reg [31:0] I54t = 32'd0;
reg [31:0] I55t = 32'd1;

reg [31:0] ans_temp11, ans_temp12, ans_temp13, ans_temp14, ans_temp15, ans_temp21, ans_temp22, ans_temp23, ans_temp24, ans_temp25, ans_temp31, ans_temp32, ans_temp33, ans_temp34, ans_temp35, ans_temp41, ans_temp42, ans_temp43, ans_temp44, ans_temp45, ans_temp51, ans_temp52, ans_temp53t, ans_temp54t, ans_temp55t;

reg [31:0] x;
reg [31:0] y;

Matrix_Invrse_IPcore M(
  .clka(clk), // input clka
  .addra(address), // input [4 : 0] addra
  .douta(data_out) // output [31 : 0] douta
);


always@(posedge clk)
begin

if(reset == 1'b0)
begin
	matrix[address] <= data_out;
end

else
begin

data_in11 = matrix[1];
data_in12 = matrix[2];
data_in13 = matrix[3];
data_in14 = matrix[4];
data_in15 = matrix[5];

data_in21 = matrix[6];
data_in22 = matrix[7];
data_in23 = matrix[8];
data_in24 = matrix[9];
data_in25 = matrix[10];

data_in31 = matrix[11];
data_in32= matrix[12];
data_in33= matrix[13];
data_in34 = matrix[14];
data_in35 = matrix[15];

data_in41 = matrix[16];
data_in42 =  matrix[17];
data_in43 = matrix[18];
data_in44 = matrix[19];
data_in45 = matrix[20];

data_in51 = matrix[21];
data_in52 = matrix[22];
data_in53 = matrix[23];
data_in54 = matrix[24];
data_in55 = matrix[25];

ans_temp11 = (data_in11 > 0 ? data_in11 : (~data_in11+32'd1));
ans_temp12 = (data_in12 > 0 ? data_in12 : (~data_in12+32'd1));
ans_temp13 = (data_in13 > 0 ? data_in13 : (~data_in13+32'd1));
ans_temp14 = (data_in14 > 0 ? data_in14 : (~data_in14+32'd1));
ans_temp15 = (data_in15 > 0 ? data_in15 : (~data_in15+32'd1));

ans_temp21 = (data_in21 > 0 ? data_in21 : (~data_in21 + 32'd1));
ans_temp22 = (data_in22 > 0 ? data_in22 : (~data_in22 + 32'd1));
ans_temp23 = (data_in23 > 0 ? data_in23 : (~data_in23 + 32'd1));
ans_temp24 = (data_in24 > 0 ? data_in24 : (~data_in24 + 32'd1));
ans_temp25 = (data_in25 > 0 ? data_in25 : (~data_in25 + 32'd1));

ans_temp31 = (data_in31 > 0 ? data_in31 : (~data_in31 + 32'd1));
ans_temp32 = (data_in32 > 0 ? data_in32 : (~data_in32 + 32'd1));
ans_temp33 = (data_in33 > 0 ? data_in33 : (~data_in33 + 32'd1));
ans_temp34 = (data_in34 > 0 ? data_in34 : (~data_in34 + 32'd1));
ans_temp35 = (data_in35 > 0 ? data_in35 : (~data_in35 + 32'd1));

ans_temp41 = (data_in41 > 0 ? data_in41 : (~data_in41+32'd1));
ans_temp42 = (data_in42 > 0 ? data_in42 : (~data_in42+32'd1));
ans_temp43 = (data_in43 > 0 ? data_in43 : (~data_in43+32'd1));
ans_temp44 = (data_in44 > 0 ? data_in44 : (~data_in44+32'd1));
ans_temp45 = (data_in45 > 0 ? data_in45 : (~data_in45+32'd1));

ans_temp51 = (data_in51 > 0 ? data_in51 : (~data_in51+32'd1));
ans_temp52 = (data_in52 > 0 ? data_in52 : (~data_in52+32'd1));
ans_temp53t = (data_in53 > 0 ? data_in53 : (~data_in53+32'd1));
ans_temp54t = (data_in54 > 0 ? data_in54 : (~data_in54+32'd1));
ans_temp55t = (data_in55 > 0 ? data_in55 : (~data_in55+32'd1));

x = ans_temp11;
y = ans_temp21;
ans_temp21 = x * ans_temp21 - y * ans_temp11;
ans_temp22 = x * ans_temp22 - y * ans_temp12;
ans_temp23 = x * ans_temp23 - y * ans_temp13;
ans_temp24 = x * ans_temp24 - y * ans_temp14;
ans_temp25 = x * ans_temp25 - y * ans_temp15;
I21t = x * I21t - y * I11t;
I22t = x * I22t - y * I12t;
I23t = x * I23t - y * I13t;
I24t = x * I24t - y * I14t;
I25t = x * I25t - y * I15t;

x = ans_temp11;
y = ans_temp31;
ans_temp31 = x * ans_temp31 - y * ans_temp11;
ans_temp32 = x * ans_temp32 - y * ans_temp12;
ans_temp33 = x * ans_temp33 - y * ans_temp13;
ans_temp34 = x * ans_temp34 - y * ans_temp14;
ans_temp35 = x * ans_temp35 - y * ans_temp15;
I31t = x * I31t - y * I11t;
I32t = x * I32t - y * I12t;
I33t = x * I33t - y * I13t;
I34t = x * I34t - y * I14t;
I35t = x * I35t - y * I15t;

x = ans_temp11;
y = ans_temp41;
ans_temp41 = x * ans_temp41 - y * ans_temp11;
ans_temp42 = x * ans_temp42 - y * ans_temp12;
ans_temp43 = x * ans_temp43 - y * ans_temp13;
ans_temp44 = x * ans_temp44 - y * ans_temp14;
ans_temp45 = x * ans_temp45 - y * ans_temp15;
I41t = x * I41t - y * I11t;
I42t = x * I42t - y * I12t;
I43t = x * I43t - y * I13t;
I44t = x * I44t - y * I14t;
I45t = x * I45t - y * I15t;

x = ans_temp11;
y = ans_temp51;
ans_temp51 = x * ans_temp51 - y * ans_temp11;
ans_temp52 = x * ans_temp52 - y * ans_temp12;
ans_temp53t = x * ans_temp53t - y * ans_temp13;
ans_temp54t = x * ans_temp54t - y * ans_temp14;
ans_temp55t = x * ans_temp55t - y * ans_temp15;
I51t = x * I51t - y * I11t;
I52t = x * I52t - y * I12t;
I53t = x * I53t - y * I13t;
I54t = x * I54t - y * I14t;
I55t = x * I55t - y * I15t;

x = ans_temp22;
y = ans_temp12;
ans_temp11 = x * ans_temp11 - y * ans_temp21;
ans_temp12 = x * ans_temp12 - y * ans_temp22;
ans_temp13 = x * ans_temp13 - y * ans_temp23;
ans_temp14 = x * ans_temp14 - y * ans_temp24;
ans_temp15 = x * ans_temp15 - y * ans_temp25;
I11t = x * I11t - y * I21t;
I12t = x * I12t - y * I22t;
I13t = x * I13t - y * I23t;
I14t = x * I14t - y * I24t;
I15t = x * I15t - y * I25t;

x = ans_temp22;
y = ans_temp32;
ans_temp31 = x * ans_temp31 - y * ans_temp21;
ans_temp32 = x * ans_temp32 - y * ans_temp22;
ans_temp33 = x * ans_temp33 - y * ans_temp23;
ans_temp34 = x * ans_temp34 - y * ans_temp24;
ans_temp35 = x * ans_temp35 - y * ans_temp25;
I31t = x * I31t - y * I21t;
I32t = x * I32t - y * I22t;
I33t = x * I33t - y * I23t;
I34t = x * I34t - y * I24t;
I35t = x * I35t - y * I25t;

x = ans_temp22;
y = ans_temp42;
ans_temp41 = x * ans_temp41 - y * ans_temp21;
ans_temp42 = x * ans_temp42 - y * ans_temp22;
ans_temp43 = x * ans_temp43 - y * ans_temp23;
ans_temp44 = x * ans_temp44 - y * ans_temp24;
ans_temp45 = x * ans_temp45 - y * ans_temp25;
I41t = x * I41t - y * I21t;
I42t = x * I42t - y * I22t;
I43t = x * I43t - y * I23t;
I44t = x * I44t - y * I24t;
I45t = x * I45t - y * I25t;

x = ans_temp22;
y = ans_temp52;
ans_temp51 = x * ans_temp51 - y * ans_temp21;
ans_temp52 = x * ans_temp52 - y * ans_temp22;
ans_temp53t = x * ans_temp53t - y * ans_temp23;
ans_temp54t = x * ans_temp54t - y * ans_temp24;
ans_temp55t = x * ans_temp55t - y * ans_temp25;
I51t = x * I51t - y * I21t;
I52t = x * I52t - y * I22t;
I53t = x * I53t - y * I23t;
I54t = x * I54t - y * I24t;
I55t = x * I55t - y * I25t;

x = ans_temp33;
y = ans_temp13;
ans_temp11 = x * ans_temp11 - y * ans_temp31;
ans_temp12 = x * ans_temp12 - y * ans_temp32;
ans_temp13 = x * ans_temp13 - y * ans_temp33;
ans_temp14 = x * ans_temp14 - y * ans_temp34;
ans_temp15 = x * ans_temp15 - y * ans_temp35;
I11t = x * I11t - y * I31t;
I12t = x * I12t - y * I32t;
I13t = x * I13t - y * I33t;
I14t = x * I14t - y * I34t;
I15t = x * I15t - y * I35t;

x = ans_temp33;
y = ans_temp23;
ans_temp21 = x * ans_temp21 - y * ans_temp31;
ans_temp22 = x * ans_temp22 - y * ans_temp32;
ans_temp23 = x * ans_temp23 - y * ans_temp33;
ans_temp24 = x * ans_temp24 - y * ans_temp34;
ans_temp25 = x * ans_temp25 - y * ans_temp35;
I21t = x * I21t - y * I31t;
I22t = x * I22t - y* I32t;
I23t = x * I23t - y * I33t;
I24t = x * I24t - y * I34t;
I25t = x * I25t - y * I35t;

x = ans_temp33;
y = ans_temp43;
ans_temp41 = x * ans_temp41 - y * ans_temp31;
ans_temp42 = x * ans_temp42 - y * ans_temp32;
ans_temp43 = x * ans_temp43 - y * ans_temp33;
ans_temp44 = x * ans_temp44 - y * ans_temp34;
ans_temp45 = x * ans_temp45 - y * ans_temp35;
I41t = x * I41t - y * I31t;
I42t = x * I42t - y * I32t;
I43t = x * I43t - y * I33t;
I44t = x * I44t - y * I34t;
I45t = x * I45t - y * I35t;

x = ans_temp33;
y = ans_temp53t;
ans_temp51 = x * ans_temp51 - y * ans_temp31;
ans_temp52 = x * ans_temp52 - y * ans_temp32;
ans_temp53t = x * ans_temp53t - y * ans_temp33;
ans_temp54t = x * ans_temp54t - y * ans_temp34;
ans_temp55t = x * ans_temp55t - y * ans_temp35;
I51t = x * I51t - y * I31t;
I52t = x * I52t - y * I32t;
I53t = x * I53t - y * I33t;
I54t = x * I54t - y * I34t;
I55t = x * I55t - y * I35t;

x = ans_temp44;
y = ans_temp14;
ans_temp11 = x * ans_temp11 - y * ans_temp41;
ans_temp12 = x * ans_temp12 - y * ans_temp42;
ans_temp13 = x * ans_temp13 - y * ans_temp43;
ans_temp14 = x * ans_temp14 - y * ans_temp44;
ans_temp15 = x * ans_temp15 - y * ans_temp45;
I11t = x * I11t - y * I41t;
I12t = x * I12t - y * I42t;
I13t = x * I13t - y *I43t;
I14t = x * I14t - y * I44t;
I15t = x * I15t - y * I45t;

x = ans_temp44;
y = ans_temp24;
ans_temp21 = x * ans_temp21 - y * ans_temp41;
ans_temp22 = x * ans_temp22 - y * ans_temp42;
ans_temp23 = x * ans_temp23 - y * ans_temp43;
ans_temp24 = x * ans_temp24 - y * ans_temp44;
ans_temp25 = x * ans_temp25 - y * ans_temp45;
I21t = x * I21t - y * I41t;
I22t = x * I22t - y * I42t;
I23t = x * I23t - y * I43t;
I24t = x * I24t - y * I44t;
I25t = x * I25t - y * I45t;

x = ans_temp44;
y = ans_temp34;
ans_temp31 = x * ans_temp31 - y * ans_temp41;
ans_temp32 = x * ans_temp32 - y * ans_temp42;
ans_temp33 = x * ans_temp33 - y * ans_temp43;
ans_temp34 = x * ans_temp34 - y * ans_temp44;
ans_temp35 = x * ans_temp35 - y * ans_temp45;
I31t = x * I31t - y * I41t;
I32t = x * I32t - y * I42t;
I33t = x * I33t - y * I43t;
I34t = x * I34t - y * I44t;
I35t = x * I35t - y * I45t;

x = ans_temp44;
y = ans_temp54t;
ans_temp51 = x * ans_temp51 - y * ans_temp41;
ans_temp52 = x * ans_temp52 - y * ans_temp42;
ans_temp53t = x * ans_temp53t - y * ans_temp43;
ans_temp54t = x * ans_temp54t - y * ans_temp44;
ans_temp55t = x * ans_temp55t - y * ans_temp45;
I51t = x * I51t - y * I41t;
I52t = x * I52t - y * I42t;
I53t = x * I53t - y * I43t;
I54t = x * I54t - y * I44t;
I55t = x * I55t - y * I45t;

x = ans_temp55t;
y = ans_temp15;
ans_temp11 = x * ans_temp11 - y * ans_temp51;
ans_temp12 = x * ans_temp12 - y * ans_temp52;
ans_temp13 = x * ans_temp13 - y * ans_temp53t;
ans_temp14 = x * ans_temp14 - y * ans_temp54t;
ans_temp15 = x * ans_temp15 - y * ans_temp55t;
I11t = x * I11t - y * I51t;
I12t = x * I12t - y * I52t;
I13t = x * I13t - y * I53t;
I14t = x * I14t - y * I54t;
I15t = x * I15t - y * I55t;

x = ans_temp55t;
y = ans_temp25;
ans_temp21 = x * ans_temp21 - y * ans_temp51;
ans_temp22 = x * ans_temp22 - y * ans_temp52;
ans_temp23 = x * ans_temp23 - y * ans_temp53t;
ans_temp24 = x * ans_temp24 - y * ans_temp54t;
ans_temp25 = x * ans_temp25 - y * ans_temp55t;
I21t = x * I21t - y * I51t;
I22t = x * I22t - y * I52t;
I23t = x * I23t - y * I53t;
I24t = x * I24t - y * I54t;
I25t = x * I25t - y * I55t;

x = ans_temp55t;
y = ans_temp35;
ans_temp31 = x * ans_temp31 - y * ans_temp51;
ans_temp32 = x * ans_temp32 - y * ans_temp52;
ans_temp33 = x * ans_temp33 - y * ans_temp53t;
ans_temp34 = x * ans_temp34 - y * ans_temp54t;
ans_temp35 = x * ans_temp35 - y * ans_temp55t;
I31t = x * I31t - y * I51t;
I32t = x * I32t - y * I52t;
I33t = x * I33t - y * I53t;
I34t = x * I34t - y * I54t;
I35t = x * I35t - y * I55t;

x = ans_temp55t;
y = ans_temp45;
ans_temp41 = x * ans_temp41 - y * ans_temp51;
ans_temp42 = x * ans_temp42 - y * ans_temp52;
ans_temp43 = x * ans_temp43 - y * ans_temp53t;
ans_temp44 = x * ans_temp44 - y * ans_temp54t;
ans_temp45 = x * ans_temp45 - y * ans_temp55t;
I41t = x * I41t - y * I51t;
I42t = x * I42t - y * I52t;
I43t = x * I43t - y * I53t;
I44t = x * I44t - y * I54t;
I45t = x * I45t - y * I55t;

if(ans_temp11==32'd0 || ans_temp22 == 32'd0 || ans_temp33 == 32'd0 || ans_temp44==32'd0 || ans_temp55t==32'd0)
begin
	I11=32'dx;
	I22=32'dx;
	I33=32'dx;
	I44=32'dx;
	I55=32'dx;
end

else
begin
	I11 = I11t;
	I12 = I12t;
	I13 = I13t;
	I14 = I14t;
	I15 = I15t;

	I21 = I21t;
	I22 = I22t;
	I23 = I23t;
	I24 = I24t;
	I25 = I25t;

	I31 = I31t;
	I32 = I32t;
	I33 = I33t;
	I34 = I34t;
	I35 = I35t;

	I41 = I41t;
	I42 = I42t;
	I43 = I43t;
	I44 = I44t;
	I45 = I45t;

	I51 = I51t;
	I52 = I52t;
	I53 = I53t;
	I54 = I54t;
	I55 = I55t;
end


inverse[0] = I11;
inverse[1] = I12;
inverse[2] = I13;
inverse[3] = I14;
inverse[4] = I15;

inverse[5] = I21;
inverse[6] = I22;
inverse[7] = I23;
inverse[8] = I24;
inverse[9] = I25;

inverse[10] = I31;
inverse[11] = I32;
inverse[12] = I33;
inverse[13] = I34;
inverse[14] = I35;

inverse[15] = I41;
inverse[16] = I42;
inverse[17] = I43;
inverse[18] = I44;
inverse[19] = I45;

inverse[20] = I51;
inverse[21] = I52;
inverse[22] = I53;
inverse[23] = I54;
inverse[24] = I55;

end

end

wire [31:0] I11dt,I12dt,I13dt,I14dt,I15dt;
wire [31:0] I21dt,I22dt,I23dt,I24dt,I25dt;
wire [31:0] I31dt,I32dt,I33dt,I34dt,I35dt;
wire [31:0] I41dt,I42dt,I43dt,I44dt,I45dt;
wire [31:0] I51dt,I52dt,I53dt,I54dt,I55dt;

assign I11d = I11;
assign I12d = I12;
assign I13d = I13;
assign I14d = I14;
assign I15d = I15;

assign I21d = I21;
assign I22d = I22;
assign I23d = I23;
assign I24d = I24;
assign I25d = I25;

assign I31d = I31;
assign I32d = I32;
assign I33d = I33;
assign I34d = I34;
assign I35d = I35;

assign I41d = I41;
assign I42d = I42;
assign I43d = I43;
assign I44d = I44;
assign I45d = I45;

assign I51d = I51;
assign I52d = I52;
assign I53d = I53;
assign I54d = I54;
assign I55d = I55;

wire [31:0] a,b,c,d,e;

assign a = ans_temp11;
assign b = ans_temp22;
assign c = ans_temp33;
assign d = ans_temp44;
assign e = ans_temp55t;

assign I11d = I11dt;
assign I12d = I12dt;
assign I13d = I13dt;
assign I14d = I14dt;
assign I15d = I15dt;

assign I21d = I21dt;
assign I22d = I22dt;
assign I23d = I23dt;
assign I24d = I24dt;
assign I25d = I25dt;

assign I31d = I31dt;
assign I32d = I32dt;
assign I33d = I33dt;
assign I34d = I34dt;
assign I35d = I35dt;

assign I41d = I41dt;
assign I42d = I42dt;
assign I43d = I43dt;
assign I44d = I44dt;
assign I45d = I45dt;

assign I51d = I51dt;
assign I52d = I52dt;
assign I53d = I53dt;
assign I54d = I54dt;
assign I55d = I55dt;

endmodule
