extends Node

const GROUP_ENEMY = "enemies"

func _ready():
	pass

func getCamera():
	return get_tree().get_root().get_node("main").get_node("camera")