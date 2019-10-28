extends Node2D

var pre_shot = preload("res://scenes/shot.tscn")
var vel = 300 # velocity
var interval = .3
var last_shot = 0

func _ready():
	set_process(true)


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
	
	if Input.is_action_pressed("shot_"): # firing
		if last_shot <= 0:
			# print("shoot") # test
			var shot = pre_shot.instance()
			shot.set_global_position(get_global_position())
			get_node("../").add_child(shot)
			last_shot = interval
	
	if last_shot > 0:
		last_shot -= delta
