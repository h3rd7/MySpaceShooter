extends Area2D

var vel = 500 # velocity

func _ready():
	set_process(true)


func _process(delta):
	set_position(get_position() + Vector2(0, -1) * vel * delta)
	
	if get_position().y < -30: # clear memory
		# print("-1 shot") # test
		queue_free() # destroy shot
		
