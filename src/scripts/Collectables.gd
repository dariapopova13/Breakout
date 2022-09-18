extends Node2D

signal removeCollectable
signal showFinalText

var count: int
var startCount: int
var startTime

func _ready():
	for n in get_children():
		if n is Node:
			for c in n.get_children():
				c.connect("removedCollectable", self, "collectableRemoved")
				c.connect("removedCollectable",get_node("../Score"), "collectableRemoved")	
				count += 1
	startCount = count
	startTime = OS.get_ticks_msec()

func collectableRemoved():
	count -= 1
	if count == 0:
		emit_signal("showFinalText", true, startCount, startTime)
