extends Node2D

@export var grid_size: float = 64.0
@export var dot_radius: float = 2.0
@export var dot_color: Color = Color(0.2, 0.2, 0.3, 0.5)

# Optional: Make it parallax or follow the player slightly
@export var follow_camera: bool = true

func _process(_delta: float) -> void:
	# Redraw every frame so it updates relative to camera movement
	queue_redraw()

func _draw() -> void:
	var cam := get_viewport().get_camera_2d()
	var top_left := Vector2.ZERO
	var screen_size := get_viewport_rect().size
	
	if cam:
		# Center the grid drawing around the camera's current position
		top_left = cam.get_screen_center_position() - (screen_size / 2.0)
	else:
		top_left = global_position
		
	# Find the starting grid alignment point based on camera position
	var start_x = floor(top_left.x / grid_size) * grid_size
	var start_y = floor(top_left.y / grid_size) * grid_size
	
	var end_x = top_left.x + screen_size.x + grid_size
	var end_y = top_left.y + screen_size.y + grid_size
	
	# Draw dots or grid lines at regular intervals
	var x = start_x
	while x < end_x:
		var y = start_y
		while y < end_y:
			draw_circle(Vector2(x, y), dot_radius, dot_color)
			y += grid_size
		x += grid_size
