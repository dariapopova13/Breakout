extends CenterContainer

export var mainMenu: PackedScene 

func _ready():
	hide()
	get_node("../Collectables").connect("showFinalText",self, "_on_FinalText_changeText")			


func _on_FinalText_changeText(win, score, startTime):
	show()
	var time = OS.get_ticks_msec() - startTime
	var minutes = int(time / 60 / 1000)
	var seconds = int(time / 1000) % 60
	$FinalTextTimer.start()
	if win:
		$Label.text =  "You won!\nYour score is " + String(score) + ".\nTime: " + String(minutes) + ":" + String(seconds)
	else:
		$Label.text =  "You lost!nYour score is " + String(score) + ".\nTime: " + String(minutes) + ":" + String(seconds)
	


func _on_FinalTextTimer_timeout():
	get_tree().change_scene("res://src/scenes/MainMenu.tscn")
