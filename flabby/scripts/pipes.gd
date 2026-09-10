extends Node2D

class_name pipe_pair

signal bird_entered
signal point_scored

var speed = 0

func set_speed(new_speed) :
	speed = new_speed
func _process(delta: float) -> void:
	position.x = speed* delta
func on_body_entered(body):
	bird_entered.emit()
	
func on_point_scored(body):
	point_scored.emit()
