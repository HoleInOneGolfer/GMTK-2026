extends CharacterBody2D

@export var forward_speed: float = 300.0
@export var backward_speed_multiplier: float = 0.33
@export var strafe_speed_multiplier: float = 0.44

func _physics_process(delta: float) -> void:
	# 1. Look at the mouse cursor
	look_at(get_global_mouse_position())
	
	# 2. Get raw inputs (-1 to 1)
	var forward_backward := Input.get_axis("move_forward", "move_backward")
	var left_right := Input.get_axis("move_left", "move_right")
	
	# 3. Apply individual speed multipliers
	# Note: moving forward yields a negative axis value with get_axis("move_forward", "move_backward")
	var current_forward_speed = 0.0
	if forward_backward < 0:
		current_forward_speed = forward_speed # Moving forward
	elif forward_backward > 0:
		current_forward_speed = forward_speed * backward_speed_multiplier # Moving backward
		
	var current_strafe_speed = forward_speed * strafe_speed_multiplier
	
	# 4. Build the relative movement vector
	var move_dir = Vector2.ZERO
	move_dir += transform.x * (-forward_backward * (forward_speed if forward_backward < 0 else (forward_speed * backward_speed_multiplier))) / forward_speed
	move_dir += transform.y * (left_right * current_strafe_speed) / forward_speed
	
	# A cleaner way to apply directional multipliers:
	var final_velocity = Vector2.ZERO
	if forward_backward < 0:
		final_velocity += transform.x * -forward_backward * forward_speed
	elif forward_backward > 0:
		final_velocity += transform.x * -forward_backward * (forward_speed * backward_speed_multiplier)
		
	final_velocity += transform.y * left_right * (forward_speed * strafe_speed_multiplier)
	
	velocity = final_velocity
	move_and_slide()
