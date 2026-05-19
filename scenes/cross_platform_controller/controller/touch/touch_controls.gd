class_name TouchControls

extends Node3D

@export var player_controller:PlayerController

# Called when the node enters the scene tree for the first time.
func enable_controls() -> void:

	player_controller.camera.current = true

