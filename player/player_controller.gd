extends Node2D

@export var points: int = 0

signal player_died()
signal player_scored_points(points: int)

func _ready():
	var timer: Timer = %Timer
	timer.timeout.connect(score_point)
	timer.start(1)
	var player: CharacterBody2D = %PlayerCharacter;
	player.died.connect(player_just_died)

func player_just_died():
	var particles: GPUParticles2D = %DiedParticles
	particles.global_position = %PlayerCharacter.global_position
	%Timer.stop()
	particles.restart()
	player_died.emit()

func score_point():
	points += 1
	player_scored_points.emit(points)
