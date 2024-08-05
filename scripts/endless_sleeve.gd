class_name EndlessSleeve extends Path2D

var texture :Texture

var is_left: bool

var sprites: Array[Sprite2D]

var start_last_point: Vector2
var start_global_position: Vector2

func _ready():
	var baked_points = curve.get_baked_points()
	for point in baked_points:
		var sprite = Sprite2D.new()
		sprite.position = point
		add_child(sprite)
		sprites.append(sprite)
	start_last_point = baked_points[-1]
	start_global_position = global_position

func _process(delta):
	var direction_multiplier = 1
	if is_left:
		direction_multiplier = -1
	curve.set_point_position(1,  start_last_point - Vector2(global_position.x - start_global_position.x , 0) * direction_multiplier)
	
	var baked_points = curve.get_baked_points()
	var nr_of_sprites = len(sprites)
	var nr_of_baked_points = len(baked_points)
	if nr_of_sprites < nr_of_baked_points:
		for i in range(nr_of_sprites, nr_of_baked_points):
			var sprite = Sprite2D.new()
			sprite.position = baked_points[i]
			add_child(sprite)
			sprites.append(sprite)
			if texture:
				sprite.texture = texture
	else:
		for i in range(nr_of_sprites- nr_of_baked_points):
			sprites[nr_of_sprites-i-1].queue_free()
			sprites.remove_at(nr_of_sprites-i-1)
	
	for i in range(min(nr_of_sprites, nr_of_baked_points)):
		sprites[i].position = baked_points[i]
	
	#for index in range(baked_points.size()):
	#	sprites[index].position = baked_points[index]
		
	
func set_texture(texture: Texture):
	self.texture = texture
	for sprite in sprites:
		sprite.texture = self.texture
