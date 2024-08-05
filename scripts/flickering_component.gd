class_name FlickeringComponent extends Node

var _timer: Timer
@onready var animation_player = $AnimationPlayer

@export var min_duration: float = 0.2
@export var max_duration: float = 5
@export var target_is_visible: bool = true

@onready var target

func _ready():
	target_is_visible = true
	target = get_parent()
	_timer = Timer.new()
	_timer.autostart = false
	_timer.one_shot = true
	_timer.timeout.connect(_flicker)
	_timer.timeout.connect(_start_timer)
	add_child(_timer)
	_start_timer()

func _start_timer():
	var duration = randf_range(min_duration, max_duration)
	_timer.start(duration)

func _process(delta: float):
	if target:
		target.visible = target_is_visible

func _flicker():
	animation_player.play("flicker")
