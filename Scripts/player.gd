extends CharacterBody2D

var player = true
var swimming = false
var lastDirection = 0
const speed = 450.0
const jump = 400.0
const gravity = 1000
@onready var coyoteTime = $CoyoteTime

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://Reality-Shift/Sceens/world_select.tscn")
	# Movement Physics
	if player:
		var horizontal_direction = Input.get_axis("left", "right")
		if horizontal_direction != 0:
			lastDirection = horizontal_direction
		velocity.x = speed * horizontal_direction
		var wasOnFloor = is_on_floor()
		move_and_slide()
		if wasOnFloor and !is_on_floor() || is_on_wall():
			coyoteTime.start()
	
	# Gravity Physics
	if !is_on_floor():
		velocity.y += gravity * delta
	if velocity.y > 1000:
		velocity.y = 1000
	
	# Jump Physics
	if Input.is_action_just_pressed("jump") and (is_on_floor() || !coyoteTime.is_stopped()) and player:
		velocity.y = 0
		velocity.y -= jump
		move_and_slide()
	
	elif Input.is_action_just_pressed("jump") and (is_on_wall() || !coyoteTime.is_stopped()) and player:
		velocity.y = 0
		velocity.y -= jump
		move_and_slide()
		
