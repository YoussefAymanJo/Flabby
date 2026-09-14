extends CanvasLayer

class_name UI
@onready var gameoverbox: VBoxContainer = $MarginContainer/gameoverbox
@onready var pointslabel: Label = $MarginContainer/pointslabel

func _ready() -> void:
	pointslabel.text	 = "%d"  % 0
func update_points(points : int) :
	pointslabel.text = "%d" % points
func on_game_over():
	gameoverbox.visible = true


func _on_button_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	Statues.point = 0
	Statues.lives = 3
	get_tree().reload_current_scene()
func showing_best_score(best_score : int) :
	pass
func showing_lives_left(lives : int) :
	pass 
func level_increased(level : int) : 
	pass 
