@tool
extends EditorPlugin


func _enable_plugin() -> void:
	
	# Popup for Project Setup ##################################################
	
	var setup_dialog = AcceptDialog.new()
	setup_dialog.title = "Setup For Cross Platform"
	setup_dialog.dialog_text = "Do you want to automatically setup your project for this plugin ?\n" + \
						 	   "The following settings will be changed :\n" + \
						 	   "    - OpenXR and XR Shaders\n" + \
						 	   "    - Input Map\n" + \
							   #"\n" +\
							   "They won't be reverted if you disable the plugin"
	setup_dialog.ok_button_text = "Yes"
	setup_dialog.add_cancel_button("No")
	setup_dialog.confirmed.connect(_on_setup_accepted)
	EditorInterface.popup_dialog_centered(setup_dialog)

func _on_setup_accepted():
	
	# Enable XR ################################################################
	
	ProjectSettings.set_setting("xr/openxr/enabled", true)
	ProjectSettings.set_setting("xr/openxr/startup_alert", false)
	ProjectSettings.set_setting("xr/shaders/enabled", true)
	
	# Set input map for desktop controller #####################################

	var move_front_key = InputEventKey.new()
	move_front_key.physical_keycode = KEY_W
	var input_move_front = {"deadzone": 0.2,"events":[move_front_key]}
	
	var move_left_key = InputEventKey.new()
	move_left_key.physical_keycode = KEY_A
	var input_move_left = {"deadzone": 0.2,"events":[move_left_key]}
	
	var move_back_key = InputEventKey.new()
	move_back_key.physical_keycode = KEY_S
	var input_move_back = {"deadzone": 0.2,"events":[move_back_key]}
	
	var move_right_key = InputEventKey.new()
	move_right_key.physical_keycode = KEY_D
	var input_move_right = {"deadzone": 0.2,"events":[move_right_key]}
	
	ProjectSettings.set_setting("input/MoveFront", input_move_front)
	ProjectSettings.set_setting("input/MoveLeft", input_move_left)
	ProjectSettings.set_setting("input/MoveRight", input_move_right)
	ProjectSettings.set_setting("input/MoveBack", input_move_back)
	
	# Set input map for touch controller #######################################
	
	var input_look = {"deadzone":0.2,"events":[]}
	
	ProjectSettings.set_setting("input/LookUp", input_look)
	ProjectSettings.set_setting("input/LookLeft", input_look)
	ProjectSettings.set_setting("input/LookRight", input_look)
	ProjectSettings.set_setting("input/LookBack", input_look)
	
	# Set Export Presets #######################################################
	
	
	
	# Popup Window for Restart ########################################################
	
	var restart_dialog = AcceptDialog.new()
	restart_dialog.title = "Restart Editor"
	restart_dialog.dialog_text = "The editor need to resart for the new settings to be applied.\n" + \
						 	   "Do you want to restart now ?"
	restart_dialog.ok_button_text = "Yes"
	restart_dialog.add_cancel_button("No")
	restart_dialog.confirmed.connect(_on_restart_accepted)
	EditorInterface.popup_dialog_centered(restart_dialog)
	
	############################################################################
	
func _on_restart_accepted():
	EditorInterface.restart_editor(true)

#func _disable_plugin() -> void:
	## Disable XR ?
	#ProjectSettings.set_setting("xr/openxr/enabled", false)
	#ProjectSettings.set_setting("xr/openxr/startup_alert", true)
	#ProjectSettings.set_setting("xr/shaders/enabled", false)
