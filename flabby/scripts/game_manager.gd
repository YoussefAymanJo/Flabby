extends Node
@onready var bird: Bird = $"../Bird" as Bird
@onready var pipespawner: Pipespawner = $"../pipespawner" as Pipespawner
@onready var ground: grounds = $"../Ground" as grounds
@onready var fade: Node = $"../Fade" as fade
@onready var die: AudioStreamPlayer2D = $"../die"
@onready var score: AudioStreamPlayer2D = $"../score"
@onready var ui: CanvasLayer = $"../UI" as UI
@onready var bgmusic: AudioStreamPlayer2D = $"../bgmusic"


var points = 0

func _ready() -> void:
	bird.game_started.connect(on_game_started)
	ground.flabby_died.connect(end_game)
	pipespawner.flabby_died.connect(end_game)
	pipespawner.point_socred.connect(on_point_scored)
	bgmusic.play()

func on_game_started():
	pipespawner.start_spawing_pipes()
	
func end_game():
	bird.kill()
	ground.stop()
	pipespawner.stop()
	die.play()
	if fade !=null:
		fade.play()
	ui.on_game_over()
func on_point_scored():
	points+=1
	score.play()
	ui.update_points(points)
