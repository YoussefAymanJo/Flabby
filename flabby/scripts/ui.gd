extends CanvasLayer

class_name UI
@onready var gameoverbox: VBoxContainer = $MarginContainer/gameoverbox
@onready var pointslabel: Label = $MarginContainer/pointslabel
@onready var best_score_label: Label = $MarginContainer/gameoverbox/Panel/Best_score
@onready var health_1: CharacterBody2D = $MarginContainer/Health1
@onready var health_2: CharacterBody2D = $MarginContainer/Health2
@onready var health_3: CharacterBody2D = $MarginContainer/Health3
@onready var level_score: Label = $MarginContainer/level_increased1/Panel/Level_Score
@onready var level_increased_1: VBoxContainer = $MarginContainer/level_increased1
@onready var timer: Timer = $MarginContainer/level_increased1/Timer

func _ready() -> void:
	pointslabel.text	 = "%d"  % 0
	#showing_best_score()
	level_increased_1.visible = false
	_on_timer_timeout()
func update_points(points : int) :
	pointslabel.text = "%d" % points
func on_game_over():
	gameoverbox.visible = true


func _on_button_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	Statues.point = 0
	Statues.lives = 3
	Statues.level = 0
	get_tree().reload_current_scene()
func showing_best_score() :
	best_score_label.text = "Best Score : %d" % Statues.best_score	
	pass
func showing_lives_left() :
	if Statues.lives == 2 :
		health_3.visible = false
	elif Statues.lives == 1 :
		health_2.visible = false
		health_3.visible = false
	elif Statues.lives == 0 :
		health_1.visible = false
		health_2.visible = false
		health_3.visible = false
	pass 
func level_increased() : 
	level_increased_1.visible = true
	level_score.text = "Level Increased: %d" % Statues.level
	timer.start()
	pass 

func _on_timer_timeout() -> void:
	level_increased_1.visible = false
	pass 
