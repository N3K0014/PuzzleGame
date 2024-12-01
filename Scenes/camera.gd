extends Camera2D
	
func _process(delta: float) -> void:
	$Panel/Timer.text = "%02d:%02d" % update_timelabel()
	
func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_confirmation_dialog_confirmed() -> void:
	NextLevel.Next()

func _on_lose_dialog_confirmed() -> void:
	get_tree().reload_current_scene()
	
func update_timelabel():
	# script for Time needs to trigger a scene if time is 0 
	var time_left = $Timer.time_left
	var minute = floor(time_left / 60)
	var seconds = int(time_left) % 60
	return [minute, seconds]

func _on_timer_timeout() -> void:
	$LoseDialog.popup()


func _on_lose_dialog_canceled() -> void:
	get_tree().quit()


func _on_win_dialog_canceled() -> void:
	NextLevel.Next()
