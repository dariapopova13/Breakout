tool
extends Area2D

signal removedCollectable

export var colour: Color

onready var rect := $ColorRect
onready var explosionTimer := $ExplosionTimer
onready var explosion := $Explosion

func _process(delta):
	pass

func _ready():
	explosion.hide()
	randomize()
	colour = Color(randf(), randf(), randf())
	rect.color = colour
	var material = explosion.process_material.duplicate();
	explosion.process_material = material
	material.set('shader_param/color_value',colour)
	material.set('shader_param/color_value',colour)

func _on_Collectable_body_entered(body):
	emit_signal("removedCollectable")
	startExplosion()

func startExplosion() -> void:	
	$CollisionShape2D.call_deferred("set", "disabled", true)
	$StaticBody2D/CollisionShape2D.call_deferred("set", "disabled", true)
	explosion.show()
	rect.hide()
	explosionTimer.start()

func _on_ExplosionTimer_timeout():
	queue_free()
