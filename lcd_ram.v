module lcd(clk, rst, data, Lcd_e, Lcd_rs);
    input clk, rst;
    output [7:0] data; // LCD 8 BIT DATA
    output reg Lcd_e, Lcd_rs; // LCD ENABLE, REGISTER SELECT

    reg [7:0] Lcd_cmd; // LCD COMMAND 
    reg [19:0] state = 0;
    reg [19:0] count = 0; // state counter

    assign data = Lcd_cmd; // assigning Lcd command to 8-bit LCD data

    always @(posedge clk) begin
        if (rst) begin
            Lcd_e <= 0;
            Lcd_rs <= 0;
        end else begin
            case (state)
                // Power on Initialization (Same as your code)
                0: begin Lcd_e <= 0; Lcd_rs <= 0;
                    if (count == 750000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                1: begin Lcd_e <= 1; Lcd_cmd <= 8'h30;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                2: begin Lcd_e <= 0;
                    if (count == 250000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                3: begin Lcd_e <= 1; Lcd_cmd <= 8'h30;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                4: begin Lcd_e <= 0;
                    if (count == 8000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                5: begin Lcd_e <= 1; Lcd_cmd <= 8'h30;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                6: begin Lcd_e <= 0;
                    if (count == 8000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // Function Set
                7: begin Lcd_e <= 1; Lcd_cmd <= 8'h38;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                8: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                9: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // Entry Mode
                10: begin Lcd_e <= 1; Lcd_cmd <= 8'h06;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                11: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                12: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // Display On
                13: begin Lcd_e <= 1; Lcd_cmd <= 8'h0C;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                14: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                15: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // Clear Display
                16: begin Lcd_e <= 1; Lcd_cmd <= 8'h01;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                17: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                18: begin if (count == 82000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // Move Cursor to beginning
                19: begin Lcd_e <= 1; Lcd_cmd <= 8'h80;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                20: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                21: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // To Print the letter 'R'
                22: begin Lcd_e <= 1; Lcd_rs <= 1; Lcd_cmd <= 8'h52;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                23: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                24: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // To Print the letter 'A'
                25: begin Lcd_e <= 1; Lcd_rs <= 1; Lcd_cmd <= 8'h41;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                26: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                27: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // To Print the letter 'M'
                28: begin Lcd_e <= 1; Lcd_rs <= 1; Lcd_cmd <= 8'h4D;
                    if (count == 12) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                29: begin if (count == 12) begin Lcd_e <= 0; count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end
                30: begin if (count == 2000) begin count <= 0; state <= state + 1; end
                    else count <= count + 1;
                end

                // End of message
                default: begin
                    Lcd_e <= 0;
                    Lcd_rs <= 0;
                end
            endcase
        end
    end
endmodule
