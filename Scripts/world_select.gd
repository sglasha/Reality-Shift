extends Node2D

var world = 1
var one = false
var two = false
var three = false
var four = false
var five = false
var six = false
var seven = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if one:
		$Glow/WSGlow1.show()
	if two:
		$Glow/WSGlow2.show()
	if three:
		$Glow/WSGlow3.show()
	if four:
		$Glow/WSGlow4.show()
	if five:
		$Glow/WSGlow5.show()
	if six:
		$Glow/WSGlow6.show()
	if seven:
		$Glow/WSGlow7.show()
		
	setWorld(world)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("down"):
		if world != 1:
			world -= 1
		elif one and two and three and four and five and six:
			world = 7
		else:
			world = 6
		setWorld(world)
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up"):
		if world != 7 and one and two and three and four and five and six:
			world += 1
		elif world != 6:
			world += 1
		else:
			world = 1
		setWorld(world)
	if Input.is_action_just_pressed("select"):
		if world == 1:
			$WorldSelections/WSWorld1.show()
		if world == 2:
			$WorldSelections/WSWorld2.show()
		if world == 3:
			$WorldSelections/WSWorld3.show()
		if world == 4:
			$WorldSelections/WSWorld4.show()
		if world == 5:
			$WorldSelections/WSWorld5.show()
		if world == 6:
			$WorldSelections/WSWorld6.show()
		if world == 7:
			$WorldSelections/WSWorld7.show()

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
