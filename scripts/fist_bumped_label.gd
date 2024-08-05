extends Label

@onready var animation_player = $AnimationPlayer


func _on_fist_bump_area_area_entered(area):
	
	animation_player.play("pop_up_animation")
	
