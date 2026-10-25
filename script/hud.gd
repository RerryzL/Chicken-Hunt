extends CanvasLayer
signal  on_game_started

func _on_start_button_pressed():
	$MarginContainer/startButton.hide()
	$MarginContainer/gameLabel.hide()
	on_game_started.emit()
	print("begin")

func update_chicken(chicken_count):
	$MarginContainer/coinLabel.text = "Chicken : " + str(chicken_count)
	
func update_timer(timer_count):
	$MarginContainer/timerLabel.text = "Timer : " + str(timer_count)
	

	
