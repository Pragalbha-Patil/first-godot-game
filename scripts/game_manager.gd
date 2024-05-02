extends Node

const TOTAL_COINS = 15
var score = 0
@onready var score_label = $ScoreLabel
@onready var win_sfx = $win
@onready var timer = $Timer
@onready var music = get_node("/root/Music")

func add_point():
	score += 1
	if score >= TOTAL_COINS:
		music.queue_free()
		timer.start()
		Engine.time_scale = 0.3
		score_label.text = "You completed the game!"
		win_sfx.play()
		
	else:
		score_label.text = "You collected " + str(score) + " coins."


func _on_timer_timeout():
	score_label.text = "Game exiting!"
	get_tree().quit()
