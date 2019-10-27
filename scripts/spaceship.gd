extends Node2D

var vel = 200 # velocity

func _ready():
	set_process(true)
	pass

func _process(delta):
	var l = 0
	var r = 0

	if Input.is_action_pressed("left_"):
		l = -1
	
	if Input.is_action_pressed("right_"):
		r = 1
	
	if get_position().x < 50:
		l = 0
		
	if get_position().x > (640 - 50):
		r = 0
	
	set_position(get_position() + Vector2(vel, 0) * delta * (l + r))
	
	pass