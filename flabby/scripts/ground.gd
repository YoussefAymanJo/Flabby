extends Node2D

class_name ground
@export var speed = 150

@onready var sprite_2d1: Sprite2D = $ground1/Sprite2D
@onready var sprite_2d2: Sprite2D = $ground2/Sprite2D

func _ready() -> void:
	sprite_2d2.global_position.x = sprite_2d1.global_position.x + sprite_2d1.texture.get_width()
	pass

func _process(delta: float) -> void:
	sprite_2d1.global_position.x = speed * delta
	sprite_2d2.global_position.x = speed * delta
	
	if sprite_2d1.global_position.x < -sprite_2d1.texture.get_width() :
		sprite_2d1.global_position.x = sprite_2d2.global_position.x + sprite_2d2.texture.get_width()
	if sprite_2d2.global_position.x < -sprite_2d2.texture.get_width() :
		sprite_2d2.global_position.x = sprite_2d2.global_position.x + sprite_2d2.texture.get_width()
	pass	
	 
