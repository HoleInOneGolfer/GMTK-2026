extends CanvasLayer

@export var hud_node: Control
@export var menu_node: Control
@export var timer_label: Label

@export var round_duration: float = 60.0

var time_left: float = 0.0
var round_active: bool = false

func _ready() -> void:
	end_round()

func _process(delta: float) -> void:
	if not round_active:
		return
		
	time_left = max(0.0, time_left - delta)
	_update_hud_display()
	
	if time_left <= 0.0:
		end_round()

func start_new_round() -> void:
	time_left = round_duration
	round_active = true
	_set_ui_state(true)

func end_round() -> void:
	round_active = false
	_set_ui_state(false)

func _set_ui_state(in_game: bool) -> void:
	if hud_node: hud_node.visible = in_game
	if menu_node: menu_node.visible = not in_game
	get_tree().paused = not in_game

func _update_hud_display() -> void:
	if not timer_label:
		return
		
	var seconds = floori(time_left)
	var milliseconds = floori((time_left - seconds) * 100)
	timer_label.text = "%02d:%02d" % [seconds, milliseconds]
