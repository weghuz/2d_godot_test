extends Button

func _ready():
	self.pressed.connect(exit)

func exit():
	get_tree().quit()
