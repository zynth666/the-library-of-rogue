extends Sprite2D

@onready var attack_timer = $AttackTimer
@export var anchor: Node2D

var can_attack = true

func _on_player_attack():
	if can_attack:
		can_attack = false
		attack_timer.start()
		var projectile = preload("res://scenes/Crystal.tscn").instantiate()
		anchor.add_child(projectile)
		

func _on_attack_timer_timeout():
	can_attack = true
