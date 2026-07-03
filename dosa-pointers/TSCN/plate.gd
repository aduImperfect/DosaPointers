@tool
extends Node2D

#0 - empty, 1 - 1 sides, 2 - 2 sides, 3 - 3 sides, 4 - 3 sides alternate, 5 - 4 sides  
static var texturePlatesA : Array[Texture]
static var texturePlatesB : Array[Texture]

static var platesACount : int = 0
static var platesBCount : int = 0

@export var plateVal : int = 0
#:
	#set(value):
		#plateVal = value
		#
		## 2. Trigger your in-editor update function
		#_refresh_editor_view() 
		#
		## 3. Force the Inspector UI panel to visually update
		#notify_property_list_changed() 

@export var teamNo : int = 0
#:
	#set(value):
		#teamNo = value
		#
		## 2. Trigger your in-editor update function
		#_refresh_editor_view() 
		#
		## 3. Force the Inspector UI panel to visually update
		#notify_property_list_changed() 

var sprite : Sprite2D

#static var initial_setup : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#static vars
	platesACount = 6
	platesBCount = 6
	_load_textures_a()
	_load_textures_b()

	#non-static vars
	sprite = get_child(0) as Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if initial_setup == false:
		##static vars
		#platesACount = 6
		#platesBCount = 6
		#_load_textures_a()
		#_load_textures_b()
		#initial_setup = true

	#MAKE SURE TO TURN THIS ON - IF PLAYING IN GAME AND TURN OFF THE ONE UNDER THE PROCESS FUNCTION
	_assign_plate_texture()
	pass

func _assign_plate_texture() -> void:
	if teamNo < 0 || teamNo > 1:
		print("Cannot assign team. Resetting to team A")
		teamNo = 0

	if plateVal < 0 || plateVal > 5:
		print("Cannot assign plate type. Resetting to basic plate")
		plateVal = 0

	if teamNo == 0:
		sprite.texture = texturePlatesA[plateVal]
	elif teamNo == 1:
		sprite.texture = texturePlatesB[plateVal]

static func _load_textures_a() -> void:
	for k in platesACount:
		texturePlatesA.append(load("res://Textures/PlateA_" + str(k) + ".png"))

static func _load_textures_b() -> void:
	for k in platesBCount:
		texturePlatesB.append(load("res://Textures/PlateB_" + str(k) + ".png"))

#func _refresh_editor_view() -> void:
	##MAKE SURE TO TURN THIS OFF - IF PLAYING IN GAME AND TURN ON THE ONE UNDER THE PROCESS FUNCTION
	##_assign_plate_texture()
	##print("REFRESH EDITOR VIEW!")
	#pass
