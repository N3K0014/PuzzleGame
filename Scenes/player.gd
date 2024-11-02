extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var timer: Timer = $Timer

var playermoving

var inputs = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT}

func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
		else:
			playermoving == false
func move(dir):
	position += inputs[dir] * 16
	playermoving == true

func _on_timer_timeout() -> void:
	if playermoving == false:
		player_sprite.play("Idle")
