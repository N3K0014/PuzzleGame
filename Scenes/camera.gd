extends Camera2D

func _on_confirmation_dialog_confirmed() -> void:
	get_tree().quit()
