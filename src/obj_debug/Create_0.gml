if(!variable_global_exists("debug_info"))
	global.debug_info = {
		general: false,
		audio: false,
		guidelines: false
	};

randomize();
text = "";
history = [];
timer = 15;
fpscalc = 0;
if(asset_get_index("test_debug") != -1)
	if(room == test_debug) typeenable = true;
	else typeenable = false;
else typeenable = false;

// Settings
consoleFont = fnt_arial;
infoFont = fnt_arial;
textColor = c_white;
historyColor = c_dkgray;