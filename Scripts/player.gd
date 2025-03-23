extends CharacterBody2D

var player = true
var swimming = false
var grav = false
var lastDirection = 0
const speed = 450.0
const jump = 400.0
const gravity = 1000
@onready var sprite = $playerSprite
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
	
	elif swimming:
		var horizontal_direction = Input.get_axis("left", "right")
		if horizontal_direction != 0:
			lastDirection = horizontal_direction
		velocity.x = speed * horizontal_direction / 3
		var vertical_direction = Input.get_axis("up", "down")
		if vertical_direction != 0:
			if grav:
				vertical_direction *= -1
		velocity.y = speed * vertical_direction / 2
		move_and_slide()
		
	if grav:
		sprite.flip_v = true
	else:
		sprite.flip_v = false
	
	# Gravity Physics
	if !is_on_floor() and player and !grav:
		velocity.y += gravity * delta
	elif !is_on_floor() and grav:
		velocity.y -= gravity * delta
	if velocity.y > 1000:
		velocity.y = 1000
	if velocity.y < -500:
		velocity.y = -500
	if swimming:
		velocity.y = speed / 4
		if grav:
			velocity.y = -speed / 4
		move_and_slide()
	
	# Jump Physics
	if Input.is_action_just_pressed("jump") and ((is_on_floor() || !coyoteTime.is_stopped()) || (grav and is_on_ceiling())) || (Global.world == 6 and (is_on_floor() || is_on_wall())) and player:
		velocity.y = 0
		if !grav:
			velocity.y -= jump
		if grav:
			velocity.y += jump
		move_and_slide()
	
	elif Input.is_action_just_pressed("jump") and (is_on_wall() || !coyoteTime.is_stopped()) and player:
		velocity.y = 0
		velocity.y -= jump
		move_and_slide()
	
func _on_water_change_state(state: bool) -> void:
	swimming = state
	player = !state

func _on_flip_gravity_change_grav(value: bool) -> void:
	grav = value
