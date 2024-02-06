extends Button

func _ready():
	pressed.connect(SceneLoader.restart_level)
