extends CharacterBody2D

@export var speed := 100            # Velocidade de movimento
@export var gravity := 900          # Gravidade
@export var direction_time_range := Vector2(0.5,0.5) # Intervalo aleatório p/ trocar direção

var direction: Vector2 = Vector2.ZERO
var dead := false

func _ready():
	randomize()
	# Direção inicial aleatória
	direction = choose([Vector2.RIGHT, Vector2.LEFT])
	# Inicia timer
	$DirectionTimer.wait_time = randf_range(direction_time_range.x, direction_time_range.y)
	$DirectionTimer.start()
	# Animação inicial
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()

func _physics_process(delta: float):
	if !is_on_floor():
		velocity.y += gravity * delta
	if dead:
		velocity.x = 0
	else:
		velocity.x = direction.x * speed
		$AnimatedSprite2D.play("attack")
	
	move_and_slide()

func choose(array: Array):
	array.shuffle()
	return array.front()

#func _on_DirectionTimer_timeout():
	#$DirectionTimer.wait_time = randf_range(direction_time_range.x, direction_time_range.y)
	#direction = choose([Vector2.RIGHT, Vector2.LEFT])
	#$AnimatedSprite2D.flip_h = (direction == Vector2.LEFT)
func _on_DirectionTimer_timeout():
	$DirectionTimer.wait_time = randf_range(direction_time_range.x, direction_time_range.y)
	if direction == Vector2.RIGHT:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT
		$AnimatedSprite2D.flip_h = (direction == Vector2.LEFT)
