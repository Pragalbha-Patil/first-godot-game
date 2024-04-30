extends Node

const TOTAL_COINS = 14
var score = 0
@onready var score_label = $ScoreLabel
@onready var win = $win

func add_point():
	score += 1
	if score >= TOTAL_COINS:
		score_label.text = "You completed the game!"
		win.play()
		Engine.time_scale = 0.01
	else:
		score_label.text = "You collected " + str(score) + " coins."
