extends RigidBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 150
@export var damage = 10
@export var angle = 0
var direction: Vector2

func _ready():
	var mouse_pos = get_global_mouse_position()
	mouse_pos.x += angle
	direction = (mouse_pos - to_global(position)).normalized()
	rotate(get_angle_to(mouse_pos) - PI / 2)
	reparent(get_node("/root"))
	animated_sprite_2d.play("default")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var motion = direction * speed * delta
	var collision = move_and_collide(motion)
	
	if collision:
		queue_free()
		
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			mob.hit(damage)
		
