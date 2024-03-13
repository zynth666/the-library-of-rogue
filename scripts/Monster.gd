class_name Monster extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	animated_sprite_2d.play("default")

func die():
	queue_free()
