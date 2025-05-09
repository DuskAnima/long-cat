extends Node2D

var body_scene = load("res://scenes/body.tscn")
var last_body_instance = null # Variable para almascenar al último hijo

var grow = 1
var cat_grow = grow * -1 # Cantidad de distancia que crece la cabeza
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(_delta):
	$cat.move_cat_head()
	$cat.spawn_body()
	
	
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		$cat.move_cat_head()
		$cat.spawn_body()
		
