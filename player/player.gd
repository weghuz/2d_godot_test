extends CharacterBody2D

@export var speed = 400

signal died()

func get_input():
	if(Input.is_action_pressed("Pause")):
		SceneLoader.load_level(0)
	
	var input_direction = Vector2.ZERO
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	
	var is_inside_screen_area_right = global_position.x + 64 < viewport_size.x
	var is_inside_screen_area_left = global_position.x - 64 > 0
	var is_inside_screen_area_down = global_position.y + 64 < viewport_size.y
	var is_inside_screen_area_up = global_position.y - 64 > 0
	if (is_inside_screen_area_right):
		input_direction.x += Input.get_action_strength("Right")
	if (is_inside_screen_area_left):
		input_direction.x -= Input.get_action_strength("Left")
	if (is_inside_screen_area_down):
		input_direction.y += Input.get_action_strength("Down")
	if (is_inside_screen_area_up):
		input_direction.y -= Input.get_action_strength("Up")
		
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()

func take_damage(_damage: int):
	died.emit()
	call_deferred("queue_free")
