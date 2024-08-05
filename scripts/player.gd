extends CharacterBody2D

@export var speed = 400
@export var is_left: bool = true
@export var sleeve_texture: Texture
@export var sleeve_texture_repeating: Texture


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var character_input: CharacterInput = $CharacterInput
@onready var fist = $fist
@onready var sleeve = $fist/sleeve
@onready var endless_sleeve = $fist/EndlessSleeve



func _ready():
	if is_left: 
		scale.x *= 1
	else: 
		scale.x *= -1
	
	sleeve.texture = sleeve_texture
	endless_sleeve.set_texture(sleeve_texture_repeating)
	endless_sleeve.is_left = is_left
	

func _physics_process(delta):
	# Add the gravity.
	
	var input = character_input.get_input()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	velocity = input.direction * SPEED

	move_and_slide()
	input.queue_free()
