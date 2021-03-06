extends Area2D

var vel = 500 # velocity

func _ready():
	set_process(true)
	get_node("sample").play()


func _process(delta):
	set_position(get_position() + Vector2(0, -1) * vel * delta)
	
	if get_position().y < -30: # clear memory
		# print("-1 shot") # test
		queue_free() # destroy shot
		


func _on_shot_area_entered(area):
	# print(area.get_groups()) # test
	if area.is_in_group(game.GROUP_ENEMY):
		if area.has_method("apply_damage"):
			area.apply_damage(1)
		else:
			area.queue_free()
		queue_free()
