extends Button

var timer : Timer

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

func _on_pressed():
	

	timer.start(0.5)
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
