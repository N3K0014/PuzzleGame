extends Area2D

var occupied = false 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('ThirdBox'):
		occupied = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('ThirdBox'):
		occupied = false
