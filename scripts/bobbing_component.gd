class_name BobbingComponent extends Node
@export var position_offst_y: float = 0.0

var parent
var parent_start_position: Vector2
@onready var animation_player = $AnimationPlayer


func _ready():
	parent = get_parent()
	parent_start_position = parent.position
	animation_player.play("bobbing")

func _process(delta):
	if parent:
		parent.position = parent_start_position + Vector2(0,position_offst_y)
