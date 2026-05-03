extends Area2D


func _on_body_entered(j):
	#CORRECCION: Esta clase de validaciones no están buenas a largo plazo en proyectos grandes #dato
	if (j.name == "Jugador"):
		if(j.tiene_llave):
			get_tree().change_scene_to_file("res://Escenas/victoria.tscn")
