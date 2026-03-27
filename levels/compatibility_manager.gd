extends Node3D

@export var xr_controls:XRControls
@export var desktop_controls:DesktopControls
@export var touch_controls:TouchControls

var xr_interface: XRInterface

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var device_name:String = OS.get_name()
			
	print(device_name)
			
	match(device_name):
		
		"Windows":
			_init_generic()
		
		"Android":
			_init_android()	
		
		"Web":
			_init_web()
		
			
func _init_generic() -> void:
	
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		# Init OpenXR #####################################	
		print(xr_interface.get_name())
		_init_openXR()
		
	else:
		# Init Deskop Mode ###############################
		_init_desktop()
		
func _init_android() -> void:
	
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		# Init OpenXR #####################################	
		_init_openXR()
		
	else:
		# Init Touch Mode ###############################
		_init_smartphone()			
	

func _init_web() -> void:
	
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		# Init WebXR #####################################
		_init_webXR()
		
	else:
		# Init Deskop Mode ###############################
		_init_desktop()
		
				
func _init_webXR():
	
	#####################################################
	############### TODO ? ##############################
	#####################################################
	
	pass
		
		
func _init_openXR():
	
	print ("OpenXR initialized successfully, launching XR controls")
	
	# Destroy other implementations
	desktop_controls.queue_free()	
	touch_controls.queue_free()
	
	# Turn off v-sync as it usually lowers framerate 
	# and is performed by XR interfaces on its own
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

	# Set HMD as main viewport
	get_viewport().use_xr = true
		
	# xr_interface.environment_blend_mode = XRInterface.XR_ENV_BLEND_MODE_ALPHA_BLEND
	# get_last_exclusive_window().transparent_bg = true	
	# var enviro:Environment = $WorldEnvironment.environment
	# enviro.background_mode = Environment.BG_COLOR
	# enviro.background_color = Color(0.0, 0.0, 0.0, 0.0)
	# enviro.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	

func _init_desktop():
	
	print("No OpenXR device detected, launching desktop controls")
	
	# Destroy other implementations
	xr_controls.queue_free()
	touch_controls.queue_free()
	
	desktop_controls.enable_controls()


func _init_smartphone():
	
	print("No OpenXR device detected, launching touch controls")
	
	# Destroy other implementations
	desktop_controls.queue_free()
	xr_controls.queue_free()

	touch_controls.enable_controls()

	
