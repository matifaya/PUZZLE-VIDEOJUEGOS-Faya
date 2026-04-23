extends Area2D

@export var llave_objetivo : CanvasItem

func _on_body_entered(j):
	if (j.name == "Jugador"):
		j.get_node("PointLight2D").texture_scale = 3.4
		if llave_objetivo:
			llave_objetivo.material.light_mode = CanvasItemMaterial.LIGHT_MODE_UNSHADED
		
		get_parent().queue_free()
		
