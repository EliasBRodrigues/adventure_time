extends CharacterBody2D

#signal hit

@export var speed = 400 # Velocidade do personagem
var screen_size # Tamanho da tela
var jump_speed = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	_actions()
	_jumping(delta)
	move_and_slide()

func _actions() -> void:
	velocity.x = 0 # Só zera o x, não todo o vetor!
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	if velocity.x != 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif Input.is_action_pressed("attacks"):
		_attack()
	else:
		$AnimatedSprite2D.play("default")

func _jumping(delta):
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = jump_speed

func _attack():
	$AnimatedSprite2D.play("attack")

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
