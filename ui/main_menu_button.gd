extends Button

func _ready():
	pressed.connect(load_main_menu)

func load_main_menu():
	SceneLoader.load_level(0)
