extends Area2D

signal changeGrav(value : bool)

func _on_body_entered(body: Node2D) -> void:
	emit_signal("changeGrav", true)

func _on_body_exited(body: Node2D) -> void:
	emit_signal("changeGrav", false)
