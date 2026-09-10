extends Node

class_name Pipespawner 
signal flabby_died
signal point_socred
var pipe_pair_scene = preload("res://scences/pipes.tscn")

@export var pipe_speed = -150
@onready var spawn_time = $Timer

func _ready() -> void:
	spawn_time.timeout.connect	(spawn_pipe)
	spawn_time.start()
	pass
func start_spawing_pipes():
	pass
func spawn_pipe():
	var pipe = pipe_pair_scene.instantiate() as  pipe_pair
	add_child(pipe)
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport_rect.end.x
	
	var half_height = viewport_rect.size.y/2
	pipe.position.y = randf_range(viewport_rect.size.y * 0.15 - half_height , viewport_rect.size.y * 0.65 - half_height )
	pipe.bird_entered.connect(on_bird_entered)
	pipe.point_scored.connect(on_point_scored)
	pipe.set_speed(pipe_speed)
	pass
	
func on_bird_entered():
	flabby_died.emit()
	stop()
func stop():
	spawn_time.stop()
	for pipe in get_children().filter(func (child) : return child is pipe_pair):
		(pipe as pipe_pair).speed = 0
		
	pass
func on_point_scored():
	point_socred.emit()
