extends Node

class_name fade
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func _ready():
	color_rect.color.a = 0.0
	
func play():
	animation_player.play("fade")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
