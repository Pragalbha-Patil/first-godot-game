extends Area2D

@onready var timer = $Timer
@onready var kill_sound = $kill

func _on_body_entered(body):
	print("You died!")
	kill_sound.play()
	timer.start()
	Engine.time_scale = 0.5
	body.move_local_y(-15)
	body.rotate(-20)
	body.get_node("CollisionShape2D").queue_free()
	


func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
