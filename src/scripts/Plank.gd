extends KinematicBody2D

signal respawnBall
signal reduceHealt

export var speed := 200.0

var velocity = Vector2(0, 100)

onready var rect := $ColorRect

func _ready():
	randomize()
	var colour = Color(randf(), randf(), randf())
	rect.color = colour

func _physics_process(delta):
	var direction = Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left")
	velocity.x = direction * speed
	velocity = move_and_slide(velocity)

func missBall(body):
	emit_signal("respawnBall")
