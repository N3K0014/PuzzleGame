extends Node

var i = 1

func Next() -> void:
	i += 1
	get_tree().change_scene_to_file("res://Scenes/Levels/level_"+ str(i) +".tscn")
	print("scene",i)
