extends Node2D

@export var mob_scene: PackedScene
var score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#func game_over():
	#$ScoreTimer.stop()
	#$MobTimer.stop()
#
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	#$StartTimer.start()
