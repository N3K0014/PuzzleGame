extends Area2D

var occupied = false 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('SquareBox'):
		occupied = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('SquareBox'):
		occupied = false
