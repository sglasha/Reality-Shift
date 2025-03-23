extends Node2D

func _on_timer_timeout() -> void:
	if $TileMap.is_visible_in_tree():
		$TileMap.hide()
	else:
		$TileMap.show()
