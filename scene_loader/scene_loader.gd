extends Node

@export var scene_paths: Array[PackedScene]

func load_level(index: int):
	get_tree().change_scene_to_packed(scene_paths[index])

func restart_level():
	get_tree().reload_current_scene()
