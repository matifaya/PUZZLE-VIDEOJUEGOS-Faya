extends Area2D


@export var tiempo_limite: float = 35.0

func _on_body_entered(j):
	if (j.name == "Jugador"):
		j.tiene_llave= true
		var hud = get_parent().get_node("hud")
		if (hud):
			hud.iniciar_cuenta_regresiva(tiempo_limite)
		queue_free()
		
