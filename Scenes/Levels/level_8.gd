extends Node2D

var game_end = false
var time = 180.0

func _ready() -> void:
	var timer = $Camera2D/Timer
	if timer != null:
		timer.wait_time = time
		timer.start()
	NextLevel.i = 8

func _process(delta: float) -> void:
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
				
		if spots == 0:
			$Camera2D/WinDialog.popup()
			game_end = true
