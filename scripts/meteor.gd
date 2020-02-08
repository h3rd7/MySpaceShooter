extends Area2D

var vel = 150
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
	if get_position().y > 500:
		# print("-1 meteor") # test
		queue_free()
	
func apply_damage(value):
	get_node("anim").play("hit")
	life -= value
	if life <= 0:
		get_node("sample").play()
		set_process(false)
		set_z_index(10) #set_z(10)
		remove_from_group(game.GROUP_ENEMY)
		get_node("anim").play("destroy")
		game.getCamera().shake()
