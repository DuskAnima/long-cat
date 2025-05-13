extends Node2D

@onready var spawner_pos: Vector2 = $Spawner.global_position
@onready var cat: Sprite2D = $cat
var pats_counter = 0
var personas = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(_delta):
	pass
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		pet_the_cat()
		
func pet_the_cat():
	pats_counter = pats_counter + 1
	cat.move_cat_head()
	cat.spawn_body(spawner_pos)
	$pats.scale = Vector2(0.5, 0.5)
	$pats.text = "Le has hecho %s pats al gato" % [pats_counter]

func neighbors ():
	pet_the_cat()
	Timer.TIMER_PROCESS_IDLE
