extends CharacterBody2D
@onready var animasi = $AnimatedSprite2D
var is_playing: bool = false

var speed = 5
var direction = Vector2(0,0)
var screen_size = Vector2(1152 , 648)

func _physics_process(delta: float) -> void:
	if(is_playing):
		if Input.is_action_pressed("ui_left"):
			animasi.flip_h = true
		if Input.is_action_pressed("ui_right"):
			animasi.flip_h = false
		calculate_direction()
		position += direction * speed
		limit_movement()
		update_animation()
	
func update_animation():
	if direction.y < 0:
		animasi.play("walk_up")
	elif direction.y > 0:
		animasi.play("walk_down")	
	elif direction.x != 0:
		animasi.play("walk_horizontal")
	else:
		animasi.play("idle")
		

func calculate_direction():
	direction = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1

		
func limit_movement():
	if position.x <= 0:
		position.x = 0 
	if position.x >= screen_size.x:
		position.x = 1152 
	if position.y <= 0:
		position.y = 0 
	if position.y >= screen_size.y:
		position.y = 648
