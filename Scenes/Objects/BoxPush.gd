extends CharacterBody2D

@onready var ray = $RayCast2D

var playermoving
var grid_size = 16
var animation_speed = 3

var inputs = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT}

func move(dir):
	var vector_pos = inputs[dir] * grid_size
	ray.target_position = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween = create_tween()
		tween.tween_property(self, "position", position + inputs[dir] * grid_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		playermoving = true
		await tween.finished
		playermoving = false
		return true
	return false
