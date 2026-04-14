extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
var speed = 100.0
var last_direction = "Abajo"

func _physics_process(delta):
	get_input()
	move_and_slide()

func get_input():
	var input_dir = Input.get_vector("left", "right", "upw", "downs")
	
	if input_dir == Vector2.ZERO:
		velocity = Vector2.ZERO
		update_animation("quieto")
		return
	
	var dir_horizontal = ""
	var dir_vertical = ""
	
	if input_dir.x > 0.1:
		dir_horizontal = "Der"
	elif input_dir.x < -0.1:
		dir_horizontal = "Izq"
		
	if input_dir.y > 0.1:
		dir_vertical = "Abajo"
	elif input_dir.y < -0.1:
		dir_vertical = "Arriba"
		
	if dir_horizontal != "" and dir_vertical != "":
		last_direction = dir_vertical + dir_horizontal
	elif dir_horizontal != "":
		last_direction = dir_horizontal
	elif dir_vertical != "":
		last_direction = dir_vertical

	update_animation("caminar")
	velocity = input_dir * speed

func update_animation(state):
	animated_sprite.play(state + "_" + last_direction)
