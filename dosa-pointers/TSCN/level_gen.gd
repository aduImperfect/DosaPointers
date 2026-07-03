extends Node2D

const LEVEL_SCENE = preload("res://TSCN/level.tscn")

@export var xLevelCenter : float = 0.0
@export var yLevelCenter : float = 0.0

@export var levelNode : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xLevelCenter = 0.0
	yLevelCenter = 0.0

	_spawn_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _spawn_level() -> void:
	var level_instance = LEVEL_SCENE.instantiate()
	level_instance.global_position.x = xLevelCenter
	level_instance.global_position.y = yLevelCenter
	add_child(level_instance)
	levelNode = level_instance
