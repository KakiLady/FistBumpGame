extends Node

func _process(delta):
	if Input.is_action_just_pressed("Exit"):
		get_tree().quit()
