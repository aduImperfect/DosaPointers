extends Node2D

@export var platesArr : Array[Node2D]
@export var xCol : int
@export var yRow : int
@export var size : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xCol = 10
	yRow = 6
	size = xCol * yRow
	_find_all_plates()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _find_all_plates() -> void:
	for k in size:
		platesArr.append(get_child(k))
