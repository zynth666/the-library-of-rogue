extends Label
@onready var player = $"../../Player"
var format = "Health: %s"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = format % player.life
