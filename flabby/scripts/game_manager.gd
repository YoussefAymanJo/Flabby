extends Node
@onready var bird: Bird = $"../Bird" as Bird
@onready var pipespawner: Pipespawner = $"../pipespawner" as Pipespawner
@onready var ground: grounds = $"../Ground" as grounds

var points = 0

func _ready() -> void:
	bird.game_started.connect(on_game_started)
	ground.flabby_died.connect(end_game)
	pipespawner.flabby_died.connect(end_game)
	pipespawner.point_socred.connect(on_point_scored)
	print(points)
	 

func on_game_started():
	pipespawner.start_spawing_pipes()
	
func end_game():
	bird.kill()
	ground.stop()
	pipespawner.stop()
	
func on_point_scored():
	points+=1
	print(points)
