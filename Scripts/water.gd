extends Node
signal changeState(state)

func _on_body_entered(body: Node2D) -> void:
	emit_signal("changeState", true)

func _on_body_exited(body: Node2D) -> void:
	emit_signal("changeState", false)
