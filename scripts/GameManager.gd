extends Node

var score: int = 999

# Upgrade Levels
var speed_level: int = 1
var size_level: int = 1
var time_level: int = 1

# Upgrade Costs
var speed_cost: int = 10
var size_cost: int = 15
var time_cost: int = 20

# Stat multipliers or additive bonuses
func get_player_speed_multiplier() -> float:
	# Example: each level adds 15% speed
	return 1.0 + (speed_level - 1) * 0.15

func get_player_size_multiplier() -> float:
	# Example: each level increases size slightly (or decreases if that's the goal)
	return 1.0 + (size_level - 1) * 0.10

func get_bonus_time() -> float:
	# Example: total bonus seconds added to round duration based on time level
	return float((time_level - 1) * 5.0)

func can_afford(cost: int) -> bool:
	return score >= cost

func spend_score(cost: int) -> void:
	score -= cost
