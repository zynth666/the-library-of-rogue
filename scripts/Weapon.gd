extends Sprite2D

@onready var attack_timer = $AttackTimer
@export var num_projectiles = 1
var can_attack = true

func _on_player_attack():
	if can_attack:
		can_attack = false
		attack_timer.start()
		for num in num_projectiles:
			var projectile = preload("res://scenes/Crystal.tscn").instantiate()
			if num_projectiles > 1:
				projectile.angle = num * 100
			add_child(projectile)
		

func _on_attack_timer_timeout():
	can_attack = true
