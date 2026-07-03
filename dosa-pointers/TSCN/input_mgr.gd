extends Node2D

@export var levelGenNode : Node2D
@export var playerTurnNo : int = -1
@export var currPlayerPlateNode : Node2D

@export var xOffset : float = 0
@export var yOffset : float = 0
@export var NINETYDEGTORAD : float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xOffset = 30.0
	yOffset = 30.0
	NINETYDEGTORAD = 90.0 * 0.0174533

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if _event is InputEventMouseButton and _event.button_index == MOUSE_BUTTON_LEFT:
		if _event.is_pressed():
			for k in levelGenNode.levelNode.size:
				if ((get_local_mouse_position().x >= (levelGenNode.levelNode.platesArr[k].position.x - xOffset)) && (get_local_mouse_position().x <= (levelGenNode.levelNode.platesArr[k].position.x + xOffset))) && ((get_local_mouse_position().y >= (levelGenNode.levelNode.platesArr[k].position.y - yOffset)) && (get_local_mouse_position().y <= (levelGenNode.levelNode.platesArr[k].position.y + yOffset))):
					print("Selected A Plate: " + str(levelGenNode.levelNode.platesArr[k].plateVal) + " with Team Number: " + str(levelGenNode.levelNode.platesArr[k].teamNo))
					currPlayerPlateNode = levelGenNode.levelNode.platesArr[k]
					playerTurnNo = levelGenNode.levelNode.platesArr[k].teamNo
					break
				else:
					playerTurnNo = -1

	if playerTurnNo != -1:
		if _event is InputEventKey and _event.keycode == KEY_SPACE:
			if _event.is_pressed():
				currPlayerPlateNode.rotate(NINETYDEGTORAD)

		if _event is InputEventKey and _event.keycode == KEY_UP:
			if _event.is_pressed():
				pass
