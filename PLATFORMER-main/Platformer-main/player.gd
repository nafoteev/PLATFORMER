extends KinematicBody2D

var vert_move=0

var horacc = 0

var speed = 15

var jumpForce = 500
var gravity = 700

func _ready():
	$"/root/Global".player = self

var vel = Vector2()

onready var imagePlayer = get_node("player")

func _physics_process(delta):
	var horacc = 0
	horacc += int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	vel.y = -1300 if Input.is_action_just_pressed("ui_up") and is_on_floor() else vel.y+9.8*5
	vel.x = lerp(vel.x, horacc*34000*delta, 15*delta if horacc!=0 else 15*delta)
	vel = move_and_slide(vel, Vector2(0, -1))
	
#	horacc += int(Input.is_action_pressed("ui_right")) -int(Input.is_action_pressed("ui_left")) 
#	vel.y = -30000 if Input.is_action_just_pressed("ui_up") and is_on_floor() else vel.y+98
#	vel.x = lerp(vel.x, vel.x+horacc*50, 0.9)
#	vel = move_and_slide(vel, Vector2(0, -1))
#	if Input.is_action_pressed("left"):	vel.x -= speed
#	if  Input.is_action_pressed("right"):
#		vel.x += speed
#
#	vert_move =- 300 if Input.is_action_pressed("up")and is_on_floor()  else vert_move+9.6*delta 
#
#	vel = move_and_slide(vel+Vector2(0,vert_move), Vector2.UP)
#	vert_move = vel.y
	
	if vel.x < 0:
		imagePlayer.flip_h = false
	if vel.x > 0:
		imagePlayer.flip_h = true

	
