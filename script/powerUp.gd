extends Area2D
signal on_power_picked

var screen_size = Vector2(1152 , 648)

func _ready() -> void:
	var randomX = randf_range(0, screen_size.x)
	var randomY = randf_range(0, screen_size.y)
	position = Vector2(randomX,randomY)

func _on_body_entered(body):
	on_power_picked.emit()
	queue_free()
	
