extends CanvasLayer


@onready var label_tiempo = $LabelTiempo
var tiempo_restante: float = 0.0
var contador_activo: bool = false


func _process(delta) :
		if contador_activo:
			tiempo_restante -= delta
			label_tiempo.text = "¡ESCAPA!: " + str(snapped(tiempo_restante, 0.1))
			
			if tiempo_restante <= 0:
				contador_activo = false
				get_tree().reload_current_scene()
		

func iniciar_cuenta_regresiva(segundos):
	tiempo_restante = segundos
	contador_activo = true
	label_tiempo.visible = true
