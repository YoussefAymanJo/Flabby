extends Node

@onready var bird: Bird = $"../Bird" as Bird
@onready var pipespawner: Pipespawner = $"../pipespawner" as Pipespawner
@onready var ground: grounds = $"../Ground" as grounds
@onready var fade: Node = $"../Fade" as fade
@onready var die: AudioStreamPlayer2D = $"../die"
@onready var score: AudioStreamPlayer2D = $"../score"
@onready var ui: CanvasLayer = $"../UI" as UI
@onready var bgmusic: AudioStreamPlayer2D = $"../bgmusic"

var lives = 0
var points = 0 
var best_score = 0
var handling_hit = false


func _ready() -> void:
	bird.game_started.connect(on_game_started)
	ground.flabby_died.connect(end_game)
	pipespawner.flabby_died.connect(end_game)
	pipespawner.point_socred.connect(on_point_scored)
	bgmusic.play()
	points = Statues.point
	lives = Statues.lives
	best_score = Statues.best_score
func _process(delta: float) -> void:
	ui.update_points(points)
	ui.showing_best_score()
	Statues.point = points
	Statues.lives = lives
	Statues.best_score = best_score
	ui.showing_lives_left()
func on_game_started():
	pipespawner.start_spawing_pipes()

func end_game():
	if handling_hit:
		return
	handling_hit = true
	lives -= 1
	die.play()
	if lives > 0:
		get_tree().reload_current_scene()
		Statues.point = points
		Statues.lives = lives
		Statues.best_score = best_score
		handling_hit = false
	else:
		bird.kill()
		ground.stop()
		pipespawner.stop()
		if fade != null:
			fade.play()
		ui.on_game_over()

func on_point_scored():
	points += 1
	if points > best_score:
		best_score = points
	score.play()
	ui.update_points(points)
func increase_level():

	pass
