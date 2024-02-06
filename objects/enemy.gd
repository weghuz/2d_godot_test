extends Area2D

@export var speed = 200
@export var damage = 25
@export var speed_scale = 10

signal speed_changed(speed: int)

var movement_direction: Vector2 = Vector2(1, 1)

func _ready():
	speed_changed.emit(speed)

func change_speed(direction: String):
	movement_direction[direction] *= -1
	speed += speed_scale
	speed_changed.emit(speed)

func _physics_process(delta):
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	
	var is_outside_screen_area_x: bool = (
		global_position.x + 64 > viewport_size.x
		|| global_position.x - 64 < 0
	);
	var is_outside_screen_area_y: bool = (
		global_position.y + 64 > viewport_size.y
		|| global_position.y - 64 < 0
	);
	
	if (is_outside_screen_area_x):
		change_speed("x")
	if (is_outside_screen_area_y):
		change_speed("y")
	
	var velocity = movement_direction * speed * delta
	
	global_position += velocity

func _on_body_entered(body: PhysicsBody2D):
	if (body.has_method("take_damage")):
		body.take_damage(damage)
	
