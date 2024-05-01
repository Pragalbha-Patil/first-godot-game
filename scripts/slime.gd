extends Node2D

const SPEED = 55

var direction = 1
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer
@onready var kill_sound = $AudioStreamPlayer2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(ray_cast_right) and ray_cast_right.is_colliding():
		animated_sprite.flip_h = true
		direction = -1

	if is_instance_valid(ray_cast_left) and ray_cast_left.is_colliding():
		animated_sprite.flip_h = false
		direction = 1

	position.x += delta * SPEED * direction


func _on_tree_exiting():
	kill_sound.play()
	animated_sprite.play("killed")
	timer.start()

func _on_timer_timeout():
	self.queue_free()
