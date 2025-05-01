extends Node2D

var body_scene = load("res://scenes/body.tscn")
var last_body_instance = null # Variable para almascenar al último hijo
var first_input_check = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(event):
	var catPosition = $cat.position
	if event is InputEventKey and event.pressed:
		catPosition += Vector2(0, -6)
		$cat.position = catPosition
		#Se instancia body
		var body_instance = body_scene.instantiate()
		
		if last_body_instance != null:
		# Si ya existe una instancia previa, hacer que la nueva instancia sea hija de la anterior
			last_body_instance.add_child(body_instance)
		else:
		# Si es la primera instancia, añadirla directamente a 'cat'
			$cat.add_child(body_instance)
		last_body_instance = body_instance
		
		if first_input_check == false:
			body_instance.position = Vector2(0, 11)
		else:
			body_instance.position = Vector2(0, 9)
		print("loooong")
		first_input_check = true
