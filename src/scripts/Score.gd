extends MarginContainer

var score := 0
onready var label := $Label

func _ready():
	updateScore()


func collectableRemoved():
	score += 1
	updateScore()
	
func updateScore() -> void:
	label.text = String(score)
