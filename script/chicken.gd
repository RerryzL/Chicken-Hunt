extends Area2D
signal on_chicken_picked
@onready var animasi = $AnimatedSprite2D

var screen_size = Vector2(1152 , 648)

func _ready() -> void:
	animasi.play("default")
	var randomX = randf_range(0, screen_size.x)
	var randomY = randf_range(0, screen_size.y)
	position = Vector2(randomX,randomY)

func _on_body_entered(body):
	on_chicken_picked.emit()
	queue_free()
	
	
	
