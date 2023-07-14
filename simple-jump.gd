extends KinematicBody2D

const GRAVITY = 800
const MOVE_SPEED = 200
var velocity = Vector2.ZERO
const JUMP_FORCE = -400
var is_on_floor = false

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1

	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	velocity.x = input_vector.x * MOVE_SPEED
	
	is_on_floor = is_on_floor()

	if is_on_floor and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_FORCE
