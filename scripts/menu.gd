extends Control

@export var start_button: Button
@export var how_to_play_button: Button
@export var credits_button: Button
@export var settings_button: Button

# Panel references for toggling views
@export var shop_panel: Control
@export var how_to_play_panel: Control
@export var credits_panel: Control
@export var settings_panel: Control

func _ready() -> void:
	_connect_buttons()
	# Start with shop or default view visible, sub-panels hidden
	_show_only_panel(shop_panel)

func _connect_buttons() -> void:
	if start_button:
		start_button.pressed.connect(_on_start_pressed)
	if how_to_play_button:
		how_to_play_button.pressed.connect(_on_how_to_play_pressed)
	if credits_button:
		credits_button.pressed.connect(_on_credits_pressed)
	if settings_button:
		settings_button.pressed.connect(_on_settings_pressed)

func _on_start_pressed() -> void:
	var ui_node = get_parent()
	if ui_node and ui_node.has_method("start_new_round"):
		ui_node.start_new_round()
	else:
		print_debug("Error: Parent UI node or start_new_round function not found!")

func _on_how_to_play_pressed() -> void:
	_toggle_panel(how_to_play_panel)

func _on_credits_pressed() -> void:
	_toggle_panel(credits_panel)

func _on_settings_pressed() -> void:
	_toggle_panel(settings_panel)

func _toggle_panel(target_panel: Control) -> void:
	if not target_panel:
		return
	# If the target is already visible, toggle back to the shop/default view. Otherwise, show it exclusively.
	if target_panel.visible:
		_show_only_panel(shop_panel)
	else:
		_show_only_panel(target_panel)

func _show_only_panel(active_panel: Control) -> void:
	if how_to_play_panel: how_to_play_panel.visible = (how_to_play_panel == active_panel)
	if credits_panel: credits_panel.visible = (credits_panel == active_panel)
	if settings_panel: settings_panel.visible = (settings_panel == active_panel)
