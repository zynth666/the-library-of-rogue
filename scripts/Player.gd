class_name Player extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var speed = 100
@export var life = 100

var last_action = "none"

signal attack
signal is_hit

func handle_attack():
	if Input.is_action_pressed("attack"):
		attack.emit()
	

func get_current_action():
	var actions = ["left", "right", "up", "down"]
	
	for action in actions:
		if Input.is_action_pressed(action):
			return action
	
	return "none"

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var current_action = get_current_action()
	
	if current_action != "none":
		animated_sprite_2d.play("walk_" + current_action)
		last_action = current_action
	elif last_action != "none":
		animated_sprite_2d.play("idle_" + last_action)
	else:
		animated_sprite_2d.play("idle_down")
		
	handle_attack()
	
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("mob"):
			var mob = collision.get_collider()
			mob.attack(self)
			is_hit.emit(mob.damage)
