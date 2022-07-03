// Settings (you can change these)
console_font = fnt_arial;
info_font = fnt_arial;
text_color = c_white;
history_color = c_dkgray;
border_width = 1;
border_color = c_black;

// Default debug info settings (you can change these)
if(!variable_global_exists("debug_info"))
	global.debug_info = {
		general: false,
		fps: false,
		history: false,
		audio: false,
		guidelines: false,
		// Default environment variables (you can change these)
		envvars: {}
	};

// Do not change these variables
randomize();
text = "";
history = [];
timer = 15;
fpscalc = 0;
if(asset_get_index("test_debug") != -1)
	if(room == test_debug) typeenable = true;
	else typeenable = false;
else typeenable = false;
