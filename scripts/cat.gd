extends Sprite2D

var body_scene = load("res://scenes/body.tscn")
var last_body_instance = null # Variable para almascenar al último hijo

var grow = 0.1 # Variable que maneja que tantos pixeles crece por ejecusión.

func move_cat_head(): # Función que maneja el movimiento de la cabeza
	var fixed_grow = grow * -1 # Cantidad de distancia que crece la cabeza
	$".".global_position += Vector2(0, fixed_grow) # Actualiza la posición en base a la variable global gat_grow

func spawn_body(spawner_pos): # Función que maneja aparición y movimiento del cuerpo
	var body = body_scene.instantiate() # Se instancia el nodo del cuerpo
	if $".".get_child_count() == 1: #El nodo de la cabeza solo tiene 1 hijo, el cual es el marker
		$".".add_child(body) # Se agrega el nodo del cuerpo al nodo de la cabeza del gato
		body.position = Vector2($"."/bot.position) # Se posiciona en el marker2D del gato
		last_body_instance = body # Variable que almacena última instancia de body
	elif last_body_instance != null: # Si variable no es null
		var bot_body = last_body_instance.get_node("bot").global_position 
		if bot_body.y <= spawner_pos.y:
			last_body_instance.add_child(body)
			body.global_position = bot_body
			last_body_instance = body
