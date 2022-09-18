extends Node2D

export var firstLevel: PackedScene 

onready var startButton := $CenterContainer/VBoxContainer/StartButton
onready var exitButton := $CenterContainer/VBoxContainer/Exit
onready var resumeButton := $CenterContainer/VBoxContainer/ResumeButton


func _get_configuration_warning():
	if !firstLevel:
		return "First level is not set"

func _ready():
	resumeButton.hide()
	startButton.grab_focus()


func _on_StartButton_pressed():
	get_tree().change_scene("res://src/scenes/Level.tscn")


func _on_Exit_pressed():
	get_tree().quit()
