extends KinematicBody2D

export var speed := 150.0

var startPosition: Vector2
var velocity := Vector2.ZERO

onready var respawnTimer = $RespawnTimer

func _ready():
	startPosition = position
	setStartVelocity()
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)

func respawnBall():
	position = startPosition
	velocity = Vector2.ZERO
	respawnTimer.start()

func setStartVelocity():
	randomize()
	velocity.y = [0.6, 1][randi() % 2]
	velocity.x = [-1,1][randi() % 2]


func _on_Bottom_body_entered(body):
	respawnBall()


func _on_RespawnTimer_timeout():
	setStartVelocity()
