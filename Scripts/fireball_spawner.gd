extends Node2D

@onready var main = get_tree().get_root().get_node("World3")
@onready var final = get_tree().get_root().get_node("World7")
@onready var projectile = load("res://Reality-Shift/Sceens/fire_ball.tscn")

func _ready():
	shoot()

func shoot():
	var instance = projectile.instantiate()
	instance.spawnPos = global_position
	if Global.world == 3:
		main.add_child.call_deferred(instance)
	else:
		final.add_child.call_deferred(instance)

func _on_timer_timeout() -> void:
	shoot()
