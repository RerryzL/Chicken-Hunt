extends CanvasLayer
var number_count = 50
var max_number = 0

func _process(delta):
	$MarginContainer/number.text = str(number_count)
	if number_count == 0:
		$MarginContainer/label.text = "game over"
	else:
		$MarginContainer/label.text = "KEEP PRESSING"

func _on_press_pressed():
	if number_count != max_number:
		number_count -= 1
	else:
		pass
