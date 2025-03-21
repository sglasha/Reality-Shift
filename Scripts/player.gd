extends CharacterBody2D

var player = true
const speed = 300.0
const jump = 300.0
const gravity = 400

func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Movement Physics
	if player:
		var horizontal_direction = Input.get_axis("move_left", "move_right")
		velocity.x = speed * horizontal_direction
		move_and_slide()
	
	# Gravity Physics
	if !is_on_floor():
		velocity.y += gravity * delta
	if velocity.y > 1000:
		velocity.y = 1000
	
	# Jump Physics
	if Input.is_action_just_pressed("jump") and is_on_floor() and player:
		velocity.y -= jump
	
	move_and_slide()
