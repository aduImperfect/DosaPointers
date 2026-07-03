extends Node2D

@export var levelGenNode : Node2D
@export var playerTurnNo : int = -1
@export var currPlayerPlateNode : Node2D

@export var currNodePos : int = 0
@export var leftNodePos : int = 0
@export var rightNodePos : int = 0
@export var upNodePos : int = 0
@export var downNodePos : int = 0

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

					#CURRENT PLAYER NODE
					currPlayerPlateNode = levelGenNode.levelNode.platesArr[k]
					currNodePos = k

					playerTurnNo = levelGenNode.levelNode.platesArr[k].teamNo
					break
				else:
					playerTurnNo = -1

	if playerTurnNo != -1:
		#LEFT NODE
		if (currNodePos - levelGenNode.levelNode.yRow) < 0:
			leftNodePos = currNodePos
		else:
			leftNodePos = currNodePos - levelGenNode.levelNode.yRow

		#RIGHT NODE
		if (currNodePos + levelGenNode.levelNode.yRow) >= levelGenNode.levelNode.size:
			rightNodePos = currNodePos
		else:
			rightNodePos = currNodePos + levelGenNode.levelNode.yRow

		#UP NODE
		if (currNodePos % levelGenNode.levelNode.yRow) == 0:
			upNodePos = currNodePos
		else:
			upNodePos = currNodePos - 1

		#DOWN NODE
		if (currNodePos % levelGenNode.levelNode.yRow) == (levelGenNode.levelNode.yRow - 1):
			downNodePos = currNodePos
		else:
			downNodePos = currNodePos + 1


		if _event is InputEventKey and _event.keycode == KEY_SPACE:
			if _event.is_pressed():
				currPlayerPlateNode.rotate(NINETYDEGTORAD)

		var currPlateVal : int = levelGenNode.levelNode.platesArr[currNodePos].plateVal
		var currTeamNo : int = levelGenNode.levelNode.platesArr[currNodePos].teamNo
		var currRot : float = levelGenNode.levelNode.platesArr[currNodePos].rotation

		var upPlateVal : int = levelGenNode.levelNode.platesArr[upNodePos].plateVal
		var upTeamNo : int = levelGenNode.levelNode.platesArr[upNodePos].teamNo
		var upRot : float = levelGenNode.levelNode.platesArr[upNodePos].rotation

		var downPlateVal : int = levelGenNode.levelNode.platesArr[downNodePos].plateVal
		var downTeamNo : int = levelGenNode.levelNode.platesArr[downNodePos].teamNo
		var downRot : float = levelGenNode.levelNode.platesArr[downNodePos].rotation

		var leftPlateVal : int = levelGenNode.levelNode.platesArr[leftNodePos].plateVal
		var leftTeamNo : int = levelGenNode.levelNode.platesArr[leftNodePos].teamNo
		var leftRot : float = levelGenNode.levelNode.platesArr[leftNodePos].rotation

		var rightPlateVal : int = levelGenNode.levelNode.platesArr[rightNodePos].plateVal
		var rightTeamNo : int = levelGenNode.levelNode.platesArr[rightNodePos].teamNo
		var rightRot : float = levelGenNode.levelNode.platesArr[rightNodePos].rotation

		if _event is InputEventKey and _event.keycode == KEY_UP:
			if _event.is_pressed():
				levelGenNode.levelNode.platesArr[upNodePos].plateVal = currPlateVal
				levelGenNode.levelNode.platesArr[upNodePos].teamNo = currTeamNo
				levelGenNode.levelNode.platesArr[upNodePos].rotation = currRot
				levelGenNode.levelNode.platesArr[currNodePos].plateVal = upPlateVal
				levelGenNode.levelNode.platesArr[currNodePos].teamNo = upTeamNo
				levelGenNode.levelNode.platesArr[currNodePos].rotation = upRot
				currNodePos = upNodePos

		if _event is InputEventKey and _event.keycode == KEY_DOWN:
			if _event.is_pressed():
				levelGenNode.levelNode.platesArr[downNodePos].plateVal = currPlateVal
				levelGenNode.levelNode.platesArr[downNodePos].teamNo = currTeamNo
				levelGenNode.levelNode.platesArr[downNodePos].rotation = currRot
				levelGenNode.levelNode.platesArr[currNodePos].plateVal = downPlateVal
				levelGenNode.levelNode.platesArr[currNodePos].teamNo = downTeamNo
				levelGenNode.levelNode.platesArr[currNodePos].rotation = downRot
				currNodePos = downNodePos

		if _event is InputEventKey and _event.keycode == KEY_LEFT:
			if _event.is_pressed():
				levelGenNode.levelNode.platesArr[leftNodePos].plateVal = currPlateVal
				levelGenNode.levelNode.platesArr[leftNodePos].teamNo = currTeamNo
				levelGenNode.levelNode.platesArr[leftNodePos].rotation = currRot
				levelGenNode.levelNode.platesArr[currNodePos].plateVal = leftPlateVal
				levelGenNode.levelNode.platesArr[currNodePos].teamNo = leftTeamNo
				levelGenNode.levelNode.platesArr[currNodePos].rotation = leftRot
				currNodePos = leftNodePos

		if _event is InputEventKey and _event.keycode == KEY_RIGHT:
			if _event.is_pressed():
				levelGenNode.levelNode.platesArr[rightNodePos].plateVal = currPlateVal
				levelGenNode.levelNode.platesArr[rightNodePos].teamNo = currTeamNo
				levelGenNode.levelNode.platesArr[rightNodePos].rotation = currRot
				levelGenNode.levelNode.platesArr[currNodePos].plateVal = rightPlateVal
				levelGenNode.levelNode.platesArr[currNodePos].teamNo = rightTeamNo
				levelGenNode.levelNode.platesArr[currNodePos].rotation = rightRot
				currNodePos = rightNodePos

		currPlayerPlateNode = levelGenNode.levelNode.platesArr[currNodePos]
