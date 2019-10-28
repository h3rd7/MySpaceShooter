extends Area2D

var vel = 250
var rot = 0 # rotation
var life = 4 

func _ready():
	add_to_group(game.GROUP_ENEMY) # group added 
	randomize()
	set_process(true)
	rot = rand_range(-2, 2)

func _process(delta):
	set_position(get_position() + Vector2(0, 1) * vel * delta)
	rotate(rot * delta)
	
func apply_damage(value):
	life -= value
	if life <= 0:
		queue_free()
