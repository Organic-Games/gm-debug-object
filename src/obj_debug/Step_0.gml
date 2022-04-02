// FPS
timer = (timer + 1) & 15if(timer == 15 and global.debug_info) fpscalc = string(ceil(fps_real));

if(typeenable) {
	
// Type
if(keyboard_check(vk_anykey) and !keyboard_check(vk_backspace) and !keyboard_check(vk_enter)) {
	text = text+string(keyboard_string);
	keyboard_string = "";
}

// Delete
if(keyboard_check_pressed(vk_backspace)) {
	text = string_delete(text, string_length(text), 1);	
	keyboard_string = "";
}

// History
if(keyboard_check_pressed(vk_up)) {
	text=history[array_length(history) - 1];
}

// Commands
if(keyboard_check_pressed(vk_enter)) {
	if(string_pos("RM:", text) != 0)
		room_goto(asset_get_index(string_replace(text, "RM:", "")));
	
	if(string_pos("AUD:", text) != 0) {
		audio_stop_all();
		audio_play_sound(asset_get_index(string_replace(text, "AUD:", "")), 0, false);
	}
	
	if(string_pos("OBJ:", text) != 0)
		instance_create_depth(room_width / 2, room_height / 2, 0, asset_get_index(string_replace(text, "OBJ:", "")));
		
	switch(text) {
		case "#LoadMusic":
		audio_group_load(audiogroup_music);
		break;
		
		case "#LoadSfx":
		audio_group_load(audiogroup_sfx);
		break;
		
		case "#LoadAud":
		audio_group_load(audiogroup_sfx);
		audio_group_load(audiogroup_music);
		break;
		
		case "#UnloadMusic":
		audio_group_unload(audiogroup_music);
		break;
		
		case "#UnloadSfx":
		audio_group_unload(audiogroup_sfx);
		break;
		
		case "#UnloadAud":
		audio_group_unload(audiogroup_sfx);
		audio_group_unload(audiogroup_music);
		break;
		
		case "#StopAud":
		audio_stop_all();
		break;
		
		case "#ClearHistory":
		history = [];
		break;
		
		case "#ExportHistory":
		var file = file_text_open_write("debug_export/debugExport_" + string(get_timer() / 1000000) + ".txt");
		for(i=array_length(history); i > 0; i--;) {
			file_text_write_string(file, history[i - 1] + "\n");
		}
		file_text_close(file);
		break;
		
		case "#ToggleDebugInfo":
		global.debug_info.general = global.debug_info.general ^ 1;
		show_debug_overlay(global.debug_info.general);
		break;
		
		case "#ToggleAudioDebugInfo":
		global.debug_info.audio = global.debug_info.audio ^ 1;
		audio_debug(global.debug_info.audio);
		break;
		
		case "#ToggleGuidelines":
		global.debug_info.guidelines = global.debug_info.guidelines ^ 1;
		break;

	}
	if(text != "#ClearHistory") history[array_length(history)] = text;
	text = "";
	keyboard_string = "";
}

}

// Enable/disable console
if(keyboard_check_pressed(vk_f3)) {
	keyboard_string = "";
	typeenable = typeenable ^ 1;
}