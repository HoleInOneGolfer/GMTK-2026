extends Node

func change_scene(path: String):
	# This just swaps the scene directly. 
	# You can add transition effects here later.
	get_tree().change_scene_to_file(path)
