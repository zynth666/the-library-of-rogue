extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var speed = 200

var last_action = "none"

func get_current_action():
	var actions = InputMap.get_actions()
	
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
	
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
