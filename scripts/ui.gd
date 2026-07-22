extends CanvasLayer

@export var hud_node: Control
@export var menu_node: Control
@export var timer_label: Label
@export var score_label: Label

@export var round_duration: float = 60.0

var time_left: float = 0.0
var round_active: bool = false

func _ready() -> void:
	end_round()

func _process(delta: float) -> void:
	# Always update the score label so the shop shows currency changes in real-time
	_update_hud_display()
	
	if not round_active:
		return
		
	time_left = max(0.0, time_left - delta)
	
	if time_left <= 0.0:
		end_round()

func start_new_round() -> void:
	time_left = round_duration + GameManager.get_bonus_time()
	round_active = true
	_set_ui_state(true)

func end_round() -> void:
	round_active = false
	_set_ui_state(false)

func _set_ui_state(in_game: bool) -> void:
	# HUD is always visible now, whether in-game or in the menu
	if hud_node: 
		hud_node.visible = true
		
	# Menu only shows when NOT in-game
	if menu_node: 
		menu_node.visible = not in_game
		
	# Pause the game tree when the menu is up, unpause when playing
	get_tree().paused = not in_game

func _update_hud_display() -> void:
	if score_label:
		score_label.text = str(GameManager.score)
		
	if timer_label and round_active:
		var seconds = floori(time_left)
		var milliseconds = floori((time_left - seconds) * 100)
		timer_label.text = "%02d:%02d" % [seconds, milliseconds]
