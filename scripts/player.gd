extends CharacterBody2D

@export var forward_speed: float = 300.0
@export var backward_speed_multiplier: float = 0.33
@export var strafe_speed_multiplier: float = 0.44

func _ready() -> void:
	apply_size_upgrade()

func _physics_process(delta: float) -> void:
	# Keep size updated if upgrades happen during runtime
	apply_size_upgrade()
	
	# 1. Look at the mouse cursor
	look_at(get_global_mouse_position())
	
	# 2. Get raw inputs (-1 to 1)
	var forward_backward := Input.get_axis("move_forward", "move_backward")
	var left_right := Input.get_axis("move_left", "move_right")
	
	# Fetch the current global speed multiplier from GameManager
	var global_speed_mult = GameManager.get_player_speed_multiplier()
	
	# 3. Build velocity using cleaner approach + GameManager speed multiplier
	var final_velocity = Vector2.ZERO
	if forward_backward < 0:
		final_velocity += transform.x * -forward_backward * (forward_speed * global_speed_mult)
	elif forward_backward > 0:
		final_velocity += transform.x * -forward_backward * (forward_speed * backward_speed_multiplier * global_speed_mult)
		
	final_velocity += transform.y * left_right * (forward_speed * strafe_speed_multiplier * global_speed_mult)
	
	velocity = final_velocity
	move_and_slide()

func apply_size_upgrade() -> void:
	var size_mult = GameManager.get_player_size_multiplier()
	scale = Vector2.ONE * size_mult
