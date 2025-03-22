extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.one:
		$Glow/WSGlow1.show()
	if Global.two:
		$Glow/WSGlow2.show()
	if Global.three:
		$Glow/WSGlow3.show()
	if Global.four:
		$Glow/WSGlow4.show()
	if Global.five:
		$Glow/WSGlow5.show()
	if Global.six:
		$Glow/WSGlow6.show()
	if Global.seven:
		$Glow/WSGlow7.show()
		
	setWorld(Global.world)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("down"):
		if Global.world != 1:
			Global.world -= 1
		elif Global.one and Global.two and Global.three and Global.four and Global.five and Global.six:
			Global.world = 7
		else:
			Global.world = 6
		setWorld(Global.world)
	
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up"):
		if Global.world != 7 and Global.one and Global.two and Global.three and Global.four and Global.five and Global.six:
			Global.world += 1
		elif Global.world != 6:
			if Global.world != 7:
				Global.world += 1
			else:
				Global.world = 1
		else:
			Global.world = 1
		setWorld(Global.world)
	
	if Input.is_action_just_pressed("select"):
		if Global.world == 1:
			get_tree().change_scene_to_file("res://Reality-Shift/Sceens/world_1.tscn")
		if Global.world == 2:
			get_tree().change_scene_to_file("res://Reality-Shift/Sceens/world_2.tscn")
		if Global.world == 3:
			$WorldSelections/WSWorld3.show()
		if Global.world == 4:
			$WorldSelections/WSWorld4.show()
		if Global.world == 5:
			$WorldSelections/WSWorld5.show()
		if Global.world == 6:
			$WorldSelections/WSWorld6.show()
		if Global.world == 7:
			$WorldSelections/WSWorld7.show()

# Sets Highlight Image to show while the rest get hidden
func setWorld(new :int):
	$WorldSelections/WSWorld1.hide()
	$WorldSelections/WSWorld2.hide()
	$WorldSelections/WSWorld3.hide()
	$WorldSelections/WSWorld4.hide()
	$WorldSelections/WSWorld5.hide()
	$WorldSelections/WSWorld6.hide()
	$WorldSelections/WSWorld7.hide()
	
	if new == 1:
		$WorldSelections/WSWorld1.show()
	if new == 2:
		$WorldSelections/WSWorld2.show()
	if new == 3:
		$WorldSelections/WSWorld3.show()
	if new == 4:
		$WorldSelections/WSWorld4.show()
	if new == 5:
		$WorldSelections/WSWorld5.show()
	if new == 6:
		$WorldSelections/WSWorld6.show()
	if new == 7:
		$WorldSelections/WSWorld7.show()
