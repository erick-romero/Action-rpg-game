extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 10
const FRICTION = 10

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello Game")

func _physics_process(delta):
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	inputVector = inputVector.normalized()
	
	if inputVector != Vector2.ZERO:
		velocity += inputVector  * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity) 

#func _process(delta):
#	pass
