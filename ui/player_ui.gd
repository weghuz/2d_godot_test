extends CanvasLayer

var player_points: int

func game_over():
	%GameOver.visible = true
	%GameOverLabel.text = str("You died!\n", " Scored ", player_points, " points!")

func set_points(points: int):
	player_points = points
	%PointsLabel.text = str("Points: ", points)

func update_enemy_speed(speed: int):
	%EnemySpeedLabel.text = str("Enemy speed: ", speed)
