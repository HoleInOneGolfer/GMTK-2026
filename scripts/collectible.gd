extends Area2D

enum Type { TREASURE, HAZARD }
@export var item_type: Type = Type.TREASURE
@export var point_value: int = 10

func _ready() -> void:
	add_to_group("collectibles")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if item_type == Type.HAZARD:
		if body.has_method("die"):
			body.die()
		else:
			GameManager.score = max(0, GameManager.score - abs(point_value))
	else:
		GameManager.score += point_value
		
	queue_free()
