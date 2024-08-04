extends Area2D

@onready var fist_bump = %fist_bump




func _on_area_entered(area):
	area.modulate = Color.DARK_RED
	print("yes!")

	
	
