#extends ProgressBar
#
#@export var player: Player
 #
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#player.health.connect(update)
	#update()
#
#func update():
	#value = player.currentHealth * 100 / player.maxHealth
