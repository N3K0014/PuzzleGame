extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var timer: Timer = $Timer
@onready var ray = $RayCast2D

var playermoving = false
var grid_size = 16
var animation_speed = 3

var inputs = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT}

func _unhandled_input(event: InputEvent) -> void:
	if playermoving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			
func move(dir):
	ray.target_position = inputs[dir] * grid_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween = create_tween()
		tween.tween_property(self, "position", position + inputs[dir] * grid_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		playermoving = true
		await tween.finished
		playermoving = false
		#player_sprite.play("SidePush")
		player_sprite.play("Sprite")
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			MovementSprite(dir)
			if await collider.move(dir):
				var tween = create_tween()
				tween.tween_property(self, "position", position + inputs[dir] * grid_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
				$PushBox.play()
				playermoving = true
				await tween.finished
				playermoving = false
				player_sprite.play("Sprite")

func MovementSprite(dir):
	if inputs[dir] == Vector2.RIGHT:  # Moving right
		$PlayerSprite.flip_h = false
		player_sprite.play("SidePush")
	elif inputs[dir] == Vector2.LEFT:  # Moving left
		$PlayerSprite.flip_h = true
		player_sprite.play("SidePush")
	elif inputs[dir] == Vector2.DOWN:
		player_sprite.play("DownPush")
	elif inputs[dir] == Vector2.UP:
		player_sprite.play("UPPush")

func _on_timer_timeout() -> void:
	if !playermoving:
		player_sprite.play("Idle")
	
