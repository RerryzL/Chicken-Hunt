extends Node2D
var chicken_scene = preload("res://chicken.tscn")
var power_scene = preload("res://powerUp.tscn")
var is_playing: bool = false
var screen_size = Vector2(1152 , 648)

var level = 1
var chicken_count = 0
var timer_count = 10
var max_coin = 7
var max_power = 3
var power_time = 1

func _process(delta):
	if(is_playing && get_tree().get_nodes_in_group("coinGroup").size() == 0):
		level += 1
		timer_count += 5
		$HUD.update_timer(timer_count)
		generate_coin()

func clear_coin():
	var coin_list : Array = get_tree().get_nodes_in_group("coinGroup")
	for coin in coin_list:
		coin.queue_free()
func clear_power():
	var power_list : Array = get_tree().get_nodes_in_group("powerGroup")
	for power in power_list:
		power.queue_free()

func update_chicken():
	chicken_count += 1
	$HUD.update_chicken(chicken_count)
func update_time():
	timer_count += 5

func generate_coin():
	for n in range(max_coin + (level - 1)):
		var chicken_instance = chicken_scene.instantiate()
		add_child(chicken_instance)
		chicken_instance.on_chicken_picked.connect(update_chicken)
	
func start():
	$player.is_playing = true
	is_playing = true
	max_coin = 7
	chicken_count = 0
	timer_count = 10
	level = 1
	generate_coin()
	$powerTime.start()
	$Timer.start()
	$player.position = Vector2((1152 / 2) , (648 / 2))

func game_over():
	$player/AnimatedSprite2D.play("death")
	$player.is_playing = false
	is_playing = false
	
	clear_coin()
	clear_power()
	$Timer.stop()
	$powerTime.stop()
	$powerOut.stop()
	
	$HUD/MarginContainer/startButton.text = "Play Again"
	$HUD/MarginContainer/gameLabel.text = "GAME OVER"
	$HUD/MarginContainer/gameLabel.show()
	$HUD/MarginContainer/startButton.show()
	

func _on_timer_timeout():
	timer_count -= 1
	$HUD.update_timer(timer_count)
	if timer_count == 0:
		game_over()
		print("gameover")

func _on_hud_on_game_started() -> void:
	start()

func _on_campfire_body_entered(body: Node2D) -> void:
	game_over()


func _on_power_time_timeout() -> void:
	var power_instance = power_scene.instantiate()
	add_child(power_instance)
	power_instance.on_power_picked.connect(update_time)
	$powerOut.start()

func _on_power_out_timeout() -> void:
	clear_power()
