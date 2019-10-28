extends Node

var pre_meteor = preload("res://scenes/meteor.tscn")
var interval = 2

func _ready():
	set_process(true)

func _process(delta):
	if interval > 0:
		interval -= delta
	else:
		interval = rand_range(0.3, 1)
		var meteor = pre_meteor.instance()
		meteor.set_position(Vector2(rand_range(30, 610), -40))
		get_owner().add_child(meteor)
