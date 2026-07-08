class_name FPSPlayerController

extends PlayerController

var _look_velocity:Vector2

const MOUSE_SENSISBILITY = 0.1

func _ready() -> void:
	
	_look_velocity = Vector2.ZERO

func _input(event:InputEvent):
	
	# InputEventMouseMotion is called when mouse is moving OR when a finger is dragged on the screen,
	# so we have to filter for mouse only 
	# TODO: Find a better way to filter out touch events
	if(control_device == ControlDevice.Keyboard and event is InputEventMouseMotion): 
		
		# Get camera orientation from mouse movement
		_look_velocity = event.screen_relative * MOUSE_SENSISBILITY

		return


func _process(delta:float) -> void:

	# TODO: Find a better way to filter out touch events
	if(control_device == ControlDevice.Touch):
		# Get joystick direction for camera orientation
		var input_dir:Vector2 = Input.get_vector("LookLeft", "LookRight", "LookUp", "LookDown")
		_look_velocity = input_dir


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#var mouse_velocity = Input.get_last_mouse_screen_velocity()
	
	#var mouse_position = get_viewport().get_mouse_position()
	#var mouse_velocity = _last_mouse_position - mouse_position
	
	# Rotate camera 
	rotate(transform.basis.y, _look_velocity.x * ROTATE_SPEED * delta)
	camera.rotate(camera.basis.x, _look_velocity.y * ROTATE_SPEED * delta)
	
	_look_velocity = Vector2.ZERO
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("MoveRight", "MoveLeft", "MoveBack", "MoveFront")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()





	
