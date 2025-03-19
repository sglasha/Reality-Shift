extends Node2D

var world = 1
var one = false
var two = false
var three = false
var four = false
var five = false
var six = false
var seven = false

func setWorld(new :int, old :int):
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
		
	if old == 1:
		$WorldSelections/WSWorld1.hide()
	if old == 2:
		$WorldSelections/WSWorld2.hide()
	if old == 3:
		$WorldSelections/WSWorld3.hide()
	if old == 4:
		$WorldSelections/WSWorld4.hide()
	if old == 5:
		$WorldSelections/WSWorld5.hide()
	if old == 6:
		$WorldSelections/WSWorld6.hide()
	if old == 7:
		$WorldSelections/WSWorld7.hide()

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
		
	$WorldSelections/WSWorld1.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("down"):
		if world != 1:
			world -= 1
			setWorld(world, world + 1)
		else:
			world = 7
			setWorld(world, 1)
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up"):
		if world != 7:
			world += 1
			setWorld(world, world - 1)
		else:
			world = 1
			setWorld(world, 7)
