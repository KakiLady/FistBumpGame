class_name CharacterInput extends Node

var _direction: Vector2
@export var device_id: int

var left: String = "left"
var right: String = "right"
var up: String = "up"
var down: String = "down"


func get_input() -> InputPackage:
	var input_package = InputPackage.new()
	input_package.direction = Input.get_vector(
		_to_input_string(left),
		_to_input_string(right),
		_to_input_string(up),
		_to_input_string(down),
	)
	return input_package


func _to_input_string(input_string: String) -> String:
	return input_string + "_" + str(device_id)
