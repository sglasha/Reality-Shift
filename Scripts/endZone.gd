extends Node

func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Reality-Shift/Sceens/world_select.tscn")
	if Global.world == 1:
		Global.one = true
	if Global.world == 2:
		Global.two = true
	if Global.world == 3:
		Global.three = true
	if Global.world == 4:
		Global.four = true
	if Global.world == 5:
		Global.five = true
	if Global.world == 6:
		Global.six = true
	if Global.world == 7:
		Global.seven = true
