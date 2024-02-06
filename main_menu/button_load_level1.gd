extends Button

func _ready():
	self.pressed.connect(load_level1)

func load_level1():
	SceneLoader.load_level(1)
