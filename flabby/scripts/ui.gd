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
	get_tree().reload_current_scene()
