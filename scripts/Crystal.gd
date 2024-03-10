extends RigidBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var speed = 650
var direction: Vector2

func _ready():
	direction = get_global_mouse_position().normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var motion = direction * speed * delta
	move_and_collide(motion)
