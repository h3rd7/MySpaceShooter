extends Area2D

var vel = 250
var rot = 0 # rotation

func _ready():
	randomize()
	set_process(true)
	rot = rand_range(-2, 2)

func _process(delta):
	set_position(get_position() + Vector2(0, 1) * vel * delta)
	rotate(rot * delta)