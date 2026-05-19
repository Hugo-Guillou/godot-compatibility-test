class_name DesktopControls

extends Node3D

@export var player_controller:PlayerController

func enable_controls() -> void:
	
	player_controller.camera.current = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
