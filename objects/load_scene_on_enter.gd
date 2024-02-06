extends Area2D

var hit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	call_deferred("load_main_menu")
	
func load_main_menu():
	SceneLoader.load_level(0)
	
