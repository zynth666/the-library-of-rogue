class_name Monster extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var life = 30
@export var damage = 10

func _process(delta):
	animated_sprite_2d.play("default")

func hit(damage_received: int):
	life -= damage_received
	if life <= 0:
		die()

func attack(target: Player):
	target.life -= damage

func die():
	queue_free()
