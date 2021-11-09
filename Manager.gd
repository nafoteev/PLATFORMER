extends Node2D

export var key_case = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func add_keys(new_keys = 1):
	 key_case += new_keys
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
