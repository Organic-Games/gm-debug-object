draw_set_font(consoleFont);
draw_set_color(textColor);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_transformed(x, y, text, 1, 1, 0);
draw_set_color(historyColor);

var ii = 0;
for(i = array_length(history); i > 0; i--;) {
	ii++;
	draw_text_transformed(x, y + (ii) * string_height("A"), history[i - 1], 1, 1, 0);
}

if(global.debug_info.general) {
	draw_set_font(infoFont);
	draw_set_color(textColor);
	var str = "FPS: " + string(ceil(fpscalc));
	if(asset_get_index("draw_text_outline") != -1)
		draw_text_outline(10, room_height - 10 - string_height(str), str, c_dkgray, c_white, 1, 1, 3);
	else
		draw_text(10, room_height - 10 - string_height(str), "FPS: " + string(ceil(fpscalc)));
}

if(global.debug_info.guidelines){
	draw_line_color(room_width / 2, 0, room_width / 2, room_height, c_red, c_red);
	draw_line_color(0, room_height / 2, room_width, room_height / 2, c_red, c_red);
	
	draw_line_color(room_width / 3, 0, room_width / 3,room_height, c_green, c_green);
	draw_line_color(2 * room_width / 3, 0, 2 * room_width / 3 , room_height, c_green, c_green);
	draw_line_color(0, room_height / 3, room_width, room_height / 3, c_green, c_green);
	draw_line_color(0, 2 * room_height / 3, room_width, 2 * room_height / 3, c_green, c_green);
	
	draw_line_color(room_width / 4, 0, room_width / 4, room_height, c_purple, c_purple);
	draw_line_color(3 * room_width / 4, 0, 3 * room_width / 4, room_height, c_purple, c_purple);
	draw_line_color(0, room_height / 4, room_width, room_height / 4, c_purple, c_purple);
	draw_line_color(0, 3 * room_height / 4, room_width, 3 * room_height / 4, c_purple, c_purple);
}
