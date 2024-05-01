extends Area2D

@onready var timer = $Timer
@onready var kill_sound = $kill
@onready var collision_shape_2d = $CollisionShape2D
var kill_player = true

func _on_body_entered(body):
	if !kill_player:
		pass
	else:
		print("player killed")
		kill_sound.play()
		timer.start()
		Engine.time_scale = 0.5
		body.move_local_y(-15)
		body.rotate(-20)
		body.get_node("CollisionShape2D").queue_free()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body):
	kill_player = false
	get_parent().emit_signal("tree_exiting") # this signal is handled by the parent (in our case: "slime") to perform actions
