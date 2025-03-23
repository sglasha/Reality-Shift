extends CharacterBody2D

@export var speed = 300
var spawnPos : Vector2

func _ready():
	global_position = spawnPos
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0, speed)
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
